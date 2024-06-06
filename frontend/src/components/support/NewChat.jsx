import { useState } from "react";
import Modal from "../../bundles/Modal/Modal";
import { useGenericData } from '../../bundles/GeneralContext';
import { post } from "../../lib/http";
import { navigate } from "@reach/router";
import FormError from "../../bundles/FormError";

const NewChat = ({isOpen, setIsOpen}) => {
  const [errors, setErrors] = useState([])
  const [title, setTitle] = useState('');
  const { currentUser } = useGenericData();

  const handleSubmit = (e) => {
    e.preventDefault();
    const params = {chat: { title, user_id: currentUser.id }}
    post('support/chats', params)
      .then((chat) => navigate(`/support/chats/${chat.id}`))
      .catch((data) => setErrors(data.errors))
  }

  return (
    <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
      <div className="container p-4">
        <h3 className="mb-3">What is your question?</h3>
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <label htmlFor="title" className="form-label">Title</label>
            <input
              type="text"
              id="title"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              className="form-control"
            />
          </div>
          <button type="submit" className="btn btn-primary">Ask</button>
          <FormError errors={errors} />
        </form>
      </div>
    </Modal>
  )
}

export default NewChat;