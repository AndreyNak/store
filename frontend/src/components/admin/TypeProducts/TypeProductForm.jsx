import { useState } from "react";
import FormError from "../../../bundles/FormError";
import { patchFile, postFile } from "../../../lib/http";
import Modal from "../../../bundles/Modal/Modal";
import { useTranslation } from "react-i18next";

const TypeProductForm = ({ editedTypeProduct, isOpen, setIsOpen, products, onCLose, formSubmit }) => {
  const [errors, setErrors] = useState([]);
  const [formState, setFormState] = useState({
    tname:  editedTypeProduct?.tname || '',
    tnameRu:  editedTypeProduct?.tnameRu || '',
    tnameEn:  editedTypeProduct?.tnameEn || '',
    description:  editedTypeProduct?.description || '',
    productsIds: editedTypeProduct?.productIds || []
  });

  const { t } = useTranslation('translation', { keyPrefix: 'admin.type_products.type_product_form' });
  const { t:tg } = useTranslation('translation');


  const isEdit = !!editedTypeProduct

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    if (type === 'checkbox') {
      const ids = formState.productsIds;
      if (checked) {
        ids.push(parseInt(value, 10));
      } else {
        const index = ids.indexOf(parseInt(value, 10));
        if (index > -1) {
          ids.splice(index, 1);
        }
      }
      setFormState({ ...formState, productsIds: ids });
    } else {
      setFormState({ ...formState, [name]: value });
    }
  };

  const handleTypeProduct = async (formData) => {
    try {
      const isEditRequest = isEdit;
      const res = isEditRequest
        ? await patchFile(`admin/type_products/${editedTypeProduct.id}`, formData)
        : await postFile('admin/type_products', formData);
      formSubmit({res, type: isEditRequest ? 'edit' : 'create'});
    } catch (errData) {
      setErrors(errData.errors);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('type_product[tname_en]', formState.tnameEn);
    formData.append('type_product[tname_ru]', formState.tnameRu);
    formData.append('type_product[name]', formState.tnameEn);
    formData.append('type_product[description]', formState.description);
    formState.productsIds.forEach(id => formData.append('type_product[product_ids][]', id));


    handleTypeProduct(formData)
  };

  return (
    <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
      <div className="container mt-4">
        <button className="btn btn-secondary" onClick={() => onCLose(false)}>{tg("close")}</button>
        <h1>{isEdit ? t('edit_type_product') : t('create_type_product')}</h1>
        <form onSubmit={handleSubmit} encType="multipart/form-data">
        <div className="mb-3">
            <label htmlFor="tnameRu" className="form-label">RU:{t('name')}</label>
            <input
              type="text"
              id="tnameRu"
              name="tnameRu"
              value={formState.tnameRu}
              onChange={handleChange}
              className="form-control"
              required
            />
          </div>
          <div className="mb-3">
            <label htmlFor="tnameEn" className="form-label">EN:{t('name')}</label>
            <input
              type="text"
              id="tnameEn"
              name="tnameEn"
              value={formState.tnameEn}
              onChange={handleChange}
              className="form-control"
              required
            />
          </div>
          <div className="mb-3">
            <label htmlFor="description" className="form-label">{t('description')}</label>
            <textarea
              id="description"
              name="description"
              value={formState.description}
              onChange={handleChange}
              className="form-control"
            />
          </div>
          <label className="mb-2 mr-2">{t('products')}</label>
          <div className="d-flex flex-wrap gap-3">
            {products.map((product) => (
              <div key={product.id} className="form-check mr-3 mb-2">
                <input
                  type="checkbox"
                  id={`product${product.id}`}
                  className="form-check-input fs-5 me-2"
                  name="productIds"
                  value={product.id}
                  checked={formState.productsIds.includes(product.id)}
                  onChange={handleChange}
                />
                <label
                  htmlFor={`product${product.id}`}
                  className="form-check-label fs-5"
                >
                  {product.tname}
                </label>
              </div>
            ))}
          </div>
          <div>
            <button type="submit" className="btn btn-primary">{`${(isEdit ? tg("edit") : tg('create'))} ${t('type_product')}`}</button>
          </div>
          <FormError errors={errors}/>
        </form>
      </div>
    </Modal>
  );
};

export default TypeProductForm;
