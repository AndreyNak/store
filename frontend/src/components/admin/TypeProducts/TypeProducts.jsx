import { useCallback, useEffect, useState } from "react";
import { get, del } from "../../../lib/http";
import Confirm from "../../../bundles/Confirm";
import TypeProductForm from './TypeProductForm';
import { hasPermission } from "../../../lib/permissions";
import { useGenericData } from "../../../bundles/GeneralContext";
import { useTranslation } from "react-i18next";

const TypeProducts = () => {
  const [typeProducts, setTypeProducts] = useState([]);
  const [products, setProducts] = useState([]);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [isOpen, setIsOpen] = useState(false);
  const [deletedTypeProduct, setDeletedTypeProduct] = useState(null);
  const [editedTypeProduct, setEditedTypeProduct] = useState(null);

  const { t } = useTranslation('translation', { keyPrefix: 'admin.type_products.type_products' });
  const { t: tg } = useTranslation('translation');


  const { currentUser } = useGenericData();


  const fetchProducts = useCallback(async () => {
    get('admin/type_products').then(({type_products, products}) => {
      setTypeProducts(type_products);
      setProducts(products)
    }).catch((err) => console.log(err))
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
      {isOpen && <TypeProductForm
        isOpen={isOpen}
        setIsOpen={setIsOpen  }
        editedTypeProduct={editedTypeProduct}
        products={products}
        onCLose={setIsOpen}
        formSubmit={(dataTypeProduct) => handleSubmit(dataTypeProduct) }
      />}
      <Confirm isOpen={isOpenConfirm} setIsOpen={setIsOpenConfirm} actionNo={handleActionNo} actionYes={handleActionYes} />
      <h1>{t('list')}</h1>
      {hasPermission(currentUser, 'can_create_admin_type_product') && (
        <button className="btn btn-link" onClick={handleCreate}>{t('create')}</button>
      )}
      <div className="row row-cols-2 row-cols-md-auto">
        {typeProducts.map((type) => (
          <div key={type.id} className="col mb-4">
            <div className="card">
              <div className="card-body">
                <h5 className="card-title">{type.tname}</h5>
                {hasPermission(currentUser, 'can_edit_admin_type_product') && (
                  <button className="btn btn-primary mr-2" onClick={()=> handleEdit(type)}>{tg('edit')}</button>
                )}
                {hasPermission(currentUser, 'can_delete_admin_type_product') && (
                  <button className="btn btn-danger"  onClick={()=> actionOpenConfirm(type)}>{tg('delete')}</button>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
};

export default TypeProducts;
