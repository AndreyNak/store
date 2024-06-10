import { useTranslation } from "react-i18next";
import Logout from "./Logout";
import { hasPermission } from "../lib/permissions";
import { Link } from "@reach/router";

const Header = ({ currentUser, setCurrentUser }) => {
  const { t } = useTranslation('translation', { keyPrefix: 'header' });

  return (
    <nav class="navbar navbar-light bg-light">
      <div class="container-fluid">
        <div className="mx-2">{t('welcome')}, <Link className='mx-2' to="/profile">{currentUser.name || currentUser.login}</Link></div>
        <div className="d-flex gap-2">
          <div>{t('role')}</div>
          {hasPermission(currentUser, 'can_view_admin')
            ? <Link to="/admin">{currentUser.role.name}</Link>
            : <div>{currentUser.role.name}</div>}
        </div>
        <Logout setCurrentUser={setCurrentUser}/>
      </div>
    </nav>
  )
}

export default Header;