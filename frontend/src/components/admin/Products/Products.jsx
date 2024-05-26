import React, { useState } from 'react';
import { useEffect } from 'react';
import { del, get } from '../../../lib/http';
import Confirm from '../../../bundles/Confirm';
import { useCallback } from 'react';
import ProductForm from './ProductForm';
import Modal from '../../../bundles/Modal/Modal';
import DiscountForm from './DiscountForm';

const Products = () => {
  const [products, setProducts] = useState([]);
  const [typeProducts, setTypeProducts] = useState([]);
  const [query, setQuery] = useState({ search: '' });
  const [isOpen, setIsOpen] = useState(false);
  const [isOpenDiscountForm, setIsOpenDiscountForm] = useState(false);
  const [discountedProduct, setDiscountedProduct] = useState(null);
  const [deletedProduct, setDeletedProduct] = useState(null);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [editedProduct, setEditedProduct] = useState(null);

  const fetchProducts = useCallback(async () => {
    const params = {...query}
    get('admin/products', params).then((productsData) => setProducts(productsData))
  }, [query])

  useEffect(() => {
    fetchProducts()
  }, [fetchProducts])

  useEffect(() => {
    get('admin/type_products').then((data) => setTypeProducts(data))
  }, [])

  const handleActionYes = () => {
    del(`admin/products/${deletedProduct.id}`).then(() => {
      setDeletedProduct(null);
      setIsOpenConfirm(false);
      fetchProducts();
    })
  }

  const updateStateAddProduct  = (newProduct) => {
    setProducts((prevProducts) => [newProduct, ...prevProducts]);
  }

  const updateStateUpdateProduct  = (updatedProduct) => {
    setProducts((prevProducts) =>
      prevProducts.map((product) =>
        product.id === updatedProduct.id ? updatedProduct : product
      )
    );
  }

  const handleSubmit = ({ res, type }) => {
    type === 'edit' ? updateStateUpdateProduct(res) : updateStateAddProduct(res)
    setIsOpen(false);
  }

  const handleActionNo = () => {
    setIsOpenConfirm(false);
    setEditedProduct(null);
  }

  const handleEdit = (product) => {
    setEditedProduct(product);
    setIsOpen(true);
  }

  const handleCreate = () => {
    setEditedProduct(null);
    setIsOpen(true);
  }

  const actionOpenConfirm = (product)  => {
    setDeletedProduct(product)
    setIsOpenConfirm(true)
  }

  const handleDiscount = (product) => {
    setIsOpenDiscountForm(true)
    setDiscountedProduct(product);
  }

  const submitDiscountForm = (product) => {
    updateStateUpdateProduct(product);
    setIsOpenDiscountForm(false)
    setDiscountedProduct(null);
  }

  return (
    <div>
      <h1>List of products</h1>
      <input
        type="search"
        className='form-control mr-sm-2'
        value={query.search}
        placeholder='Search'
        onChange={(e) => setQuery({...query, search: e.target.value}) }
      />
      <button className="btn btn-link" onClick={handleCreate}>Create new product</button>
      <Modal
        isOpen={isOpen}
        setIsOpen={setIsOpen}
      >
        <ProductForm
          editedProduct={editedProduct}
          typeProducts={typeProducts}
          onCLose={setIsOpen}
          formSubmit={(dataProduct) => handleSubmit(dataProduct) }
        />
      </Modal>
      <Confirm isOpen={isOpenConfirm} setIsOpen={setIsOpenConfirm} actionNo={handleActionNo} actionYes={handleActionYes} />
      <DiscountForm submit={(dataProduct) => submitDiscountForm(dataProduct)} discountedProduct={discountedProduct} isOpen={isOpenDiscountForm} setIsOpen={setIsOpenDiscountForm} />
      <div className="row row-cols-2 row-cols-md-auto">
        {products.map((product) => (
          <div key={product.id} className="col mb-4">
            <div className="card">
              <img src={product.urlImage} alt={product.name} />
              <div className="card-body">
                <h5 className="card-title">{product.name}</h5>
                <div className='d-flex gap-2 mb-2   '>
                  <p className="card-text">{product.price} ₽</p>
                  {product.discountPrice && (
                    <>
                      <div>Discount Price:</div>
                      <p className="card-text">{product.discountPrice} ₽</p>
                    </>
                  )}
                </div>
                <div className='d-flex gap-2'>
                  <button className="btn btn-success" onClick={()=> handleDiscount(product)}>Make discount</button>
                  <button className="btn btn-primary mr-2" onClick={()=> handleEdit(product) }>Edit</button>
                  <button className="btn btn-danger" onClick={()=> actionOpenConfirm(product)}>Delete</button>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
export default Products;
