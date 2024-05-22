import React, { useEffect, useState } from 'react';
import Filters from './Filters';
import Paginate from '../../../bundles/Paginate';
import { get, patch } from '../../../lib/http';
import { Link } from '@reach/router';

const Users = ({ currentUser }) => {
  const [users, setUsers] = useState([]);
  const [roles, setRoles] = useState([]);
  const [page, setPage ] = useState(1);
  const [maxPage, setMaxPage] = useState(null);
  const [query, setQuery ] = useState({ search: '', sort_by: ''})

  useEffect(() => {
    const params = { page, ...query };

    get('admin/users', params).then((res) => {
      setUsers(res.users);
      setMaxPage(res.meta.paginate.maxPage);
    }).then(() => get('admin/roles').then((roles) => setRoles(roles)))

  }, [page, query])

  const handleSetRoleUser = (userId, role) => {
    const body = {user: { rolsetPagee_id: role.id }}

    patch(`admin/users/${userId}`, body).then(() =>
      setUsers((prevUsers) =>
        prevUsers.map((user) =>
          user.id === userId ? {...user, role: role} : user
        )
      )
    )
  }

  return (
    <div>
      <h1>Users List</h1>
      <Filters currentUser={currentUser} query={query} setQuery={setQuery} />
      <Paginate page={page} maxPage={maxPage} setPage={setPage} />
      <table className="table table-striped">
        <thead className="thead-dark">
          <tr>
            <th><button onClick={() => setQuery({ ...query, sort_by: 'email'})} className="btn btn-link">Email</button></th>
            <th>Roles</th>
            <th><button onClick={() => setQuery({ ...query, sort_by: 'count_order'})} className="btn btn-link">Count Orders</button></th>
          </tr>
        </thead>
        <tbody>
          {users.map((user) => (
            <tr key={user.id}>
              <td>
                <Link to={`/admin/users/${user.id}`}>{user.email}</Link>
              </td>
              <td>
                {roles.map((role) => (
                  <React.Fragment key={role.id}>
                    <input
                      checked={user.role.name === role.name}
                      onChange={() => handleSetRoleUser(user.id, role)}
                      type="radio"
                      name={`role_${user.id}`}
                      value={role.name}
                      id={`role_${user.id}_${role.name}`}
                    />
                    <label htmlFor={`role_${user.id}_${role.name}`}>{role.name}</label>
                  </React.Fragment>
                ))}
              </td>
              <td>
                {user.countOrders}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <Paginate page={page} maxPage={maxPage} setPage={setPage} />
    </div>
  );
};
export default Users;
