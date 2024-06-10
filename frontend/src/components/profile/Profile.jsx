import React from 'react';
import { Link, Router } from '@reach/router';
import Orders from './Orders';
import ProfileEdit from './ProfileEdit';
import Settings from './Settings';
import { useTranslation } from 'react-i18next';


const Profile = () => {
  const { t } = useTranslation('translation', { keyPrefix: 'profile.profile' });


  return (
    <div>
      <div className='d-flex gap-2'>
        <Link to="/products">Home</Link>
        <Link to="/profile/edit">Edit Profile</Link>
        <Link to="/profile/orders">Orders</Link>
        <Link to="/profile/settings">Settings</Link>
        <Link to="/support/main">{t('support')}</Link>
      </div>

      <h3>Root Profile</h3>
      <Router>
        <Orders path='orders'/>
        <ProfileEdit path='edit'/>
        <Settings path='settings'/>
      </Router>
    </div>

  )
}
export default Profile;
