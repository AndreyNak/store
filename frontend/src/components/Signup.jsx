import { Link, navigate } from "@reach/router";
import { useRef } from "react";
import { signup } from "../lib/http"
import { useState } from "react";

const Signup = ({ setCurrentUser })=>{
  const formRef = useRef();
  const [errors, setErrors] = useState(null);

  const actionSignup = async (userInfo)=> {
    signup(userInfo).then((data) => {
      setCurrentUser(data);
      navigate('/');
    }).catch((data) => setErrors(data.error));
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData(formRef.current)
    const data = Object.fromEntries(formData)
    const userInfo = {
      "user":{ email: data.email, login: data.login, password: data.password }
    }

    actionSignup(userInfo)
  };

  return (
    <div className="container mt-5">
      <form ref={formRef} onSubmit={handleSubmit} className="border p-4 shadow-sm rounded">
        <div className="mb-3">
          <label htmlFor="email" className="form-label">Email:</label>
          <input type="email" name="email" className="form-control" placeholder="email" required />
        </div>
        <div className="mb-3">
          <label htmlFor="login" className="form-label">Login:</label>
          <input name="login" className="form-control" placeholder="login" required />
        </div>
        <div className="mb-3">
          <label htmlFor="password" className="form-label">Password:</label>
          <input type="password" name="password" className="form-control" placeholder="password" required />
        </div>
        <button type="submit" className="btn btn-primary">Submit</button>
      </form>
      <>
        {errors && <div className="mt-3 alert alert-danger">{errors}</div>}
      </>
      <div className="mt-3">
        Already registered? <Link to="/login">Login</Link> here.
      </div>
    </div>

  )
}
export default Signup
