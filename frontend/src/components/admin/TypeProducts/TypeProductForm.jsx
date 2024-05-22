import { useState } from "react";
import FormError from "../../../bundles/FormError";
import { patchFile, postFile } from "../../../lib/http";

const ProductForm = ({ editedTypeProduct, products, onCLose, formSubmit }) => {
  const [errors, setErrors] = useState([]);
  const [formState, setFormState] = useState({
    name: editedTypeProduct?.name || '',
    description:  editedTypeProduct?.description || '',
    productsIds: editedTypeProduct?.productIds || []
  });

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
    formData.append('type_product[name]', formState.name);
    formData.append('type_product[description]', formState.description);
    formState.productsIds.forEach(id => formData.append('type_product[product_ids][]', id));


    handleTypeProduct(formData)
  };


  console.log(formState)

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
        <label className="mb-2 mr-2">Type Products</label>
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
                {product.name}
              </label>
            </div>
          ))}
        </div>
        <div>
          <button type="submit" className="btn btn-primary">{isEdit ? 'Edit' : 'Create'} type product</button>
        </div>
        <FormError errors={errors}/>
      </form>
    </div>
  );
};

export default ProductForm;
