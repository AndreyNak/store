import React, { useEffect, useState } from 'react';
import { Link, navigate } from '@reach/router';
import { del, get, post } from '../../lib/http';
import { useGenericData } from '../../bundles/GeneralContext';

const Cart = () => {
  const { setCurrUser: setCurrentUser } = useGenericData();
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState([]);

  useEffect(() => {
    try {
      get('cart').then((res) => {
        setCartItems(res.cartItems)
        setTotalPrice(res.meta.totalPrice)
      })
    } catch (error) {
      alert("error", error)
    }
  }, [])

  const handleIncrementQuantity = (cartItem) => {
    try {
      post(`cart/increment_quantity/${cartItem.product.id}`).then(() => {
        updateCartItemStateIncQuantity(cartItem);
      });
    } catch (error) {
      alert('error', error);
    }
  }

  const handleDecrementQuantity = (cartItem) => {
    try {
      post(`cart/decrement_quantity/${cartItem.product.id}`).then(() => {
        updateProductStateDecQuantity(cartItem);
      });
    } catch (error) {
      alert('error', error);
    }
  }

  const handleRemove = (cartItem) => {
    try {
      del(`cart/remove_product/${cartItem.product.id}`).then(() => {
        updateCartItemStateRemove(cartItem);
      });
    } catch (error) {
      alert('error', error);
    }
  }


  const handleCheckout = () => {
    try {
      post(`cart/checkout`).then((res) => {
        setCurrentUser(res)
        navigate("/products")
      });
    } catch (error) {
      alert('error', error);
    }
  }

  const updateCartItemStateIncQuantity = (currentCartItem) => {
    setTotalPrice((prevPrice) => prevPrice + currentCartItem.product.price )
    setCartItems((prevCartItem) =>
      prevCartItem.map((cartItem) =>
        cartItem.id === currentCartItem.id ? { ...cartItem, quantity: cartItem.quantity + 1} : cartItem
      )
    );
  };


  const updateProductStateDecQuantity = (currentCartItem) => {
    setTotalPrice((prevPrice) => prevPrice - currentCartItem.product.price )
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
    setTotalPrice((prevPrice) => prevPrice - (currentCartItem.product.price * currentCartItem.quantity));

    setCartItems((prevCartItem) =>
      prevCartItem.filter((cartItem) => cartItem.id !== currentCartItem.id)
    );
  };

  return (
  <div>
    <h1>Cart</h1>
    <Link to="/products">Home</Link>
    {cartItems ? (
      <div>
        <table className="table table-striped">
          <thead className="thead-dark">
            <tr>
              <th>Product</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {cartItems.map((cartItem) => (
              <tr key={cartItem.product.id}>
                <td>{cartItem.product.name}</td>
                <td>{cartItem.product.price}</td>
                <td style={{height: "50px"}} className="d-flex gap-2 align-items-center">
                  <button onClick={() => handleDecrementQuantity(cartItem)} className="btn btn-sm btn-secondary">-</button>
                  <span>{cartItem.quantity}</span>
                  <button onClick={() => handleIncrementQuantity(cartItem)} className="btn btn-sm btn-secondary">+</button>
                </td>
                <td>
                  <button className="btn btn-sm btn-danger" onClick={() => handleRemove(cartItem)}>Remove</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        <p>Total Price: {totalPrice}</p>
        {totalPrice > 0 && <button onClick={handleCheckout}>Checkout</button>}
      </div>
    ) :
    (
      <p>Your cart is empty.</p>
    )}
  </div>
)}
export default Cart;
