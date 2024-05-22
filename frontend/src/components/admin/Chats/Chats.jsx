import React, { useEffect, useState } from 'react';
import { Link } from '@reach/router'
import { get } from '../../../lib/http';


const Chats = () => {
  const [chats, setChats] = useState([]);

  useEffect(() => {
    get('admin/chats').then((res) => setChats(res))
  }, [])

  return (
    <div className="ms-3">
      {chats.map((chat) => (
        <div key={chat.id} className="card w-25 mt-3 p-2">
          <div>
            login: <span className="ms-3">{chat.user.login}</span>
          </div>
          <div>
            question: <span className="ms-3"><Link to={`/admin/chats/${chat.id}`}>{chat.title}</Link></span>
          </div>
        </div>
      )) }
    </div>
  )

}
export default Chats;
