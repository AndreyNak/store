import { useState } from "react";
import Modal from "../../../bundles/Modal/Modal";
import { patch } from "../../../lib/http";
import FormError from "../../../bundles/FormError";

const DiscountForm = ({ discountedProduct, isOpen, setIsOpen, submit}) => {
  const [discount, setDiscount] = useState(discountedProduct?.discountPrice);
  const [errors, setErrors] = useState([]);

  if (!discountedProduct) return null;

  const handleSubmit = (e) => {
    e.preventDefault();

    const params = { product: { discount_price: discount } }
    patch(`admin/products/${discountedProduct.id}/make_discount`, params)
      .then((product) => submit(product))
      .catch((errors) => setErrors(errors))
  }

  return (
    <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
      <div className="container mt-4">
        <button onClick={() => setIsOpen(false)}>Close</button>
        <div className="text-center">
          <h1 className="mb-4">Make discount for {discountedProduct.name}</h1>
          <div className="d-flex justify-content-center">
            <form onSubmit={handleSubmit} >
              <div>Current price: {discountedProduct.price}</div>
              <div>
                <label htmlFor="">Discount price</label>
                <input type="text" className="mx-2" value={discount} onChange={(e) => setDiscount(e.target.value) }/>
                <button className="btn btn-primary" type="submit">Submit</button>
              </div>
              <FormError errors={errors}/>
            </form>
          </div>
        </div>
      </div>
    </Modal>
  )
}

export default DiscountForm;