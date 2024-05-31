import { useState } from 'react';
import Modal from '../../bundles/Modal/Modal'
import Comments from './Comments/Comments';

const Product = ({ product, isOpen, setIsOpen, currentUser, actions }) => {
  const [isOpenComments, setIsOpenComments] = useState(false);
  const handleOpenComments = () => {
    setIsOpenComments(!isOpenComments);
  }

  return (
    <Modal
        isOpen={isOpen}
        setIsOpen={setIsOpen}
      >
      {product && (
        <div className="container mt-4">
        <button className="btn btn-primary mb-3" onClick={() => setIsOpen(false)}>Close</button>
        <div className="card align-items-center">
          <img className="card-img-top show-product-img" src={product.urlImage} alt={product.name} />
          <div className="card-body show-cart">
            <div className="d-flex justify-content-between align-items-center mb-3">
              <h5 className="card-title">{product.name}</h5>
            </div>
            <p className='text-muted'>Quantity: {product.quantity}</p>
            <div className="card-text text-muted mb-2">{product.description}</div>
            {product.discountPrice ? (
              <div className="d-flex align-items-center gap-2 mb-3">
                <p className="text-decoration-line-through text-secondary mb-0">{product.price}₽</p>
                <p className="fw-bold text-success mb-0">{product.discountPrice}₽</p>
              </div>
            ) : (
              <p className="mb-3">{product.price}₽</p>
            )}
            {currentUser && (
              <div className="d-flex flex-column gap-3">
                {product.countOrderedProduct && (
                  <div className="d-flex align-items-center gap-2">
                    <span>Amount in cart:</span>
                    <button onClick={() => actions.handleDecrementQuantity(product)} className="btn btn-outline-primary btn-sm">-</button>
                    <span>{product.countOrderedProduct}</span>
                    <button disabled={product.quantity <= 0} onClick={() => actions.handleIncrementQuantity(product)} className="btn btn-outline-primary btn-sm">+</button>
                  </div>
                )}
                {(!product.countOrderedProduct && product.quantity > 0) && (
                  <button onClick={() => actions.handleAddProductToCart(product)} className="btn btn-primary">Add to cart</button>
                )}
                {product.isFavoriteProduct ? (
                  <button onClick={() => actions.handleToggleFavorite(product)} className="btn btn-danger">Remove from favorites</button>
                ) : (
                  <button onClick={() => actions.handleToggleFavorite(product)} className="btn btn-info">Add to favorites</button>
                )}
              </div>
            )}
          </div>
            <button className='btn btn-link' onClick={handleOpenComments}>{isOpenComments ? 'Close' : 'Open' } Comments</button>
          {isOpenComments && <Comments currentUser={currentUser} productId={product.id} />}
        </div>
      </div>
      )}
    </Modal>
  )
}

export default Product;