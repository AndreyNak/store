import { useState } from "react";
import { useEffect } from "react";
import { get } from "../../../lib/http";
import Role from "./Role";
import { Link } from "@reach/router";
import { hasPermission } from "../../../lib/permissions";
import { useGenericData } from "../../../bundles/GeneralContext";

const Roles = () => {
  const [roles, setRoles] = useState([]);
  const [isOpen, setIsOpen] = useState(false);
  const [query, setQuery] = useState({ search: '' });
  const [selectedRole, setSelectedRole] = useState(null);
  const [permissions, setPermissions] = useState([]);

  const { currentUser } = useGenericData();

  useEffect(() => {
    const params = {...query}
    get('admin/roles', params)
    .then(({ roles, permissions }) => {
      setPermissions(permissions);
      setRoles(roles)
    })
    .catch((err) => {});
  }, [query])

  const handleOpenUpdateRole = (role) => {
    setSelectedRole(role);
    setIsOpen(true);
  }

  const handleCreateRole = (newRole) => {
    setRoles((prevRoles) => [...prevRoles, newRole])
  }

  const handleSubmitRole = ({type, res}) => {
    type === 'edit' ? handleUpdateRole(res) : handleCreateRole(res);

    handleClose()
  }

  const handleUpdateRole = (newRole) => {
    setRoles((prevRoles) => prevRoles.map((role) =>
      role.id === newRole.id ? {...newRole} : role
    ))
  }

  const handleClose = () => {
    setIsOpen(false);
    setSelectedRole(null);
  }

  return (
    <div className="container">
      {isOpen  && <Role
        query={query}
        setQuery={setQuery}
        onSubmit={handleSubmitRole}
        selectedRole={selectedRole}
        permissions={permissions}
        isOpen={isOpen}
        setIsOpen={handleClose}
        />
      }
      <h2>Roles:</h2>
      <div className="d-flex align-items-center">
        {hasPermission(currentUser, 'can_view_admin_permissions')  && <Link to="permissions">Permissions</Link>}
      </div>
      <div className="d-flex gap-2">
        {roles.map((role) => (
          <div onClick={() => handleOpenUpdateRole(role)} className="border-end">
            {role.name}
            {permissions.map((perm) => (
              <div key={perm.id} className="form-check mr-3 mb-2">
                <input
                  type="checkbox"
                  disabled
                  readOnly
                  id={`perm_${perm.id}`}
                  className="form-check-input fs-5 me-2"
                  name="permissionIds"
                  value={perm.id}
                  checked={role.permissionIds.includes(perm.id)}
                />
                <label
                  htmlFor={`perm_${perm.id}`}
                  className="form-check-label fs-5"
                >
                  {perm.name}
                </label>
              </div>
            ))}
          </div>
        ))}
      </div>
    </div>
  )
}

export default Roles;