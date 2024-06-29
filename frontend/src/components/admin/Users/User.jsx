import React, { useEffect, useState } from 'react';
import { get, patch } from '../../../lib/http';
import { colorStatus } from '../../../lib/helpers';
import { Link } from '@reach/router';
import Paginate from '../../../bundles/Paginate';
import { useTranslation } from 'react-i18next';
import DeniedPermissionsModal from './DeniedPermissionsModal';
import { useGenericData } from '../../../bundles/GeneralContext';
const User = ({ id }) => {
  const [user, setUser] = useState(null);
  const [userRestrictions, setUserRestrictions] = useState([])
  const [page, setPage ] = useState(1);
  const [maxPage, setMaxPage] = useState(null);
  const [statuses, setStatuses] = useState([]);
  const [isOpenDeniedPermissions, setIsOpenDeniedPermissions] = useState(false);
  const [restrictions, setRestrictions] = useState([]);
  const [query, setQuery ] = useState({ start_date: '', end_date: '',  status: ''})

  const { currentUser } = useGenericData();
  const { t } = useTranslation('translation', { keyPrefix: 'admin.users.user' });


  useEffect(() => {
    const params = { page, ...query };

    get(`admin/users/${id}`, params).then((res) => {
      setUser(res.user);
      setMaxPage(res.paginate.maxPage);
      setStatuses(res.statuses);
    }).catch((err) => console.log(err))
  }, [page, query, id]);

  useEffect(() => {
    get(`admin/users/${id}/restrictions`).then((data) => setUserRestrictions(data))
  }, [])

  const openDeniedPermissionsModal = (restrictions) => {
    setIsOpenDeniedPermissions(true);
    setRestrictions(restrictions);
  }

  const updateRestriction = (updatedRestriction) => {
    updateUserOffenses(updatedRestriction)

    setRestrictions((prevRestrictions) => prevRestrictions.map((res) =>
      res.id === updatedRestriction.id ? updatedRestriction : res
    ))
  }

  const updateUserOffenses = (newRestriction) => {
    setUserRestrictions((prevRestrictions) => {
      return {
        offenses: prevRestrictions.offenses.map((offense) =>
          offense.id === newRestriction.id
            ? newRestriction
            : offense
        ),
        activeOffenses: prevRestrictions.activeOffenses.filter((offense) => offense.permission.name !== newRestriction.permission.name)
      }
    })
  }

  const cancelRestriction = (restriction_id) => {
    const params = { canceller_id: currentUser.id }
    patch(`admin/users/${user.id}/restrictions/${restriction_id}/cancel`, params).then(updateRestriction)
  }

  return (
    <div className="container">
      <Link to="/admin/users">{t('back')}</Link>
      <h1>{t('profile')}</h1>
      {isOpenDeniedPermissions && <DeniedPermissionsModal cancelRestriction={cancelRestriction} restrictions={restrictions} isOpen={isOpenDeniedPermissions} setIsOpen={setIsOpenDeniedPermissions} />}
      {user && (
        <>
          {userRestrictions.offenses && userRestrictions.offenses.length > 0 && (
            <div className="alert alert-danger d-flex gap-2" role="alert">
              <button
                className='btn btn-link text-danger'
                onClick={() => openDeniedPermissionsModal(userRestrictions.offenses)}
              >
                Denied Permissions
              </button>
              {userRestrictions.activeOffenses.length > 0 && (
                <button
                  className='btn btn-link text-danger'
                  onClick={() => openDeniedPermissionsModal(userRestrictions.activeOffenses)}
                >
                  Active: {userRestrictions.activeOffenses.length}
                </button>
              )}
            </div>
          )}
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
        </>
      )}
    </div>
  )
};

export default User;
