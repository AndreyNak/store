import { useState } from "react";
import FormError from "../../../bundles/FormError";
import { patchFile, postFile } from "../../../lib/http";

const ProductForm = ({ editedProduct, typeProducts, onCLose, formSubmit }) => {
  const [errors, setErrors] = useState([]);
  const [formState, setFormState] = useState({
    name: editedProduct?.name || '',
    description:  editedProduct?.description || '',
    image: editedProduct?.urlImage || null,
    price: editedProduct?.price || '',
    typeProductIds: editedProduct?.typeProductIds || []
  });

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
    formData.append('product[name]', formState.name);
    formData.append('product[description]', formState.description);
    if (formState.image instanceof File) {
      formData.append('product[image]', formState.image);
    }
    formData.append('product[price]', formState.price);
    formState.typeProductIds.forEach(id => formData.append('product[type_product_ids][]', id));


    handleProduct(formData)
  };

  return (
    <div className="container mt-4">
      <button className="btn btn-secondary" onClick={() => onCLose(false)}>Close</button>
      <h1>Create new product</h1>
      <form onSubmit={handleSubmit} encType="multipart/form-data">
        <div className="mb-3">
          <label htmlFor="name" className="form-label">Name</label>
          <input
            type="text"
            id="name"
            name="name"
            value={formState.name}
            onChange={handleChange}
            className="form-control"
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="description" className="form-label">Description</label>
          <textarea
            id="description"
            name="description"
            value={formState.description}
            onChange={handleChange}
            className="form-control"
          />
        </div>
        <div className="mb-3">
          <label htmlFor="image" className="form-label">Image</label>
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
          <label htmlFor="price" className="form-label">Price</label>
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
        <label className="mb-2 mr-2">Type Products</label>
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
                {type.name}
              </label>
            </div>
          ))}
        </div>
        <div>
          <button type="submit" className="btn btn-primary">{isEdit ? 'Edit' : 'Create'} product</button>
        </div>
        <FormError errors={errors}/>
      </form>
    </div>
  );
};

export default ProductForm;
