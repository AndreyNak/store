import React from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import Orders from './Orders';
import ProfileEdit from './ProfileEdit';
import Settings from './Settings';
import { useTranslation } from 'react-i18next';
import Restriction from './Restrictions';


const Profile = () => {
  const { t } = useTranslation('translation', { keyPrefix: 'profile.profile' });


  return (
    <div>
      <div className='d-flex gap-2'>
        <Link to="/products">Home</Link>
        <Link to="/profile/edit">Edit Profile</Link>
        <Link to="/profile/orders">Orders</Link>
        <Link to="/profile/restrictions">Restrictions</Link>
        <Link to="/profile/settings">Settings</Link>
        <Link to="/support/main">{t('support')}</Link>
      </div>

      <h3>Root Profile</h3>
      <Routes>
        <Route path="orders" element={<Orders/>} />
        <Route path="edit" element={<ProfileEdit/>} />
        <Route path="restrictions" element={<Restriction/>} />
        <Route path="settings" element={<Settings/>} />
      </Routes>
    </div>

  )
}
export default Profile;
