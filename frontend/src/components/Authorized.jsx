import { Routes, Route, Navigate } from "react-router-dom";
import Header from "./Header/Header";
import { NotFound, Unauthorized } from "../bundles/Errors";
import Cart from "./cart/Cart";
import Profile from "./profile/Profile";
import Products from "./products/Products";
import Support from "./support/Support";
import AdminDashboard from "./admin/AdminDashboard";
import { hasPermission } from "../lib/permissions";

const Authorized = ( {currentUser, setCurrentUser}) => (
  <>
    <Header currentUser={currentUser} setCurrentUser={setCurrentUser} />
    <div>
      <Routes>
        <Route path='*' element={<NotFound/>} />
        <Route path="/" element={<Navigate to="/products" replace />} />
        <Route path='401' element={<Unauthorized/>} />
        <Route path='cart' element={<Cart/>} />
        <Route path='profile/*' element={<Profile/>} />
        <Route path='products' element={<Products/>} />
        <Route path='support/*' element={<Support/>} />
        {hasPermission(currentUser, 'can_view_admin') && (
          <Route path='admin/*' element={<AdminDashboard/>} />
        )}
      </Routes>
    </div>
  </>

);

export default Authorized;