import { Routes, Route, Link, Navigate } from "react-router-dom";
import Signup from "./Signup";
import Login from "./Login";
import Products from "./products/Products";
import { NotFound } from "../bundles/Errors";

const Unauthorized = ( { setCurrentUser } ) => (
  <>
    <nav className="navbar navbar-light bg-light mb-2">
      <div className="container-fluid">
        <div className="d-flex gap-2">
          <Link to="/signup">Sign Up</Link>
          <Link to="/login">Login</Link>
        </div>
      </div>
    </nav>
    <Routes>
      <Route path='*' element={<NotFound/>} />
      <Route path="/signup" element={<Signup setCurrentUser={setCurrentUser}/>} />
      <Route path="/login" element={<Login/>} />
      <Route path="/" element={<Navigate to="/products" replace />} />
      <Route path='products' element={<Products/>} />
    </Routes>
  </>
)

export default Unauthorized;