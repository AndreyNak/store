import { useState } from "react";
import FormError from "../../../bundles/FormError";
import { patch, post } from "../../../lib/http";

const FormComment = ({
  onSubmit,
  editingComment,
  productId,
  currentUser
} ) => {
  const [errors, setErrors] = useState([]);
  const [text, setText] = useState(editingComment?.text);
  const [selectedRating, setSelectedRating] = useState(editingComment?.rating);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const params = {
      comment: {
        text,
        user_id: currentUser.id,
        rating: selectedRating
      }
    };

    const isEdit = !!editingComment

    try {
      const data = isEdit
        ? await patch(`products/${productId}/comments/${editingComment.id}`, params)
        : await post(`products/${productId}/comments`, params)

        setText('');
        setSelectedRating(null);

        onSubmit({ data, type: isEdit ? 'edit' : 'create' })
    } catch (data) {
      setErrors(data.errors)
    }
  }

  return (
    <>
      <form onSubmit={handleSubmit} className="mb-4">
        <div className="mb-3">
          <label htmlFor="text" className="form-label">Text:</label>
          <input
            type="text"
            name="text"
            className="form-control"
            value={text}
            onChange={(e) => setText(e.target.value)}
          />
        </div>
        <div className="mb-3">
          <label className="form-label me-2">Rating:</label>
          {[1, 2, 3, 4, 5].map((rating) => (
            <div className="form-check form-check-inline" key={rating}>
              <input
                className="form-check-input"
                type="radio"
                name="rating"
                id={`rating_${rating}`}
                value={rating}
                checked={selectedRating === rating}
                onChange={() => setSelectedRating(rating)}
              />
              <label className="form-check-label" htmlFor={`rating_${rating}`}>{rating}</label>
            </div>
          ))}
        </div>
        <button type="submit" className="btn btn-primary">Send</button>
      </form>
      <FormError errors={errors} />
    </>
  )
}

export default FormComment;