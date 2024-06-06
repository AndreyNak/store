import { Redirect, Router } from "@reach/router";
import Header from "./Header";
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
      <Router>
        <NotFound default />
        <Unauthorized path='401' />
        <Redirect from="/" to="/products" noThrow />
        <Cart path='cart'/>
        <Profile path='profile/*' />
        <Products path="products" />
        <Support path="support/*" />
        {hasPermission(currentUser, 'can_view_admin') && (
          <AdminDashboard path='admin/*' />
        )}
      </Router>
    </div>
  </>

);

export default Authorized;