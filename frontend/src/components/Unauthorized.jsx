import { Link, Redirect, Router } from "@reach/router";
import Signup from "./Signup";
import Login from "./Login";
import Products from "./products/Products";
import { NotFound } from "../bundles/Errors";

const Unauthorized = ( { setCurrentUser } ) => (
  <>
    <nav class="navbar navbar-light bg-light mb-2">
      <div class="container-fluid">
        <div className="d-flex gap-2">
          <Link to="/signup">Sign Up</Link>
          <Link to="/login">Login</Link>
        </div>
      </div>
    </nav>
    <Router>
      <NotFound default />
      <Signup setCurrentUser={setCurrentUser} path="/signup" />
      <Login path="/login" />
      <Redirect from="/" to="/products" noThrow />
      <Products path="products" />
    </Router>
  </>
)

export default Unauthorized;