import React, { useEffect, useState } from "react"
import { get, patch } from "../../lib/http"
import Paginate from "../../bundles/Paginate";
import { useGenericData } from "../../bundles/GeneralContext";

const Orders = () => {
  const { currentUser  } = useGenericData();

  const [page, setPage ] = useState(1);
  const [maxPage, setMaxPage] = useState(null);
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    const params = { page };
    get('profile/orders', params).then((res) => {
      setOrders(res.orders)
      setMaxPage(res.meta.paginate.maxPage)
    });
  }, [page])


  const handleSetRating = (orderId, rating) => {
    const body = {order: {rating} }
    patch(`profile/orders/${orderId}`, body).then(() => {
      updateRatingProduct(orderId, rating)
    })
  }

  const handleCancelOrder = (orderId) => {
    patch(`profile/orders/${orderId}/cancel`).then(() =>
      updateStatusOrderByCancel(orderId)
    )
  }

  const handleRejectOrder = (orderId) => {
    patch(`profile/orders/${orderId}/reject`).then(() =>
      updateStatusOrderByReject(orderId))
  }

  const updateStatusOrderByCancel = (currentOrderId) =>  {
    setOrders((prevOrders) =>
      prevOrders.map((product) =>
        product.id === currentOrderId ? { ...product, delivering: false, pending: false  } : product
      )
    );
  }


  const updateStatusOrderByReject  = (currentOrderId) =>  {
    setOrders((prevOrders) =>
      prevOrders.map((product) =>
        product.id === currentOrderId ? { ...product, expired: true  } : product
      )
    );
  }

  const updateRatingProduct = (orderId, rating) => {
    setOrders((prevOrders) =>
      prevOrders.map((product) =>
        product.id === orderId ? { ...product, rating: rating } : product
      )
    );
  }

  return (
    <div>
      <h1>Orders for {currentUser.name}</h1>
      <Paginate page={page} maxPage={maxPage} setPage={setPage} />
      {orders.map((order) => (
        <div key={order.id}>
          Order ID: {order.id}
          <p>Order status: {order.status}</p>
          <ul>
            {order.orderItems.map((item) => (
              <li key={item.id}>{item.product.name} - Quantity: {item.quantity}</li>
            ))}
          </ul>
          {order.receivedAt && <span>Ordered at {order.createdAt}</span>}
          {(order.pending || order.delivering)  && <button onClick={() => handleCancelOrder(order.id)}>Cancel order</button>}
          {order.received && !order.expired && <button onClick={() => handleRejectOrder(order.id)}>Reject order</button>}
          {order.received && (
            <form className="d-flex gap-1">
              <div className="me-2">Rating:</div>
              <br />
              {[1, 2, 3, 4, 5].map((rating) => (
                <React.Fragment key={rating}>
                  <input
                    checked={order.rating === rating}
                    onChange={() =>  handleSetRating(order.id, rating)}
                    type="radio"
                    name="rating"
                    id={`rating_${rating}`}
                    value={rating}
                  />
                  <label htmlFor={`rating_${rating}`}>{rating}</label>
                </React.Fragment>
              ))}
            </form>
          )}
        <hr/>
        </div>
      ))}
      <Paginate page={page} maxPage={maxPage} setPage={setPage} />
    </div>
  )
}

export default Orders;
