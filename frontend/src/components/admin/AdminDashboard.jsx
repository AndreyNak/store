import { Link, Router, useLocation } from '@reach/router';
import React from 'react';
import Users from './Users/Users';
import Chats from './Chats/Chats';
import Chat from './Chats/Chat';
import User from './Users/User';
import { NotFound } from '../../bundles/Errors';
import Products from './Products/Products';
import TypeProducts from './TypeProducts/TypeProducts';
import Settings from './Settings/Settings';
import './admin-dashboard.scss'

const AdminDashboard = () => {
  const { pathname } = useLocation();

  const links = [
    { path: '/admin/users', label: 'Users' },
    { path: '/admin/products', label: 'Products' },
    { path: '/admin/type-products', label: 'Type Products' },
    { path: '/admin/chats', label: 'Chats' },
    { path: '/admin/settings', label: 'Settings' },
    { path: '/products', label: 'Home' }
  ];

  return (
    <div>
      <h1>Admin Dashboard</h1>
      <p>Welcome to the admin dashboard!</p>
      <div className='d-flex gap-2'>
        {links.map(({ path, label }) => (
          <Link
            key={path}
            className={`btn btn-link ${pathname === path ? 'selected' : ''}`}
            to={path}
          >
            {label}
          </Link>
        ))}
      </div>

      <Router>
        <NotFound default />
        <Users path="users" />
        <User path="users/:id" />
        <Products path="products" />
        <TypeProducts path="type-products" />
        <Settings path="settings" />
        <Chats path="chats" />
        <Chat path="chats/:id" />
      </Router>
    </div>
  )
}
export default AdminDashboard;
