import { useEffect, useState } from "react";
import { debounce } from 'lodash';
import { get } from "../../../lib/http";
import "./orders.scss"
import cn from 'classnames';
import consumer from "../../../lib/channels/consumer";
import Loading from "../../../bundles/Loading";
import InfiniteScroll from "react-infinite-scroll-component";
import { useCallback } from "react";
import { useTranslation } from "react-i18next";

const LiveOrders = () => {
  const [orders, setOrders] = useState([]);
  const [query, setQuery ] = useState({ search: ''})
  const [hasMore, setHasMore] = useState(true);
  const [loading, setLoading] = useState(false);
  const [page, setPage ] = useState(1);

  const { t:tg } = useTranslation('translation');

  const fetchData = useCallback(debounce((newQuery) => {
    setLoading(true);
    const params = { page: 1, ...newQuery };
    get('admin/orders/live', params)
      .then((data) => {
        setOrders(data);
        setLoading(false);
      })
      .catch((err) => console.log(err))
      .finally(() => setLoading(false));
  }, 500), [query]);

  useEffect(() => {
    fetchData(query);

    return  () => fetchData.cancel();
  }, [query, fetchData])

  const fetchMoreOrders = async () => {
    const currentPage = page + 1;
    setPage(currentPage);
    const params = { page: currentPage, ...query }
    get(`admin/orders/live`, params).then((orders) => {
      setOrders((prevOrders) => [...prevOrders, ...orders ])

      orders.length > 0 ? setHasMore(true) : setHasMore(false);

    }).catch((error) => console.error('Error fetching more orders:', error));
  };

  const handleAddOrder  = (newOrder) => {
    setOrders(prevOrders => [newOrder, ...prevOrders]);
  }

  const handleUpdateOrder  = (newOrder) => {
    setOrders((prevOrders) =>
      prevOrders.map((order) =>
        order.id === newOrder.id ? newOrder : order
      )
    );
  }


  useEffect(() => {
    const subscription = consumer.subscriptions.create(
      { channel: "AdminOrdersChannel" },
      {
        connected: () => console.log('connect AdminOrdersChannel'),
        disconnected: () => console.log("AdminOrdersChannel disconnected"),
        received: (newOrder) => {
          const result = orders.find(order => order.id === newOrder.id);

          result ? handleUpdateOrder(newOrder) : handleAddOrder(newOrder)
        }
      }
    );

    return () => subscription.unsubscribe();
}, [orders]);

 return (
  <div>
    <h1>Life stream orders</h1>
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
              <div className={cn("order", {
                'bg-warning': order.status === 'pending',
                'bg-success text-white': order.status === 'received',
                'bg-danger text-white': order.status === 'rejected',
                'bg-secondary text-white': order.status === 'cancelled',
                'bg-info': order.status === 'delivering',
              })}>
              <div>ID: {order.id}</div>
              <div>Логин:{order.user.login}</div>
              <div>Address: Moscow, Istris d.10.k1</div>
              <div>Status: {order.status}</div>
              <div>Amount: {order.amountOrder}</div>
              </div>
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

export default LiveOrders;
