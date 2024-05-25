import React, { useEffect, useState } from 'react';
import { get } from '../../../lib/http';
import { Link } from '@reach/router';
import Paginate from '../../../bundles/Paginate';
const User = ({ id }) => {
  const [user, setUser] = useState(null);
  const [page, setPage ] = useState(1);
  const [maxPage, setMaxPage] = useState(null);
  const [statuses, setStatuses] = useState([]);
  const [query, setQuery ] = useState({ start_date: '', end_date: '',  status: ''})

  useEffect(() => {
    const params = { page, ...query };

    get(`admin/users/${id}`, params).then((res) => {
      setUser(res.user);
      setMaxPage(res.paginate.maxPage);
      setStatuses(res.statuses);
    })
  }, [page,query, id]);

  const colorStatus = (status) => {
    const params = {
      pending: 'text-warning',
      received: 'text-success',
      rejected: 'text-danger',
      cancelled: 'text-secondary',
      delivering: 'text-info'
    }
    return params[status]
  }

  return (
    <div className="container">
      <Link to="/admin/users">Back</Link>
      <h1>User Profile</h1>
      {user && (
        <div>
          <p><strong>Email:</strong>{user.email}</p>
          <p><strong>Login:</strong>{user.login}</p>
          <p><strong>Name:</strong>{user.name}</p>
          <p><strong>Surname:</strong>{user.surname}</p>
          <p><strong>Date of Birth:</strong>{user.date_of_birth}</p>
          <p><strong>Address:</strong>{user.address}</p>
          <h4><strong>Orders:</strong></h4>
          <label htmlFor="start_date">Start Date:</label>
          <input
            type="date"
            id="start_date"
            value={query.start_date}
            onChange={(e) => setQuery({ ...query, start_date: e.target.value })}
          />
            <label htmlFor="end_date">End Date:</label>
            <input
              type="date"
              id="end_date"
              value={query.end_date}
              onChange={(e) => setQuery({ ...query, end_date: e.target.value })}
            />
        <div>
          {statuses.map((status) => (
            <button key={status} onClick={() => setQuery({...query, status: status})} className="btn btn-link">
              {status}
            </button>
          ))}
        </div>
        <button className="btn btn-link" onClick={() => setQuery({ startDate: '', endDate: '', status: ''})}>All</button>
        <div>
          <p>Count: {user.orders.length}</p>
          <p>Total amount: {user.amountOrders}</p>
          <Paginate page={page} maxPage={maxPage} setPage={setPage} />
          {user.paginateOrders.length > 0 ? (
            user.paginateOrders.map((order) => (
              <div key={order.id}>
                Order ID: {order.id}
                <div className="d-flex">
                  <div>Order status:</div>
                  <span className={`fw-bold ${colorStatus(order.status)}`}>
                    {order.status}
                  </span>
                </div>
                <ul>
                  {order.orderItems.map((item) => (
                    <li key={item.id}>
                      {item.product.name} - Quantity: {item.quantity}
                    </li>
                  ))}
                </ul>
                Ordered at {order.createdAt}
                {order.received && (
                  <div className="d-flex">
                    <div className="me-2">Rating:</div>
                    <div>{order.rating || 'unrated'}</div>
                  </div>
                )}
                <div>Total value: {order.amountOrder}</div>
                <hr />
              </div>
            ))
          ) : (
            <h4>Not yet</h4>
          )}
          <Paginate page={page} maxPage={maxPage} setPage={setPage} />
        </div>
    </div>
      )}
  </div>
  )
};

export default User;
