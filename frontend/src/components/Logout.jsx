import { navigate } from "@reach/router";
import { logout } from "../lib/http"

const Logout =({ setCurrentUser })=>{
  const actionLogout = async () => {
    logout('logout').then(() => {
      setCurrentUser(null);
      navigate('/');
    }).catch((err) => console.log(err));
  };

  const handleClick = () => actionLogout();

  return <input type="button" value='Logout' onClick={handleClick}/>
}

export default Logout;
