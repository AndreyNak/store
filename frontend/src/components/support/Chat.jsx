import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import './messages.scss'
import { get, post } from '../../lib/http';
import consumer from '../../lib/channels/consumer';
import { useGenericData } from '../../bundles/GeneralContext';
import FormError from '../../bundles/FormError';
import InfiniteScroll from 'react-infinite-scroll-component';
import Loading from '../../bundles/Loading';
import { hasPermission } from '../../lib/permissions';


const Chat = () => {
  const { id } = useParams();
  const { currentUser } = useGenericData();

  const [sending, setSending] = useState(false);
  const [loading, setLoading] = useState(true);

  const [errors, setErrors] = useState([]);
  const [page, setPage ] = useState(1);
  const [hasMore, setHasMore] = useState(true);

  const [formState, setFormState] = useState({
    text: '',
    user_id: currentUser.id
  });
  const [chat, setChat] = useState([]);

  useEffect(() => {
    const params = {page: 1}
    get(`support/chats/${id}`, params)
    .then((res) => setChat({ ...res.chat, messages: res.messages}))
    .catch((error) => console.error('Error fetching chat data:', error))
    .finally(() => setLoading(false));
  }, [id]);

  useEffect(() => {
    if (!chat.id) return;

    const subscription = consumer.subscriptions.create(
      { channel: "ChatChannel", id: chat.id },
      {
        connected: () => console.log('con'),
        disconnected: () => console.log("WebSocket disconnected"),
        received: (data) => {
          setChat(prevChat => ({
            ...prevChat,
            messages: [data, ...prevChat.messages]
          }));
        }
      }
    );

    return () => subscription.unsubscribe();
  }, [chat.id]);

  const handleChange = (e) => {
    setFormState({ ...formState, [e.target.name]: e.target.value });
  };

  const fetchMoreMessages = async () => {
    const currentPage = page + 1;
    setPage(currentPage);
    const params = { page: currentPage }
    get(`support/chats/${id}`, params).then((data) => {
      setChat((prevChat) => ({
        ...prevChat,
        messages: [...prevChat.messages, ...data.messages ]
      }));

      if (data.messages.length === 0) setHasMore(false);
    }).catch((error) => console.error('Error fetching more messages:', error));
  };


  const handleSubmit = (e) => {
    setSending(true);
    e.preventDefault();

    const body  ={ message: formState}
    post(`support/chats/${chat.id}/send_message`, body).then(() => {
      setFormState({...formState, text: '' })
      setSending(false);
    }).catch((err) => setErrors(err.errors))
  };

  return (
    <div className="d-flex justify-content-center">
      <div className="outer_section">
        <div className="inner_section">
          <div className="send_form">
            <form onSubmit={handleSubmit}>
              <div className="field mb-3">
                <label htmlFor="text" className="form-label">{chat.title}</label>
                <div className="d-flex gap-3">
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
              <FormError errors={errors} />
            </form>
          </div>
          {loading ? <Loading /> : chat.messages ? (
            <InfiniteScroll
              dataLength={chat.messages.length}
              next={fetchMoreMessages}
              hasMore={hasMore}
              endMessage={<p>No more messages</p>}
            >
              <div className="messages">
                {chat.messages.map((message) => (
                  <div
                    key={message.id}
                    className={`message ${message.user.id === currentUser.id ? 'current_user' : 'other_user'}`}
                  >
                    <div>
                      <div className="login">
                        {hasPermission(message.user, 'can_view_admin') ? `${message.user.name} (Admin)` : message.user.login}
                      </div>
                      <div className="text">
                        {message.text}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </InfiniteScroll>
          ) : <div>Write your first message here</div>}
        </div>
      </div>
    </div>
  )
}
export default Chat;
