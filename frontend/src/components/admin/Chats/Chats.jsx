import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom'
import { get } from '../../../lib/http';
import { useTranslation } from 'react-i18next';


const Chats = () => {
  const [chats, setChats] = useState([]);
  const { t } = useTranslation('translation', { keyPrefix: 'admin.chats.chats' });

  useEffect(() => {
    get('admin/chats').then((res) => setChats(res))
  }, [])

  return (
    <div className="ms-3">
      {chats.map((chat) => (
        <div key={chat.id} className="card w-25 mt-3 p-2">
          <div>
            {t('login')}: <span className="ms-3">{chat.user.login}</span>
          </div>
          <div>
            {t('question')}: <span className="ms-3"><Link to={`/admin/chats/${chat.id}`}>{chat.title}</Link></span>
          </div>
        </div>
      )) }
    </div>
  )

}
export default Chats;
