import { useCallback, useEffect, useState } from "react";
import { get, del } from "../../../lib/http";
import Confirm from "../../../bundles/Confirm";
import TypeProductForm from './TypeProductForm';
import Modal from "../../../bundles/Modal/Modal";

const TypeProducts = () => {
  const [typeProducts, setTypeProducts] = useState([]);
  const [products, setProducts] = useState([]);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [isOpen, setIsOpen] = useState(false);
  const [deletedTypeProduct, setDeletedTypeProduct] = useState(null);
  const [editedTypeProduct, setEditedTypeProduct] = useState(null);


  const fetchProducts = useCallback(async () => {
    get('admin/type_products').then((data) => setTypeProducts(data))
  }, [])

  useEffect(() => {
    get('admin/products').then((productsData) => setProducts(productsData))
  }, [])

  useEffect(() => {
    fetchProducts();
  }, [fetchProducts]);

  const handleActionYes = () => {
    del(`admin/type_products/${deletedTypeProduct.id}`).then((res) => {
      setIsOpenConfirm(false);
      setDeletedTypeProduct(null);
      fetchProducts();
    })
  };

  const updateStateAddProduct  = (newType) => {
    setTypeProducts((prevTypeProducts) => [newType, ...prevTypeProducts]);
  }

  const updateStateUpdateProduct  = (updatedType) => {
    setTypeProducts((prevTypeProducts) =>
      prevTypeProducts.map((type) =>
        type.id === updatedType.id ? updatedType : type
      )
    );
  }

  const handleSubmit = ({ res, type }) => {
    type === 'edit' ? updateStateUpdateProduct(res) : updateStateAddProduct(res)
    setIsOpen(false);
  }

  const handleActionNo = () => {
    setIsOpenConfirm(false);
    setDeletedTypeProduct(null);
  };

  const handleEdit = (type) => {
    setEditedTypeProduct(type);
    setIsOpen(true);
  }

  const handleCreate = () => {
    setEditedTypeProduct(null);
    setIsOpen(true);
  }

  const actionOpenConfirm = (type)  => {
    setDeletedTypeProduct(type)
    setIsOpenConfirm(true)
  }

  return (
    <div>
      <Modal
        isOpen={isOpen}
        setIsOpen={setIsOpen}
      >
        <TypeProductForm
          editedTypeProduct={editedTypeProduct}
          products={products}
          onCLose={setIsOpen}
          formSubmit={(dataTypeProduct) => handleSubmit(dataTypeProduct) }
        />
      </Modal>
      <Confirm isOpen={isOpenConfirm} setIsOpen={setIsOpenConfirm} actionNo={handleActionNo} actionYes={handleActionYes} />
      <h1>List of type products</h1>
      <button className="btn btn-link" onClick={handleCreate}>Create new type product</button>
      <div className="row row-cols-2 row-cols-md-auto">
        {typeProducts.map((type) => (
          <div className="col mb-4">
            <div className="card">
              <div className="card-body">
                <h5 className="card-title">{type.name}</h5>
                <button className="btn btn-primary mr-2" onClick={()=> handleEdit(type)}>Edit</button>
                <button className="btn btn-danger"  onClick={()=> actionOpenConfirm(type)}>Delete</button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
};

export default TypeProducts;
