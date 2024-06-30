import React, { useCallback, useEffect, useState } from 'react';
import { debounce } from 'lodash';
import styles from './products.module.scss';
import Paginate from '../../bundles/Paginate';
import { get, patch, post } from '../../lib/http';
import Filters from './Filters/Filters';
import Orders from './Orders';
import { Link } from '@reach/router';
import { useGenericData } from '../../bundles/GeneralContext';
import Product from './Product';
import { useTranslation } from 'react-i18next';
import Icon from '../../bundles/Icon';
import toast from 'react-hot-toast';
import Loading from '../../bundles/Loading';

const Products = ( ) => {
  const { currentUser, setCurrentUser } = useGenericData();

  const [products, setProducts ] = useState([]);
  const [loading, setLoading] = useState(true);
  const [errors, setErrors] = useState(null);
  const [isOpen, setIsOpen] = useState(false);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [typeProducts, setTypeProducts ] = useState([]);
  const [page, setPage ] = useState(1);
  const [maxPage, setMaxPage] = useState(null);
  const [totalPrice, setTotalPrice] = useState(currentUser?.totalPrice || null)
  const [query, setQuery ] = useState({ search: '', favorites: false, category: ''})

  const { t } = useTranslation('translation', { keyPrefix: 'products.products' });


  useEffect(() => {
    if (selectedProduct) {
      const product = products.find(product => product.id === selectedProduct.id);
      setSelectedProduct(product);
    }
  }, [products, selectedProduct]);

  const debouncedFetchProducts = useCallback(
    debounce((query, page) => {
      const params = { page, ...query };
      try {
        get('products', params).then(({ typeProducts, meta, products }) => {
          setProducts(products.products);
          setTypeProducts(typeProducts);
          setPage(parseInt(meta.paginate.page));
          setMaxPage(meta.paginate.maxPage);
          setLoading(false);
        });
      } catch (error) {
        console.log("Error", error);
      }
    }, 150), []
  );

  useEffect(() => {
    debouncedFetchProducts(query, page);
  }, [query, page, debouncedFetchProducts]);

  const handleAddProductToCart = (product) => {
    try {
      post(`cart/add_product/${product.id}`).then((res) => {
        updateProductInStateIsSelected(product);

        setCurrentUser(res)
      });
    } catch (error) {
      console.log('error', error);
    }
  };

  const calculatePrice = (product) => {
    return product.isDiscountActive ? product.discountPrice : product.price
  }

  const handleIncrementQuantity = (product) => {
    patch(`products/${product.id}/increment_quantity`).then(() =>
      updateProductStateIncQuantity(product)
    ).catch((err) => console.log('error', err));
  }

  const handleDecrementQuantity = (product) => {
    patch(`products/${product.id}/decrement_quantity`).then(() =>
      updateProductStateDecQuantity(product)
    ).catch((err) => console.log('error', err));
  }

  const handleToggleFavorite = (product) => {
    try {
      post(`products/${product.id}/toggle_favorite`).then(() => {
        updateProductStateFavoriteStatus(product);
      });
    } catch (error) {
      console.log('error', error);
    }
  }

  const handleCheckout = () => {
    const params = {
      page,
      ...query
    };

    post(`cart/checkout`).then((res) => {
      setCurrentUser(res)
      toast.success('Order placed!')

      get('products', params).then(({ products, }) => {
        setProducts(products.products)
      })
    }).catch((data) => setErrors(data.errors));
  }

  const handleCancelOrder = (order_id) => {
    patch(`profile/orders/${order_id}/cancel`).then((res) =>
      setCurrentUser(res)
    ).catch((err) => console.log('error', err))
  }

  const handleShowProduct = (product) => {
    setSelectedProduct(product)
    setIsOpen(true)
  }

  const updateProductInStateIsSelected = (current_product) => {
    setTotalPrice((prevPrice) => prevPrice + calculatePrice(current_product) )
    setProducts((prevProducts) =>
      prevProducts.map((product) =>
        product.id === current_product.id ? { ...product, isSelected: true, countOrderedProduct: 1 } : product
      )
    );
  };

  const updateProductStateIncQuantity = (current_product) => {
    setTotalPrice((prevPrice) => prevPrice + calculatePrice(current_product) )
    setProducts((prevProducts) =>
      prevProducts.map((product) =>
        product.id === current_product.id ? { ...product, countOrderedProduct: product.countOrderedProduct + 1} : product
      )
    );
  };

  const updateProductStateFavoriteStatus = (current_product) => {
    setProducts((prevProducts) =>
      prevProducts.map((product) =>
        product.id === current_product.id ? { ...product, isFavoriteProduct: !product.isFavoriteProduct} : product
      )
    );
  };

  const updateProductStateDecQuantity = (current_product) => {
    setTotalPrice((prevPrice) => prevPrice - calculatePrice(current_product) )
    setProducts((prevProducts) =>
      prevProducts.map((product) =>
        product.id === current_product.id
          ? {
            ...product,
              countOrderedProduct: product.countOrderedProduct - 1 === 0 ? null : product.countOrderedProduct - 1,
              isSelected: product.countOrderedProduct - 1 !== 0
            }
          : product
      )
    );
  };

  const activeOrders = currentUser?.activeOrders
  const actions = {
    handleDecrementQuantity,
    handleIncrementQuantity,
    handleAddProductToCart,
    handleToggleFavorite
  }

  return (
    <>
      {currentUser && (
        <div className='m-2'>
          <div>
            {currentUser.cart && totalPrice > 0 && (
              <div>
                <div className='d-flex gap-1'>
                  <Link className='btn btn-info text-white fw-bold' to="/cart">
                    <div className='d-flex align-items-center gap-2'>
                      <div>{t('navbar.cart')}</div>
                      <Icon name='bag'/>
                    </div>
                  </Link>
                </div>
                <button className='my-2 btn btn-primary fw-bold' onClick={handleCheckout}>
                  <div className='d-flex align-items-center gap-2'>
                    <div>{t('navbar.checkout')}</div>
                    <Icon name='bagCheck'/>
                  </div>
                </button>
                <p>{t('navbar.total_price')}: {totalPrice}</p>
              </div>
            )}
          </div>
          <div>
            {activeOrders.length > 0 && (
              <Orders handleCancelOrder={(order_id) => handleCancelOrder(order_id)} activeOrders={activeOrders} />
            )
            }
          </div>
        </div>
      )}
      <Filters query={query} typeProducts={typeProducts} setQuery={setQuery} currentUser={currentUser} />
      <Paginate setPage={setPage} page={page} maxPage={maxPage}/>
      {errors && (
        <div className="mt-3 alert alert-danger">
          <p>{errors}</p>
        </div>
      )}
      {isOpen && <Product
        actions={actions}
        currentUser={currentUser}
        isOpen={isOpen}
        setIsOpen={setIsOpen}
        product={selectedProduct}/>
      }
      <div className="mt-5">
        <div className="row row-cols-2 row-cols-md-6">
          {loading ?  <Loading/> : products.length > 0 ? products.map((product) => (
            <div key={product.id} className='col mb-4'>
              <div className={`card ${styles.mainProduct}`}>
                <div className={styles.image} onClick={() => handleShowProduct(product)}>
                  <img src={product.urlImage} alt={product.name} className={product.quantity <= 0 && styles.inactiveCard} />
                </div>
                <div className="card-body border-top">
                  <h5 className={`card-title ${product.quantity <= 0 && styles.inactiveCard}`}>{product.tname}</h5>
                  {product.quantity <= 0 && <p className={styles.soldOut}>{t('sold_out')}</p>}
                  {product.isDiscountActive ? (
                    <div className='d-flex gap-2'>
                      <p className="card-text text-decoration-line-through text-secondary">{product.price}₽</p>
                      <p className="card-text fw-bold text-success">{product.discountPrice}₽</p>
                    </div>
                  ) : (
                    <p className={`card-text ${product.quantity <= 0 && styles.inactiveCard}`}>{product.price}₽</p>
                  )}
                  {currentUser && (
                    <div className="d-flex align-items-center gap-2">
                      {product.countOrderedProduct && (
                        <div className="d-flex gap-2 align-items-center">
                          <div className="mr-2">{t('amount_in_cart')}:</div>
                          <button onClick={() => handleDecrementQuantity(product)} className="btn btn-outline-primary mr-1">-</button>
                          <span>{product.countOrderedProduct}</span>
                          <button disabled={product.quantity <= 0} onClick={() => handleIncrementQuantity(product)} className="btn btn-outline-primary mr-1">+</button>
                        </div>
                      )}
                      {!product.isSelected && product.quantity > 0 && (
                        <button onClick={() => handleAddProductToCart(product)} className="btn btn-primary text-black"><Icon name='bag'/></button>
                      )}
                      {product.isFavoriteProduct
                       ? <button onClick={() => handleToggleFavorite(product)} className='btn btn-danger'><Icon name='breakHeart'/></button>
                       : <button onClick={() => handleToggleFavorite(product)} className='btn btn-info'><Icon name='heart'/></button>
                      }
                    </div>
                  )}
                </div>
              </div>
            </div>
          )) : <div>{t('nothing')}</div>}
        </div>
      </div>
      <Paginate setPage={setPage} page={page} maxPage={maxPage}/>
    </>
  )
}

export default Products;
