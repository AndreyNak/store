import { useState } from "react";
import FormError from "../../../bundles/FormError";
import { patchFile, postFile } from "../../../lib/http";
import { useTranslation } from "react-i18next";

const ProductForm = ({ editedProduct, typeProducts, onCLose, formSubmit }) => {
  const [errors, setErrors] = useState([]);
  const [formState, setFormState] = useState({
    tname: editedProduct?.tname || '',
    tnameRu: editedProduct?.tnameRu || '',
    tnameEn: editedProduct?.tnameEn || '',
    name: editedProduct?.name || '',
    description:  editedProduct?.description || '',
    image: editedProduct?.urlImage || null,
    price: editedProduct?.price || '',
    quantity: editedProduct?.quantity.toString() || '',
    typeProductIds: editedProduct?.typeProductIds || []
  });

  const { t } = useTranslation('translation', { keyPrefix: 'admin.products.product_form' });
  const { t:tg } = useTranslation('translation');


  const isEdit = !!editedProduct

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    if (type === 'checkbox') {
      const ids = formState.typeProductIds;
      if (checked) {
        ids.push(parseInt(value, 10));
      } else {
        const index = ids.indexOf(parseInt(value, 10));
        if (index > -1) {
          ids.splice(index, 1);
        }
      }
      setFormState({ ...formState, typeProductIds: ids });
    } else if (type === 'file') {
      setFormState({ ...formState, image: e.target.files[0] });
    } else {
      setFormState({ ...formState, [name]: value });
    }
  };

  const handleProduct = async (formData) => {
    try {
      const isEditRequest = isEdit;
      const res = isEditRequest
        ? await patchFile(`admin/products/${editedProduct.id}`, formData)
        : await postFile('admin/products', formData);
      formSubmit({res, type: isEditRequest ? 'edit' : 'create'});
    } catch (errData) {
      setErrors(errData.errors);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('product[tname_en]', formState.tnameEn);
    formData.append('product[tname_ru]', formState.tnameRu);
    formData.append('product[name]', formState.tnameEn);
    formData.append('product[description]', formState.description);
    if (formState.image instanceof File) {
      formData.append('product[image]', formState.image);
    }
    formData.append('product[price]', formState.price);
    formData.append('product[quantity]', formState.quantity);
    formState.typeProductIds.forEach(id => formData.append('product[type_product_ids][]', id));


    handleProduct(formData)
  };

  return (
    <div className="container mt-4">
      <button className="btn btn-secondary" onClick={() => onCLose(false)}>{tg('close')}</button>
      <h1>{t('create_new_product')}</h1>
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
            rows={6}
            onChange={handleChange}
            className="form-control"
          />
        </div>
        <div className="mb-3">
          <label htmlFor="image" className="form-label">{t('image')}</label>
          <input
            type="file"
            id="image"
            name="image"
            onChange={handleChange}
            className="form-control"
            required={!isEdit}
          />
          <div>
            {formState.image && <img src={formState.image} alt="Product" />}
          </div>
        </div>
        <div className="mb-3">
          <label htmlFor="price" className="form-label">{t('price')}</label>
          <input
            type="text"
            id="price"
            name="price"
            value={formState.price}
            onChange={handleChange}
            className="form-control"
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="quantity" className="form-label">{t('quantity')}</label>
          <input
            type="text"
            id="quantity"
            name="quantity"
            value={formState.quantity}
            onChange={handleChange}
            className="form-control"
            required
          />
        </div>
        <label className="mb-2 mr-2">{t('type_products')}</label>
        <div className="d-flex flex-wrap gap-3">
          {typeProducts.map((type) => (
            <div key={type.id} className="form-check mr-3 mb-2">
              <input
                type="checkbox"
                id={`type_product_${type.id}`}
                className="form-check-input fs-5 me-2"
                name="typeProductIds"
                value={type.id}
                checked={formState.typeProductIds.includes(type.id)}
                onChange={handleChange}
              />
              <label
                htmlFor={`type_product_${type.id}`}
                className="form-check-label fs-5"
              >
                {type.tname}
              </label>
            </div>
          ))}
        </div>
        <div>
          <button type="submit" className="btn btn-primary">{isEdit ? t('edit_product') : t('create_product')}</button>
        </div>
        <FormError errors={errors}/>
      </form>
    </div>
  );
};

export default ProductForm;
