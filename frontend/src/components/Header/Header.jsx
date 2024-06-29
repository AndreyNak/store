import { useTranslation } from "react-i18next";
import Logout from "../Logout";
import "./header.scss"
import { hasPermission } from "../../lib/permissions";
import { Link } from "@reach/router";
import Notifications from "../Notifications/Notifications";
import Icon from "../../bundles/Icon";

const Header = ({ currentUser, setCurrentUser }) => {
  const { t } = useTranslation('translation', { keyPrefix: 'header' });

  return (
    <nav className="navbar navbar-light border-bottom bg-light sticky-header">
      <div className="container-fluid">
        <div className="d-flex align-items-center">
          <Link className="link-dark" to="/"><Icon name="home" /></Link>
          <div className="mx-2">{t('welcome')}, <Link className='mx-2' to="/profile">{currentUser.name || currentUser.login}</Link></div>
        </div>
        <Notifications />
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