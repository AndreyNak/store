const Orders = ({activeOrders, handleCancelOrder }) => {

  return (
    <div>
      <h3>Active Orders</h3>
      <div>
        {activeOrders.map((order) => (
          <div>
            Order ID: {order.id}
            <p>Order status: {order.status}</p>
            <ul>
              {order.orderItems.map((item) => (
                <li>{item.product.name} - Quantity: {item.quantity}</li>
              ))}
            </ul>
            <p>Order value: {order.amountOrder}</p>
            Ordered at {order.createdAt}
            <button onClick={() => handleCancelOrder(order.id)}>Cancel order</button>
          </div>
        ))}
      </div>
    </div>
  )
}

export default Orders;
