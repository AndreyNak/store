import { useEffect } from "react";
import { get } from "../../../../lib/http";
import { useState } from "react";
import './permissions.scss'
import Permission from "./Permission";
import { hasPermission } from "../../../../lib/permissions";
import { useGenericData } from "../../../../bundles/GeneralContext";
import { useTranslation } from "react-i18next";

const Permissions = () => {
  const [permissions, setPermissions] = useState([]);
  const [query, setQuery] = useState({ search: '' });
  const [roles, setRoles] = useState([]);
  const [isOpen, setIsOpen] = useState(false);
  const [selectedPermission, setSelectedPermission] = useState(null);

  const { t } = useTranslation('translation', { keyPrefix: 'admin.roles.permissions.permissions' });

  const { currentUser } = useGenericData();

  useEffect(() => {
    const params = {...query}
    get('admin/roles/permissions', params).then(({permissions, roles}) => {
      setPermissions(permissions);
      setRoles(roles);
    });
  }, [query])


  const handleOpenUpdatePermission = (permission) => {
    setSelectedPermission(permission);
    setIsOpen(true);
  }

  const handleOpenCreatePermission = () => {
    setIsOpen(true);
  }

  const handleCreatePermission = (newPerm) => {
    setPermissions((prevPerms) => [...prevPerms, newPerm])
  }

  const handleSubmitPermission = ({type, res}) => {
    type === 'edit' ? handleUpdatePermission(res) : handleCreatePermission(res);

    handleClose()
  }

  const handleDeletePermission = (deletedPermission) => {
    setPermissions((prev_perms) => prev_perms.filter((perm) => perm.id !== deletedPermission.id))

    handleClose()
  }

  const handleUpdatePermission = (newPerm) => {
    setPermissions((prevPerms) => prevPerms.map((perm) =>
      perm.id === newPerm.id ? {...newPerm} : perm
    ))
  }

  const handleClose = () => {
    setIsOpen(false);
    setSelectedPermission(null);
  }

  return (
    <div className="container">
      <h1>{t('permissions')}:</h1>
      <input
        type="search"
        className='form-control mr-sm-2'
        value={query.search}
        placeholder='Search'
        onChange={(e) => setQuery({...query, search: e.target.value}) }
      />
      {hasPermission(currentUser, 'can_create_admin_permission') && (
        <button className="btn btn-link" onClick={() => handleOpenCreatePermission() }>{t('create_permission')}</button>
      )}
      {isOpen  && <Permission permissions={permissions} onDelete={handleDeletePermission} onSubmit={handleSubmitPermission} roles={roles} selectedPermission={selectedPermission} isOpen={isOpen} setIsOpen={handleClose} />}
      <div className="buttons-container">
        {permissions.map((permission) => (
          <div className="perm-button" onClick={() => handleOpenUpdatePermission(permission)}>
            {permission.name}
          </div>
        ))}
      </div>
    </div>
  )
}

export default Permissions; 