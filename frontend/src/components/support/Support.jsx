import { Routes, Route, Link } from "react-router-dom";
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
      <Routes>
        <Route path="*" element={<NotFound />} />
        <Route path="main" element={<Chats/>} />
        <Route path="chats/:id" element={<Chat/>} />
      </Routes>
    </div>
  )
}

export default Support;
