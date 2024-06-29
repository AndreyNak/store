import { useState } from "react";
import Modal from "../../../bundles/Modal/Modal";
import { patch, post } from "../../../lib/http";
import FormError from "../../../bundles/FormError";
import { useTranslation } from "react-i18next";

const Role = ({selectedRole = null , permissions, isOpen, query, setQuery, setIsOpen, onSubmit}) => {
  const [permissionIds, setPermissionIds] = useState(selectedRole?.permissionIds || []);
  const [errors, setErrors] = useState([]);

  const { t:tg } = useTranslation('translation');


  const onChange = (e) => {
    const id = parseInt(e.target.value, 10);
    setPermissionIds((prevPermissionIds) =>
      prevPermissionIds.includes(id)
        ? prevPermissionIds.filter((permId) => permId !== id)
        : [...prevPermissionIds, id]
    );
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const isEditRequest = !!selectedRole;

    try {
      const params = { role: { permission_ids: permissionIds }}
      const res = isEditRequest
        ? await patch(`admin/roles/${selectedRole.id}`, params)
        : await post(`admin/roles`, params)

      onSubmit({res, type: isEditRequest ? 'edit' : 'create'})
    } catch (data) {
      setErrors(data.errors)
    }
  }


  const permissionChunks = (permissions, size) => {
    const chunks = [];
    for (let i = 0; i < permissions.length; i += size) {
      chunks.push(permissions.slice(i, i + size));
    }
    return chunks;
  };

  const handleCloseModal = () => {
    setQuery({...query, search: ''});
    setIsOpen(false);
  }

  return (
    <Modal style={{ 'min-width': '40vw'}} isOpen={isOpen} setIsOpen={handleCloseModal}>
      <>
        <input
          type="search"
          className='form-control mr-sm-2'
          value={query.search}
          placeholder={tg('search')}
          onChange={(e) => setQuery({...query, search: e.target.value}) }
        />
        <form onSubmit={handleSubmit}>
          <div className="mb-3 fs-2">{selectedRole.name}</div>
          <div className="container">
            <div className="row">
              {permissionChunks(permissions, 10).map((column, columnIndex) => (
                <div key={columnIndex} className="col-md-6">
                  {column.map((perm) => (
                    <div key={perm.id} className="form-check mb-2">
                      <input
                        type="checkbox"
                        id={`perm_${perm.id}`}
                        className="form-check-input"
                        name="permissionIds"
                        value={perm.id}
                        onChange={onChange}
                        checked={permissionIds.includes(perm.id)}
                      />
                      <label htmlFor={`perm_${perm.id}`} className="form-check-label">
                        {perm.name}
                      </label>
                    </div>
                  ))}
                </div>
              ))}
            </div>
          </div>
          <button className="btn btn-primary mt-3" type="submit">{tg('submit')}</button>
          <FormError errors={errors} />
        </form>
      </>
    </Modal>
  )
}

export default Role;