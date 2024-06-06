import { Link, Router, useLocation } from '@reach/router';
import React from 'react';
import { NotFound } from '../../bundles/Errors';
import Products from './Products/Products';
import TypeProducts from './TypeProducts/TypeProducts';
import Settings from './Settings/Settings';
import './admin-dashboard.scss'
import { useGenericData } from '../../bundles/GeneralContext';
import { hasPermission } from '../../lib/permissions';
import { useMemo } from 'react';
import UsersContainer from './Users/UsersContainer';
import ChatsContainer from './Chats/ChatsContainer';
import RolesContainer from './Roles/RolesContainer';
import Admin from './Admin';

const AdminDashboard = () => {
  const { pathname } = useLocation();
  const { currentUser } = useGenericData();

  const canViewAdminUsers = useMemo(() => hasPermission(currentUser, 'can_view_admin_users'), [currentUser]);
  const canViewAdminRoles = useMemo(() => hasPermission(currentUser, 'can_view_admin_roles'), [currentUser]);
  const canViewAdminProducts = useMemo(() => hasPermission(currentUser, 'can_view_admin_products'), [currentUser]);
  const canViewAdminTypeProducts = useMemo(() => hasPermission(currentUser, 'can_view_admin_type_products'), [currentUser]);
  const canViewAdminChats = useMemo(() => hasPermission(currentUser, 'can_view_admin_chats'), [currentUser]);
  const canViewAdminSettings = useMemo(() => hasPermission(currentUser, 'can_view_admin_settings'), [currentUser]);

  const links = () => {
    const links = [{ path: '/products', label: 'Home' }];

    canViewAdminUsers && links.splice(0, 0, { path: '/admin/users', label: 'Users' })
    canViewAdminRoles && links.splice(1, 0, { path: '/admin/roles', label: 'Roles' })
    canViewAdminProducts && links.splice(2, 0, { path: '/admin/products', label: 'Products' })
    canViewAdminTypeProducts && links.splice(3, 0, { path: '/admin/type-products', label: 'Type Products' })
    canViewAdminChats && links.splice(4, 0, { path: '/admin/chats', label: 'Chats' })
    canViewAdminSettings && links.splice(5, 0, { path: '/admin/settings', label: 'Settings' })

    return links
  }

  return (
    <div>
      <h1>Admin Dashboard</h1>
      <p>Welcome to the admin dashboard!</p>
      <div className='d-flex gap-2'>
        {links().map(({ path, label }) => (
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
        {}
        <Admin path="/" />
        {canViewAdminUsers &&  <UsersContainer path="users/*" />}
        {canViewAdminRoles && <RolesContainer path="roles/*" />}
        {canViewAdminProducts && <Products path="products" />}
        {canViewAdminTypeProducts && <TypeProducts path="type-products" />}
        {canViewAdminChats && <ChatsContainer path="chats/*" />}
        {canViewAdminSettings && <Settings path="settings" />}
      </Router>
    </div>
  )
}
export default AdminDashboard;
