import React, { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { del, get, post } from '../../lib/http';
import { useGenericData } from '../../bundles/GeneralContext';
import { useTranslation } from 'react-i18next';

const Cart = () => {
  const { setCurrentUser } = useGenericData();
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState([]);
  const [errors, setErrors] = useState(null);

  const { t } = useTranslation('translation', { keyPrefix: 'cart.cart' });
  const navigate = useNavigate();

  useEffect(() => {
    try {
      get('cart').then((res) => {
        setCartItems(res.cartItems)
        setTotalPrice(res.meta.totalPrice)
      })
    } catch (error) {
      console.log("error", error)
    }
  }, [])

  const calculatePrice = (product) => {
    return product.isDiscountActive ? product.discountPrice : product.price
  }

  const handleIncrementQuantity = (cartItem) => {
    try {
      post(`cart/increment_quantity/${cartItem.product.id}`).then(() => {
        updateCartItemStateIncQuantity(cartItem);
      });
    } catch (error) {
      console.log('error', error);
    }
  }

  const handleDecrementQuantity = (cartItem) => {
    try {
      post(`cart/decrement_quantity/${cartItem.product.id}`).then(() => {
        updateProductStateDecQuantity(cartItem);
      });
    } catch (error) {
      console.log('error', error);
    }
  }

  const handleRemove = (cartItem) => {
    try {
      del(`cart/remove_product/${cartItem.product.id}`).then(() => {
        updateCartItemStateRemove(cartItem);
      });
    } catch (error) {
      console.log('error', error);
    }
  }


  const handleCheckout = () => {
    post(`cart/checkout`).then((res) => {
      setCurrentUser(res)
      navigate("/products")
    }).catch((data) => setErrors(data.errors));
  }

  const updateCartItemStateIncQuantity = (currentCartItem) => {
    setTotalPrice((prevPrice) => prevPrice + calculatePrice(currentCartItem.product) )
    setCartItems((prevCartItem) =>
      prevCartItem.map((cartItem) =>
        cartItem.id === currentCartItem.id ? { ...cartItem, quantity: cartItem.quantity + 1} : cartItem
      )
    );
  };


  const updateProductStateDecQuantity = (currentCartItem) => {
    setTotalPrice((prevPrice) => prevPrice - calculatePrice(currentCartItem.product) )
    setCartItems((prevCartItem) => {
      return prevCartItem
        .map((cartItem) =>
          cartItem.id === currentCartItem.id
            ? { ...cartItem, quantity: cartItem.quantity - 1 }
            : cartItem
        )
        .filter((cartItem) => cartItem.quantity > 0);
    });
  };

  const updateCartItemStateRemove = (currentCartItem) => {
    setTotalPrice((prevPrice) => prevPrice - (calculatePrice(currentCartItem.product) * currentCartItem.quantity));

    setCartItems((prevCartItem) =>
      prevCartItem.filter((cartItem) => cartItem.id !== currentCartItem.id)
    );
  };

  return (
    <div>
      <div className='ms-3'>
        <h1 className='d-flex justify-content-center'>{t('title')}</h1>
        <Link to="/products">{t('home')}</Link>
        <div className='mt-2'>
          <div>{t('total_price')}: {totalPrice}</div>
          {totalPrice > 0 && <button className='btn btn-success' onClick={handleCheckout}>{t('checkout')}</button>}
        </div>
      </div>
      {cartItems.length ? (
        <div>
          {errors && (
            <div className="mt-3 alert alert-danger">
              <p>{errors}</p>
            </div>
          )}
          <table className="table table-striped">
            <thead className="thead-dark">
              <tr>
                <th>{t('product')}</th>
                <th>{t('price')}</th>
                <th>{t('quantity')}</th>
                <th>{t('actions')}</th>
              </tr>
            </thead>
            <tbody>
              {cartItems.map((cartItem) => (
                <tr key={cartItem.product.id}>
                  <td>
                    {cartItem.product.tname}
                    {cartItem.product.quantity <= 0 && <span className='text-danger ms-2'>{t('sold_out')}</span>}
                  </td>
                  <td>
                    {cartItem.product.discountPrice ? (
                      <div className='d-flex gap-2'>
                        <p className="card-text text-decoration-line-through text-secondary">{cartItem.product.price}</p>
                        <p className="card-text fw-bold text-success">{cartItem.product.discountPrice}</p>
                      </div>
                    ) : (
                      <p className="card-text">{cartItem.product.price}</p>
                    )}
                  </td>
                  <td style={{height: "50px"}} className="d-flex gap-2 align-items-center">
                    <button onClick={() => handleDecrementQuantity(cartItem)} className="btn btn-sm btn-secondary">-</button>
                    <span>{cartItem.quantity}</span>
                    <button onClick={() => handleIncrementQuantity(cartItem)} className="btn btn-sm btn-secondary">+</button>
                  </td>
                  <td>
                    <button className="btn btn-sm btn-danger" onClick={() => handleRemove(cartItem)}>{t('remove')}</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p>{t('empty')}</p>
      )}
    </div>
  )}
export default Cart;
