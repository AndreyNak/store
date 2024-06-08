import { useState } from "react";
import { del, patch, post } from "../../../../lib/http";
import Modal from "../../../../bundles/Modal/Modal";
import FormError from "../../../../bundles/FormError";
import Confirm from "../../../../bundles/Confirm";
import { Tooltip } from 'react-tooltip';
import './permission.scss';
import { useGenericData } from "../../../../bundles/GeneralContext";
import { hasPermission } from "../../../../lib/permissions";
import { useTranslation } from "react-i18next";




const Permission = ({selectedPermission = null, roles, isOpen, setIsOpen, onDelete, onSubmit}) => {
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [name, setName] = useState(selectedPermission?.name || '');
  const [roleIds, setRoleIds] = useState(selectedPermission?.roleIds || []);
  const [errors, setErrors] = useState([]);

  const { t } = useTranslation('translation', { keyPrefix: 'admin.roles.permissions.permission' });
  const { t:tg } = useTranslation('translation');


  const { currentUser } = useGenericData();



  const handleSubmit = async (e) => {
    e.preventDefault();

    const isEditRequest = !!selectedPermission;

    try {
      const params = { permission: { name, role_ids: roleIds }}
      const res = isEditRequest
        ? await patch(`admin/roles/permissions/${selectedPermission.id}`, params)
        : await post(`admin/roles/permissions`, params)

      onSubmit({res, type: isEditRequest ? 'edit' : 'create'})
    } catch (data) {
      setErrors(data.errors)
    }
  }


  const onChange = (e) => {
    const id = parseInt(e.target.value, 10);
    setRoleIds((prevRoleIds) =>
      prevRoleIds.includes(id)
        ? prevRoleIds.filter((roleId) => roleId !== id)
        : [...prevRoleIds, id]
    );
  };

  const handleOpenConfirm = () => {
    setIsOpenConfirm(true);
  }

  const handleActionNo = () => {
    setIsOpenConfirm(false);
  }

  const handleActionYes = () => {
    del(`admin/roles/permissions/${selectedPermission.id}`).then(() =>
      onDelete(selectedPermission)
    )
  }

  return (
    <Modal style={{ 'min-width': '35vw'}} isOpen={isOpen} setIsOpen={setIsOpen}>
      <button className="btn btn-secondary my-2" onClick={setIsOpen}>{tg('close')}</button>
      <Confirm isOpen={isOpenConfirm} setIsOpen={setIsOpenConfirm} actionNo={handleActionNo} actionYes={handleActionYes} />
      <div className="container d-flex flex-column align-items-center">
        {hasPermission(currentUser, 'can_edit_admin_permission') && (
          <div>
            <button
              className="my-2 btn btn-link"
              data-tooltip-id="my-tooltip"
              data-tooltip-content='can_<verb:[view|edit|delete|create]*>_<[namespaces]>_<resource[s]*>_<specify_action>'
            >
              {t('how_create')}
            </button>
            <Tooltip className="tooltip" id="my-tooltip" />
          </div>
        )}
        <form onSubmit={handleSubmit}>
          {hasPermission(currentUser, 'can_edit_admin_permission') && (
            <>
              <label>{t('name')}:</label>
              <input  name="text" type="text" value={name} onChange={(e) => setName(e.target.value)}/>
            </>
          )}
          <div className="mb-3 fs-2">{name}</div>
            <div>
              {roles.map((role) => (
                <div key={role.id} className="form-check mb-2">
                  <input
                    disabled={!hasPermission(currentUser, 'can_edit_admin_permission')}
                    type="checkbox"
                    id={`perm_${role.id}`}
                    className="form-check-input"
                    name="roleIds"
                    value={role.id}
                    onChange={onChange}
                    checked={roleIds.includes(role.id)}
                  />
                  <label htmlFor={`perm_${role.id}`} className="form-check-label">
                    {role.name}
                  </label>
                </div>
              ))}
            </div>
            <div className="d-flex justify-content-between">
              {hasPermission(currentUser, 'can_edit_admin_permission') && (
                <button className="btn btn-primary mt-3" type="submit">{tg('submit')}</button>
              )}
              {hasPermission(currentUser, 'can_delete_admin_permission') &&
                selectedPermission && <div className="btn btn-danger mt-3" onClick={handleOpenConfirm}>{tg('delete')}</div>
              }
            </div>
          <FormError errors={errors} />
        </form>
      </div>
    </Modal>
  )
}

export default Permission;