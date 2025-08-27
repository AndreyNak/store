import { useRef } from "react";
import { login } from "../lib/http";
import { Link } from "react-router-dom";
import { useState } from "react";
import { useTranslation } from "react-i18next";

const Login = () => {
  const formRef = useRef();
  const [errors, setErrors] = useState(null);

  const { t } = useTranslation('translation', { keyPrefix: 'auth.signin' });

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
          <label htmlFor="login" className="form-label">{t('login')}:</label>
          <input name='login' placeholder={t('login')} className="form-control"/>
        </div>
        <div className="mb-3">
          <label htmlFor="password" className="form-label">{t('password')}</label>
          <input type="password" name='password' placeholder={t('password')} className="form-control" />
        </div>
        <input type='submit' value={t('submit')} className="btn btn-primary"/>
      </form>
      <>
        {errors && <div className="mt-3 alert alert-danger">{errors}</div>}
      </>
      <div className="mt-3">
        {t('not_registered_yet')} <Link to="/signup">{t('signup')}</Link>
      </div>
    </div>
  )
}
export default Login;
