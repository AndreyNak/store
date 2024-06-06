import React, { useEffect, useState } from 'react';
import Filters from './Filters';
import Paginate from '../../../bundles/Paginate';
import { get, patch } from '../../../lib/http';
import { Link } from '@reach/router';
import { useGenericData } from '../../../bundles/GeneralContext';
import { hasPermission } from '../../../lib/permissions';

const Users = () => {
  const [users, setUsers] = useState([]);
  const [roles, setRoles] = useState([]);
  const [page, setPage ] = useState(1);
  const [maxPage, setMaxPage] = useState(null);
  const [query, setQuery ] = useState({ search: '', sort_by: ''})

  const { currentUser } = useGenericData();

  useEffect(() => {
    const params = { page, ...query };

    get('admin/users', params).then((res) => {
      setUsers(res.users);
      setMaxPage(res.meta.paginate.maxPage);
      setRoles(res.roles)
    })

  }, [page, query])

  const handleSetRoleUser = (userId, role) => {
    const body = {user: { role_id: role.id }}

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
      <Filters query={query} setQuery={setQuery} />
      <Paginate page={page} maxPage={maxPage} setPage={setPage} />
      <table className="table table-striped">
        <thead className="thead-dark">
          <tr>
            <th><button onClick={() => setQuery({ ...query, sort_by: 'email'})} className="btn btn-link">Email</button></th>
            {hasPermission(currentUser, 'can_edit_admin_user') && <th>Roles</th>}
            <th><button onClick={() => setQuery({ ...query, sort_by: 'count_order'})} className="btn btn-link">Count Orders</button></th>
          </tr>
        </thead>
        <tbody>
          {users.map((user) => (
            <tr key={user.id}>
              <td>
                {hasPermission(currentUser, 'can_view_admin_user')
                  ? <Link to={`/admin/users/${user.id}`}>{user.email}</Link>
                  : <span>{user.email}</span>
                }
              </td>
              {hasPermission(currentUser, 'can_edit_admin_user') && (
                <td>
                  {roles.map((role) => (
                    <React.Fragment key={role.id}>
                      <input
                        checked={user.role.name === role.name}
                        onChange={() => handleSetRoleUser(user.id, role)}
                        className='me-1'
                        type="radio"
                        name={`role_${user.id}`}
                        value={role.name}
                        id={`role_${user.id}_${role.name}`}
                      />
                      <label className='me-2' htmlFor={`role_${user.id}_${role.name}`}>{role.name}</label>
                    </React.Fragment>
                  ))}
                </td>
              )}
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
