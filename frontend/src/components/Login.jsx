import { useRef } from "react";
import { login } from "../lib/http";
import { Link } from "@reach/router";
import { useState } from "react";

const Login = () => {
  const formRef = useRef();
  const [errors, setErrors] = useState(null);

  const actionLogin = async (userInfo) => {
    login(userInfo).then(() => window.location.href = '/')
    .catch((data) => setErrors(data.error));
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData(formRef.current)
    const data = Object.fromEntries(formData)
    const userInfo = {
      "user":{ login: data.login, password: data.password }
    }

    actionLogin(userInfo);
  };

  return (
    <div className="container mt-5">
      <form ref={formRef} onSubmit={handleSubmit} className="border p-4 shadow-sm rounded">
        <div className="mb-3">
          <label htmlFor="login" className="form-label">Login:</label>
          <input name='login' placeholder="login" className="form-control"/>
        </div>
        <div className="mb-3">
          <label htmlFor="password" className="form-label">Password</label>
          <input type="password" name='password' placeholder="password" className="form-control" />
        </div>
        <input type='submit' value="Login" className="btn btn-primary"/>
      </form>
      <>
        {errors && <div className="mt-3 alert alert-danger">{errors}</div>}
      </>
      <div className="mt-3">
        Not registered yet, <Link to="/signup">Signup</Link>
      </div>
    </div>
  )
}
export default Login;
