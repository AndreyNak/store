import { useState } from "react";
import Modal from "../../../bundles/Modal/Modal";
import { patch } from "../../../lib/http";
import FormError from "../../../bundles/FormError";

const DiscountForm = ({ discountedProduct, isOpen, setIsOpen, submit}) => {
  const [discountStartDate, setDiscountStartDate] = useState(discountedProduct.discountStartDate || '');
  const [discountEndDate, setDiscountEndDate] = useState(discountedProduct.discountEndDate  || '');
  const [discount, setDiscount] = useState(discountedProduct.discountPrice || '');
  const [errors, setErrors] = useState([]);

  const handleSubmit = (e) => {
    e.preventDefault();

    const params = {
      product: {
        discount_price: discount,
        discount_start_date: discountStartDate,
        discount_end_date: discountEndDate
      }
    }
    patch(`admin/products/${discountedProduct.id}/make_discount`, params)
      .then((product) => submit(product))
      .catch((data) => setErrors(data.errors))
  }

  const handleCancelDiscount = () => {
    const params = {
      product: {
        discount_price: null,
        discount_start_date: null,
        discount_end_date: null
      }
    }
    patch(`admin/products/${discountedProduct.id}/make_discount`, params)
      .then((product) => submit(product))
  }

  return (
    <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
      <div className="container mt-4">
        <button className="btn btn-secondary mb-3" onClick={() => setIsOpen(false)}>Close</button>
        <div className="text-center">
          <h1 className="mb-4">Make discount for {discountedProduct.name}</h1>
          <div className="d-flex justify-content-center">
            <form onSubmit={handleSubmit} className="w-50">
              <div className="mb-3">
                <div>Current price: {discountedProduct.price}</div>
              </div>
              <div className="mb-3">
                <label htmlFor="discountPrice" className="form-label">Discount price</label>
                <input
                  type="text"
                  id="discountPrice"
                  className="form-control"
                  value={discount}
                  onChange={(e) => setDiscount(e.target.value)}
                />
              </div>
              <div className="mb-3">
                <label htmlFor="startDate" className="form-label">Start date</label>
                <input
                  type="date"
                  id="startDate"
                  className="form-control"
                  value={discountStartDate}
                  onChange={(e) => setDiscountStartDate(e.target.value)}
                />
              </div>
              <div className="mb-3">
                <label htmlFor="endDate" className="form-label">End date</label>
                <input
                  type="date"
                  id="endDate"
                  className="form-control"
                  value={discountEndDate}
                  onChange={(e) => setDiscountEndDate(e.target.value)}
                />
              </div>
              <div className="d-flex justify-content-between">
                <button className="btn btn-primary" type="submit">Submit</button>
                {discountedProduct.discountPrice && (
                  <button className="btn btn-danger" onClick={handleCancelDiscount}>Cancel discount</button>
                )}
              </div>
              {errors && <FormError errors={errors} />}
            </form>
          </div>
        </div>
      </div>
    </Modal>
  )
}

export default DiscountForm;