import React, { useState } from 'react';
import { useEffect } from 'react';
import { del, get } from '../../../lib/http';
import Confirm from '../../../bundles/Confirm';
import { useCallback } from 'react';
import ProductForm from './ProductForm';
import Modal from '../../../bundles/Modal/Modal';
import DiscountForm from './DiscountForm';
import './products.scss'
import Loading from '../../../bundles/Loading';
import { hasPermission } from '../../../lib/permissions';
import { useGenericData } from '../../../bundles/GeneralContext';

const Products = () => {
  const [products, setProducts] = useState([]);
  const [countSoldOut, setCountSoldOut] = useState([]);
  const [typeProducts, setTypeProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [query, setQuery] = useState({ search: '', sold_out: false });
  const [isOpen, setIsOpen] = useState(false);
  const [isOpenDiscountForm, setIsOpenDiscountForm] = useState(false);
  const [discountedProduct, setDiscountedProduct] = useState(null);
  const [deletedProduct, setDeletedProduct] = useState(null);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [editedProduct, setEditedProduct] = useState(null);

  const { currentUser }= useGenericData();

  const fetchProducts = useCallback(async () => {
    const params = {...query}
    get('admin/products', params).then(({ products, type_products, countSoldOut }) => {
      setProducts(products);
      setTypeProducts(type_products)
      setCountSoldOut(countSoldOut);
    }).finally(() => setLoading(false))
  }, [query])

  useEffect(() => {
    fetchProducts()
  }, [fetchProducts])

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

  const closeDiscountForm = (data) => {
    setIsOpenDiscountForm(data);
    setDiscountedProduct(null);
  }

  return (
    <div>
      <h1>List of products</h1>
      {loading ? <Loading /> :(
        <>
          <button className={`btn btn-link ${query.sold_out && 'selected'}`} onClick={() => setQuery({...query, sold_out: !query.sold_out})}>
            <div className={`d-flex gap-2 ${countSoldOut > 0 && 'text-danger'}`}>
              <span>Sold out</span>
              {countSoldOut > 0 && <span>{countSoldOut}</span>}
            </div>
          </button>
          <input
            type="search"
            className='form-control mr-sm-2'
            value={query.search}
            placeholder='Search'
            onChange={(e) => setQuery({...query, search: e.target.value}) }
          />
          {hasPermission(currentUser, 'can_create_admin_product') && (
            <button className="btn btn-link" onClick={handleCreate}>Create new product</button>
          )}
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
          {discountedProduct && (
            <DiscountForm
              submit={(dataProduct) => submitDiscountForm(dataProduct)}
              discountedProduct={discountedProduct}
              isOpen={isOpenDiscountForm}
              setIsOpen={closeDiscountForm}
            />
          )}
          <div className="row row-cols-2 row-cols-md-auto">
            {products.length > 0  ? products.map((product) => (
              <div key={product.id} className="col mb-4">
                <div className="card">
                  <img src={product.urlImage} alt={product.name} />
                  <div className="card-body">
                    <h5 className="card-title">{product.name}</h5>
                    <p className='text-muted'>Quantity: {product.quantity}</p>
                    <div className='d-flex gap-2 mb-2   '>
                      <p className="card-text">{product.price} ₽</p>
                      {product.isDiscountActive && (
                        <>
                          <div>Discount Price:</div>
                          <p className="card-text">{product.discountPrice} ₽</p>
                        </>
                      )}
                    </div>
                    <div className='d-flex gap-2'>
                      {hasPermission(currentUser, 'can_edit_admin_product_make_discount') && (
                        <button className="btn btn-success" onClick={()=> handleDiscount(product)}>Make discount</button>
                      )}
                      {hasPermission(currentUser, 'can_edit_admin_product') && (
                        <button className="btn btn-primary mr-2" onClick={()=> handleEdit(product) }>Edit</button>
                      )}
                      {hasPermission(currentUser, 'can_delete_admin_product') && (
                        <button className="btn btn-danger" onClick={()=> actionOpenConfirm(product)}>Delete</button>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            )) : (
              <h3 className='text-muted'>Empty!</h3>
            )}
          </div>
        </>
      )}
    </div>
  )
}
export default Products;
