import React from 'react';
import { Link, Router } from '@reach/router';
import Orders from './Orders';
import ProfileEdit from './ProfileEdit';
import Settings from './Settings';


const Profile = () => {

  return (
    <div>
      <div className='d-flex gap-2'>
        <Link to="/products">Home</Link>
        <Link to="/profile/edit">Edit Profile</Link>
        <Link to="/profile/orders">Orders</Link>
        <Link to="/profile/settings">Settings</Link>
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
