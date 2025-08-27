import "./orders.scss"
import { Routes, Route, Link } from "react-router-dom";
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
    <Routes>
      <Route path="*" element={<NotFound/>} />
      <Route path="/" element={<Orders/>} />
      {hasPermission(currentUser, 'can_view_admin_orders_statistics') && <Route path="/statistics" element={<Statistics/>} />}
      {hasPermission(currentUser, 'can_view_admin_orders_live') && <Route path="/live" element={<LiveOrders/>} />}
    </Routes>
  </>
 )
}

export default OrdersContainer;
