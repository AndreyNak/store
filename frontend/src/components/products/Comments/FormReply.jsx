import { useEffect, useRef, useState } from "react";
import FormError from "../../../bundles/FormError";
import { patch, post } from "../../../lib/http";

const FormReply = ({
  onSubmit,
  productId,
  currentUser,
  commentReplyId,
  editingComment
}) => {
  const [errors, setErrors] = useState([]);
  const [text, setText] = useState(editingComment?.text || '');

  const replyInputRef = useRef(null);

  useEffect(() => {
    replyInputRef.current?.focus();
  }, []);

  const handleSubmit =  async (e) => {
    e.preventDefault();

    const params = {
      comment: {
        text,
        user_id: currentUser.id,
        parent_id: commentReplyId,
      }
    };

    const isEdit = !!editingComment

    try {
      const data = isEdit
        ? await patch(`products/${productId}/comments/${editingComment.id}`, params)
        : await post(`products/${productId}/comments`, params)

        setText('');
        onSubmit({ data, type: isEdit ? 'edit' : 'create' })
    } catch (data) {
      setErrors(data.errors)
    }
  }

  return (
    <>
      <form onSubmit={handleSubmit} className="mt-2">
        <div className="mb-3">
          <label htmlFor="text" className="form-label">Text:</label>
          <input
            ref={replyInputRef}
            type="text"
            name="text"
            className="form-control"
            value={text}
            onChange={(e) => setText(e.target.value)}
          />
        </div>
        <button type="submit" className="btn btn-primary">Send</button>
        <FormError errors={errors} />
      </form>
    </>
  )
}

export default FormReply;