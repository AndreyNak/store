import { navigate } from "@reach/router";
import { logout } from "../lib/http"
import '../i18n';

import { useTranslation } from "react-i18next";

const Logout =({ setCurrentUser })=>{
  const { t } = useTranslation('translation', { keyPrefix: 'auth' });


  const actionLogout = async () => {
    logout().then(() => {
      setCurrentUser(null);
      navigate('/');
    }).catch((err) => console.log(err));
  };

  const handleClick = () => actionLogout();

  return <input className="btn btn-warning" type="button" value={t('logout')} onClick={handleClick}/>
}

export default Logout;
