import React, { useEffect, useState } from 'react';
import { get, post } from '../../../lib/http';
import { useGenericData } from '../../../bundles/GeneralContext';
import './messages.scss'


const Chat = ({ id }) => {
  const { currUser: currentUser } = useGenericData();

  const [sending, setSending] = useState(false);
  const [errors, setErrors] = useState([]);
  const [formState, setFormState] = useState({
    text: '',
    user_id: currentUser.id
  });
  const [chat, setChat] = useState([]);

  useEffect(() => {
    get(`admin/chats/${id}`).then((res) => setChat(res))
  }, [id])

  const handleChange = (e) => {
    setFormState({ ...formState, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    setSending(true);
    e.preventDefault();
    const body  ={ message: formState}

    try {
      post(`admin/chats/${chat.id}/send_message`, body).then((message) => {
        setChat(prevChat => ({
          ...prevChat,
          messages: [message, ...prevChat.messages]
        }));
        setFormState({...formState, text: '' })
        setSending(false);
      })
    } catch (err) {
      setErrors(err.errors);
    }
  };

  return (
    <div className="d-flex justify-content-center">
      <div className="outer_section">
        <div className="inner_section">
          <div className="send_form">
            <form className='d-flex gap-3' onSubmit={handleSubmit}>
              <div className="field mb-3">
                <label htmlFor="text" className="form-label">{chat.title}</label>
                <div className='d-flex gap-3'>
                  <input
                    type="text"
                    name="text"
                    id="text"
                    className="form-control"
                    value={formState.text}
                    onChange={handleChange}
                    required
                  />
                  <button disabled={sending} type="submit" className="btn btn-primary">Submit</button>
                </div>
              </div>
              {errors.length > 0 && (
                <div className="mt-3">
                  <p>{`${errors.length} error(s) prohibited this product from being saved:`}</p>
                  <ul>
                    {errors.map((message, index) => (
                      <li key={index} className="text-danger">{message}</li>
                    ))}
                  </ul>
                </div>
              )}
            </form>
          </div>
          <div id="messages" className="messages d-flex flex-column-reverse">
            new messages
          </div>
          <div className="messages">
            {chat.messages && chat.messages.map((message) => (
              <div key={message.id} className={`message  ${message.user.id === currentUser.id && 'currentUser'}`}>
                <div>
                  <div className="login">
                    {message.user.isAdmin ? `${message.user.name} (Admin)` : message.user.login }
                  </div>
                  <div className="text">
                    {message.text}
                  </div>
                  </div>
              </div>
            ))}
          </div>
        </div>
        <div className="mt-3">
          paginate
        </div>
      </div>
    </div>
  )

}
export default Chat;
