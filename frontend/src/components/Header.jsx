import { useTranslation } from "react-i18next";
import Logout from "./Logout";

const Header = ({ currentUser, setCurrentUser }) => {
  const { t } = useTranslation('translation', { keyPrefix: 'header' });

  return (
    <div>
      <div className="d-flex">
        <div className="mx-2">{t('welcome')}, {currentUser.name || currentUser.login}</div>
        <div>{t('role')} {currentUser.role.name}</div>
      </div>
      <Logout setCurrentUser={setCurrentUser}/>
    </div>
  )
}

export default Header;