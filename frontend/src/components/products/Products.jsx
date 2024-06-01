import React, { useCallback, useEffect, useState } from 'react';
import { debounce } from 'lodash';
import './products.scss';
import Paginate from '../../bundles/Paginate';
import { get, patch, post } from '../../lib/http';
import Filters from './Filters/Filters';
import Orders from './Orders';
import { Link } from '@reach/router';
import { useGenericData } from '../../bundles/GeneralContext';
import Product from './Product';
const Products = ( ) => {
  const { currentUser, setCurrentUser } = useGenericData();

  const [products, setProducts ] = useState([]);
  const [errors, setErrors] = useState(null);
  const [isOpen, setIsOpen] = useState(false);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [typeProducts, setTypeProducts ] = useState([]);
  const [page, setPage ] = useState(1);
  const [maxPage, setMaxPage] = useState(null);
  const [totalPrice, setTotalPrice] = useState(currentUser?.totalPrice || null)
  const [query, setQuery ] = useState({ search: '', favorites: false, category: ''})

  useEffect(() => {
    try {
      get('type_products').then((typeProducts) => setTypeProducts(typeProducts))
    } catch (error) {
      console.log("error", error)
    }
  }, [])

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
        get('products', params).then((products_data) => {
          setProducts(products_data.products);
          setPage(parseInt(products_data.meta.paginate.page));
          setMaxPage(products_data.meta.paginate.maxPage);
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

  const handleCheckout = (product) => {
    const params = {
      page,
      ...query
    };

    post(`cart/checkout`).then((res) => {
      setCurrentUser(res)

      get('products', params).then((products_data) => {
        setProducts(products_data.products)
        setPage(parseInt(products_data.meta.paginate.page))
        setMaxPage(products_data.meta.paginate.maxPage)
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
  const isAdmin = currentUser?.role.name === 'admin'

  const actions = {
    handleDecrementQuantity,
    handleIncrementQuantity,
    handleAddProductToCart,
    handleToggleFavorite
  }

  return (
    <>
      {currentUser && (
        <div>
          <div>
            <Link className='mx-2' to="/profile">Profile</Link>
            <Link className='mx-2' to="/support/main">Support</Link>
            { isAdmin && <Link className='mx-2' to="/admin/users">Admin</Link>}
            {currentUser.cart && totalPrice > 0 && (
              <div>
                <div className='m-2 d-flex gap-1'>
                  <Link to="/cart">Cart</Link>
                  <p>Total Price: {totalPrice}</p>
                </div>
                <button className='my-2 btn btn-primary' onClick={handleCheckout}>Checkout</button>
              </div>
            )}
          </div>
          <div>
            {activeOrders.length > 0 && <Orders handleCancelOrder={(order_id) => handleCancelOrder(order_id)} activeOrders={activeOrders} />}
          </div>
        </div>
      )}
      <Filters query={query} typeProducts={typeProducts} setQuery={setQuery} currentUser={currentUser} />
      <Paginate setPage={setPage} page={page} maxPage={maxPage}/>
      {errors && (
        <div className="mt-3 alert alert-danger">
          <p>{errors}</p>
          <p>Please, remove the item from your cart. </p>
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
          {products.map((product) => (
            <div key={product.id}  className={`col mb-4 ${product.quantity <= 0 && 'inactive-card'}`}>
              <div className="card main-product">
                <img src={product.urlImage} alt={product.name} onClick={() => handleShowProduct(product)} />
                <div className="card-body">
                  <h5 className="card-title">{product.name}</h5>
                  {product.quantity <= 0 && <p>Sold out</p>}
                  {product.isDiscountActive
                    ? (
                      <div className='d-flex gap-2'>
                        <p className="card-text text-decoration-line-through text-secondary">{product.price}₽</p>
                        <p className="card-text fw-bold text-success">{product.discountPrice}₽</p>
                      </div>
                      )
                    : (
                      <p className="card-text">{product.price}₽</p>
                    )}
                  {currentUser && (
                    <div className="d-flex align-items-center gap-2">
                      {product.countOrderedProduct && (
                        <div className="d-flex gap-2 align-items-center">
                          <div className="mr-2">Amount in cart:</div>
                          <button onClick={() => handleDecrementQuantity(product)} className="btn btn-outline-primary btn-sm mr-1">-</button>
                          <span>{product.countOrderedProduct}</span>
                          <button disabled={product.quantity <= 0} onClick={() => handleIncrementQuantity(product)} className="btn btn-outline-primary btn-sm mr-1">+</button>
                        </div>
                      )}
                      {(!product.isSelected && product.quantity > 0) && (
                        <button onClick={() => handleAddProductToCart(product)} className="btn btn-primary">to cart</button>
                      )}
                      {product.isFavoriteProduct
                       ? <button onClick={() => handleToggleFavorite(product)} className='btn btn-danger'>Remove from favorites</button>
                       : <button onClick={() => handleToggleFavorite(product)} className='btn btn-info'>Add to favorites</button>
                      }
                    </div>
                  )}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
      <Paginate setPage={setPage} page={page} maxPage={maxPage}/>
    </>
  )
}

export default Products;
