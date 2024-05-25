import React, { useCallback, useEffect, useState } from 'react';
import { debounce } from 'lodash';
import './products.css';
import Paginate from '../../bundles/Paginate';
import { get, patch, post } from '../../lib/http';
import Filters from './Filters';
import Orders from './Orders';
import { Link } from '@reach/router';
import { useGenericData } from '../../bundles/GeneralContext';
const Products = ( ) => {
  const { currentUser, setCurrentUser } = useGenericData();

  const [products, setProducts ] = useState([]);
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

    try {
      post(`cart/checkout`).then((res) => {
        setCurrentUser(res)

        get('products', params).then((products_data) => {
          setProducts(products_data.products)
          setPage(parseInt(products_data.meta.paginate.page))
          setMaxPage(products_data.meta.paginate.maxPage)
        })
      });
    } catch (error) {
      console.log('error', error);
    }
  }

  const handleCancelOrder = (order_id) => {
    patch(`profile/orders/${order_id}/cancel`).then((res) =>
      setCurrentUser(res)
    ).catch((err) => console.log('error', err))
  }

  const updateProductInStateIsSelected = (current_product) => {
    setTotalPrice((prevPrice) => prevPrice + current_product.price )
    setProducts((prevProducts) =>
      prevProducts.map((product) =>
        product.id === current_product.id ? { ...product, isSelected: true, countOrderedProduct: 1 } : product
      )
    );
  };

  const updateProductStateIncQuantity = (current_product) => {
    setTotalPrice((prevPrice) => prevPrice + current_product.price )
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
    setTotalPrice((prevPrice) => prevPrice - current_product.price )
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
  return (
    <>
      {currentUser && (
        <div>
          <div>
            <Link to="/profile">Profile</Link>
            <Link to="/support/main">Support</Link>
            { isAdmin && <Link to="/admin/users">Admin</Link>}
            {currentUser.cart && totalPrice > 0 && (
              <div>
                <div className='d-flex gap-1'>
                  <Link to="/cart">Cart</Link>
                  <p>Total Price: {totalPrice}</p>
                </div>
                <button onClick={handleCheckout}>Checkout</button>
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
      <div className="mt-5">
        <div className="row row-cols-2 row-cols-md-6">
          {products.map((product) => (
            <div key={product.id}  className="col mb-4">
              <div className="card main-product">
                <img src={product.urlImage} alt={product.name} />
                <div className="card-body">
                  <h5 className="card-title">{product.name}</h5>
                  <p className="card-text">{product.price}</p>
                  {currentUser && (
                    <div className="d-flex align-items-center gap-2">
                      {product.countOrderedProduct && (
                        <div className="d-flex gap-2 align-items-center">
                          <div className="mr-2">Amount in cart:</div>
                          <button onClick={() => handleDecrementQuantity(product)} className="btn btn-outline-primary btn-sm mr-1">-</button>
                          <span>{product.countOrderedProduct}</span>
                          <button onClick={() => handleIncrementQuantity(product)} className="btn btn-outline-primary btn-sm mr-1">+</button>
                        </div>
                      )}
                      {!product.isSelected && (
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
