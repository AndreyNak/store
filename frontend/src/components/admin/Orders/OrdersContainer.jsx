import "./orders.scss"
import { Link, Router } from "@reach/router";
import { hasPermission } from "../../../lib/permissions";
import LiveOrders from "./LiveOrders";
import { useGenericData } from "../../../bundles/GeneralContext";
import { NotFound } from "../../../bundles/Errors";
import Orders from "./Orders";
import Statistics from "./Statistics";

const OrdersContainer = () => {
  const { currentUser } = useGenericData();

 return (
  <>
    <div className="d-flex gap-2">
      <Link to="/admin/orders">All</Link>
      {hasPermission(currentUser, 'can_view_admin_orders_live') && (
        <Link to="/admin/orders/live">Live</Link>
      )}
      {hasPermission(currentUser, 'can_view_admin_orders_statistics') && (
        <Link to="/admin/orders/statistics">Statistics</Link>
      )}
    </div>
    <Router>
      <NotFound default />
      <Orders path="/" />

      {hasPermission(currentUser, 'can_view_admin_orders_statistics') && <Statistics path='/statistics' />}
      {hasPermission(currentUser, 'can_view_admin_orders_live') && <LiveOrders path="/live" />}
    </Router>
  </>
 )
}

export default OrdersContainer;
