import { useEffect } from "react";
import { debounce } from 'lodash';
import { get } from "../../../lib/http";
import { useState } from "react";
import Loading from "../../../bundles/Loading";
import InfiniteScroll from "react-infinite-scroll-component";
import { useCallback } from "react";
import "./orders.scss"
import { Link } from "@reach/router";
import { hasPermission } from "../../../lib/permissions";
import { useGenericData } from "../../../bundles/GeneralContext";
import { colorStatus } from "../../../lib/helpers";
import { useTranslation } from "react-i18next";

const Orders = () => {
  const [orders, setOrders] = useState([]);
  const [states, setStates] = useState([])
  const [query, setQuery ] = useState({ search: '', status: '', start_date: '', end_date: ''})
  const [hasMore, setHasMore] = useState(true);
  const [loading, setLoading] = useState(false);
  const [page, setPage ] = useState(1);

  const { currentUser } = useGenericData();
  const { t:tg } = useTranslation('translation');

  const fetchData = useCallback(debounce((newQuery) => {
    setLoading(true);
    const params = { page: 1, ...newQuery };
    get('admin/orders', params)
      .then((data) => {
        setOrders(data);
        setLoading(false);
      })
      .catch((err) => console.log(err))
      .finally(() => setLoading(false));
  }, 150), [query]);


  useEffect(() => {
    get('admin/orders/states').then((data) => setStates(data))
  }, [])

  useEffect(() => {
    fetchData(query);

    return  () => fetchData.cancel();
  }, [query, fetchData])

  const fetchMoreOrders = async () => {
    const currentPage = page + 1;
    setPage(currentPage);
    const params = { page: currentPage, ...query }
    get(`admin/orders`, params).then((data) => {
      setOrders((prevOrders) => [...prevOrders, ...data ])

      orders.length > 0 ? setHasMore(true) : setHasMore(false);

    }).catch((error) => console.error('Error fetching more orders:', error));
  };


  return (
    <div>
      orders
      <div className="d-flex gap-2">
        <div>
          <label htmlFor="end_date">Start date:</label>
          <input
            type="date"
            id="start_date"
            value={query.start_date}
            onChange={(e) => setQuery({ ...query, start_date: e.target.value })}
          />
        </div>
        <div>
          <label htmlFor="end_date">End date:</label>
          <input
            type="date"
            id="end_date"
            value={query.end_date}
            onChange={(e) => setQuery({ ...query, end_date: e.target.value })}
          />
        </div>
        <button className="btn btn-primary" onClick={() => setQuery({...query, start_date: '', end_date: '' })}>Clear dates</button>
      </div>
      <div>
        <button className={`btn btn-link ${query.status === '' ? 'selected' : ''}`} onClick={() => setQuery({ ...query, status: '' })}>
          All
        </button>
        {states.map((status) => (
          <button key={status} onClick={() => setQuery({ ...query, status })} className={`btn btn-link ${query.status === status ? 'selected' : ''}`}>
            {status}
          </button>
        ))}
      </div>
      <input
        className='form-control my-2'
        type="search"
        value={query.search}
        placeholder={`${tg('search_by')} ID/Login`}
        onChange={(e) => setQuery({...query, search: e.target.value}) }
      />
      {loading ? <Loading/> : orders.length > 0 ? (
        <InfiniteScroll
          dataLength={orders.length}
          next={fetchMoreOrders}
          hasMore={hasMore}
          endMessage={<p>No more</p>}
        >
          <div>
            {orders.map((order) => (
              <div key={order.id}>
                <div>ID:{order.id}</div>
                {hasPermission(currentUser, 'can_view_admin_user') ? (
                  <div>Логин: <Link to={`/admin/users/${order.user.id}`}>{order.user.login}</Link></div>
                ) : (
                  <div>Логин: {order.user.login}</div>
                )}
                <div>Статус: <span className={colorStatus(order.status)}>{order.status}</span></div>
                <div>Заказано в {order.createdAt}</div>
                <div>Рейтинг: {order.rating || 'No rating'}</div>
                <div>Общая стоимость: {order.amountOrder}</div>
                <hr />
              </div>
            ))}
          </div>
        </InfiniteScroll>
      ) : (
        <div>Empty!</div>
      )}
    </div>
  )
}

export default Orders;