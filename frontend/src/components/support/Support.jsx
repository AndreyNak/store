import { Link, Router } from "@reach/router";
import { NotFound } from "../../bundles/Errors";
import Chats from "./Chats";
import Chat from "./Chat";
import { useTranslation } from "react-i18next";

const Support = () => {
  const { t } = useTranslation('translation', { keyPrefix: 'profile.support' });

  return (
    <div>
      <h1>Support</h1>
      <div className="d-flex gap-2">
        <Link to="/products">{t('main')}</Link>
        <Link to="/profile">{t('profile')}</Link>
      </div>
      <Router>
        <NotFound default />
        <Chats path="main"/>
        <Chat path="chats/:id" />
      </Router>
    </div>
  )
}

export default Support;
