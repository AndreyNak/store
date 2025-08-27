import { Routes, Route, Link, useLocation } from 'react-router-dom';
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
import { useTranslation } from 'react-i18next';
import OrdersContainer from './Orders/OrdersContainer';

const AdminDashboard = () => {
  const { pathname } = useLocation();
  const { currentUser } = useGenericData();

  const { t } = useTranslation('translation', { keyPrefix: 'admin.dashboard' });

  const canViewAdminUsers = useMemo(() => hasPermission(currentUser, 'can_view_admin_users'), [currentUser]);
  const canViewAdminOrders = useMemo(() => hasPermission(currentUser, 'can_view_admin_orders'), [currentUser]);
  const canViewAdminRoles = useMemo(() => hasPermission(currentUser, 'can_view_admin_roles'), [currentUser]);
  const canViewAdminProducts = useMemo(() => hasPermission(currentUser, 'can_view_admin_products'), [currentUser]);
  const canViewAdminTypeProducts = useMemo(() => hasPermission(currentUser, 'can_view_admin_type_products'), [currentUser]);
  const canViewAdminChats = useMemo(() => hasPermission(currentUser, 'can_view_admin_chats'), [currentUser]);
  const canViewAdminSettings = useMemo(() => hasPermission(currentUser, 'can_view_admin_settings'), [currentUser]);

  const links = () => {
    const links = [{ path: '/products', label: t("home") }];

    canViewAdminUsers && links.splice(0, 0, { path: '/admin/users', label: t("users") })
    canViewAdminOrders && links.splice(1, 0, { path: '/admin/orders', label: t("orders") })
    canViewAdminRoles && links.splice(2, 0, { path: '/admin/roles', label: t("roles") })
    canViewAdminProducts && links.splice(3, 0, { path: '/admin/products', label: t("products") })
    canViewAdminTypeProducts && links.splice(4, 0, { path: '/admin/type-products', label: t("type_products") })
    canViewAdminChats && links.splice(5, 0, { path: '/admin/chats', label: t("chats") })
    canViewAdminSettings && links.splice(6, 0, { path: '/admin/settings', label: t("settings") })

    return links
  }

  return (
    <div>
      <div className='m-2'>
        <h1>{t('title')}</h1>
        <p>{t('welcome')}</p>
      </div>
      <div className='d-flex gap-2'>
        {links().map(({ path, label }) => (
          <Link
            key={path}
            className={`btn btn-link ${pathname.startsWith(path) ? 'selected' : ''}`}
            to={path}
          >
            {label}
          </Link>
        ))}
      </div>
      <Routes>
        <Route path='*' element={<NotFound/>} />
        <Route path='/' element={<Admin/>} />
        {canViewAdminUsers && <Route path='users/*' element={<UsersContainer/>} />}
        {canViewAdminOrders && <Route path='orders/*' element={<OrdersContainer/>} />}
        {canViewAdminRoles && <Route path='roles/*' element={<RolesContainer/>} />}
        {canViewAdminProducts && <Route path='products' element={<Products/>} />}
        {canViewAdminTypeProducts && <Route path='type-products' element={<TypeProducts/>} />}
        {canViewAdminChats && <Route path='chats/*' element={<ChatsContainer/>} />}
        {canViewAdminSettings && <Route path='settings' element={<Settings/>} />}

      </Routes>
    </div>
  )
}
export default AdminDashboard;
