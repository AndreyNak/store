import { useState } from "react";
import Modal from "../../../bundles/Modal/Modal";
import { patch } from "../../../lib/http";
import FormError from "../../../bundles/FormError";

const DiscountForm = ({ discountedProduct, isOpen, setIsOpen, submit}) => {
  const [discount, setDiscount] = useState(discountedProduct.discountPrice || '');
  const [errors, setErrors] = useState([]);

  const handleSubmit = (e) => {
    e.preventDefault();

    const params = { product: { discount_price: discount } }
    patch(`admin/products/${discountedProduct.id}/make_discount`, params)
      .then((product) => submit(product))
      .catch((data) => setErrors(data.errors))
  }

  const handleCancelDiscount = () => {
    const params = { product: { discount_price: null } }
    patch(`admin/products/${discountedProduct.id}/make_discount`, params)
      .then((product) => submit(product))
  }

  return (
    <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
      <div className="container mt-4">
        <button onClick={() => setIsOpen(false)}>Close</button>
        <div className="text-center">
          <h1 className="mb-4">Make discount for {discountedProduct.name}</h1>
          <div className="d-flex justify-content-center">
            <form onSubmit={handleSubmit} className="d-flex flex-column align-items-center">
              <div>Current price: {discountedProduct.price}</div>
              <div className="d-flex gap-2">
                <label>Discount price</label>
                <input type="text" className="mx-2" value={discount} onChange={(e) => setDiscount(e.target.value)}/>
                <button className="btn btn-primary" type="submit">Submit</button>
              </div>
              <FormError errors={errors}/>
              {discountedProduct.discountPrice && (
                <button className="btn btn-danger mt-3" onClick={handleCancelDiscount}>Cancel discount</button>
              )}
            </form>
          </div>
        </div>
      </div>
    </Modal>
  )
}

export default DiscountForm;