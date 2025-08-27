import { Link, useNavigate } from "react-router-dom";
import { useRef } from "react";
import { signup } from "../lib/http"
import { useState } from "react";
import { useTranslation } from "react-i18next";

const Signup = ({ setCurrentUser })=>{
  const formRef = useRef();
  const [errors, setErrors] = useState(null);

  const { t } = useTranslation('translation', { keyPrefix: 'auth.signup' });
  const navigate = useNavigate();

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
          <label htmlFor="email" className="form-label">{t('email')}:</label>
          <input type="email" name="email" className="form-control" placeholder={t('email')} required />
        </div>
        <div className="mb-3">
          <label htmlFor="login" className="form-label">{t('login')}:</label>
          <input name="login" className="form-control" placeholder={t('login')} required />
        </div>
        <div className="mb-3">
          <label htmlFor="password" className="form-label">{t('password')}:</label>
          <input type="password" name="password" className="form-control" placeholder={t('password')} required />
        </div>
        <button type="submit" className="btn btn-primary">{t('submit')}</button>
      </form>
      <>
        {errors && <div className="mt-3 alert alert-danger">{errors}</div>}
      </>
      <div className="mt-3">
        {t('already_registered')} <Link to="/login">{t('login_here')}</Link>
      </div>
    </div>
  )
}
export default Signup
