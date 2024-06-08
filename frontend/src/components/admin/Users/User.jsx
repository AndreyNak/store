import React, { useEffect, useState } from 'react';
import { get } from '../../../lib/http';
import { Link } from '@reach/router';
import Paginate from '../../../bundles/Paginate';
import { useTranslation } from 'react-i18next';
const User = ({ id }) => {
  const [user, setUser] = useState(null);
  const [page, setPage ] = useState(1);
  const [maxPage, setMaxPage] = useState(null);
  const [statuses, setStatuses] = useState([]);
  const [query, setQuery ] = useState({ start_date: '', end_date: '',  status: ''})

  const { t } = useTranslation('translation', { keyPrefix: 'admin.users.user' });


  useEffect(() => {
    const params = { page, ...query };

    get(`admin/users/${id}`, params).then((res) => {
      setUser(res.user);
      setMaxPage(res.paginate.maxPage);
      setStatuses(res.statuses);
    }).catch((err) => console.log(err))
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
      <Link to="/admin/users">{t('back')}</Link>
      <h1>{t('profile')}</h1>
      {user && (
        <div>
          <p><strong>{t('email')}:</strong>{user.email}</p>
          <p><strong>{t('login')}:</strong>{user.login}</p>
          <p><strong>{t('name')}:</strong>{user.name}</p>
          <p><strong>{t('surname')}:</strong>{user.surname}</p>
          <p><strong>{t('date_of_birth')}:</strong>{user.date_of_birth}</p>
          <p><strong>{t('address')}:</strong>{user.address}</p>
          <h4><strong>{t('orders')}:</strong></h4>
          <label htmlFor="start_date">{t('start_date')}:</label>
          <input
            type="date"
            id="start_date"
            value={query.start_date}
            onChange={(e) => setQuery({ ...query, start_date: e.target.value })}
          />
          <label htmlFor="end_date">{t('end_date')}:</label>
          <input
            type="date"
            id="end_date"
            value={query.end_date}
            onChange={(e) => setQuery({ ...query, end_date: e.target.value })}
          />
          <div>
            {statuses.map((status) => (
              <button key={status} onClick={() => setQuery({ ...query, status })} className="btn btn-link">
                {status}
              </button>
            ))}
          </div>
          <button className="btn btn-link" onClick={() => setQuery({ start_date: '', end_date: '', status: '' })}>
            {t('all')}
          </button>
          <div>
            <p>{t('count')}: {user.orders.length}</p>
            <p>{t('total_amount')}: {user.amountOrders}</p>
            <Paginate page={page} maxPage={maxPage} setPage={setPage} />
            {user.paginateOrders.length > 0 ? (
              user.paginateOrders.map((order) => (
                <div key={order.id}>
                  {t('order_id')}: {order.id}
                  <div className="d-flex">
                    <div>{t('order_status')}:</div>
                    <span className={`fw-bold ${colorStatus(order.status)}`}>
                      {order.status}
                    </span>
                  </div>
                  <ul>
                    {order.orderItems.map((item) => (
                      <li key={item.id}>
                        {item.product.name} - {t('quantity')}: {item.quantity}
                      </li>
                    ))}
                  </ul>
                  {t('ordered_at')} {order.createdAt}
                  {order.received && (
                    <div className="d-flex">
                      <div className="me-2">{t('rating')}:</div>
                      <div>{order.rating || t('unrated')}</div>
                    </div>
                  )}
                  <div>{t('total_value')}: {order.amountOrder}</div>
                  <hr />
                </div>
              ))
            ) : (
              <h4>{t('not_yet')}</h4>
            )}
            <Paginate page={page} maxPage={maxPage} setPage={setPage} />
          </div>
        </div>
      )}
    </div>
  )
};

export default User;
