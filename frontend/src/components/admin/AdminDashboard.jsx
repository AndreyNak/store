import { Link, Router } from '@reach/router';
import React from 'react';
import Users from './Users/Users';
import Chats from './Chats/Chats';
import Chat from './Chats/Chat';
import User from './Users/User';
import { NotFound } from '../../bundles/Errors';
import Products from './Products/Products';
import TypeProducts from './TypeProducts/TypeProducts';

const AdminDashboard = () => (
  <div>
    <h1>Admin Dashboard</h1>
    <p>Welcome to the admin dashboard!</p>
    <div className='d-flex gap-2'>
      <Link to="/admin/users">Users</Link>
      <Link to="/admin/products">Products</Link>
      <Link to="/admin/type-products">Type Products</Link>
      <Link to="/admin/chats">Chats</Link>
      <Link to="/products">Home</Link>
    </div>

    <Router>
      <NotFound default />
      <Users path="users" />
      <User path="users/:id" />
      <Products path="products" />
      <TypeProducts path="type-products" />
      <Chats path="chats" />
      <Chat path="chats/:id" />
    </Router>
  </div>
)
export default AdminDashboard;
