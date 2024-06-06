import { useState } from "react";
import { useEffect } from "react";
import { Link } from "@reach/router";
import { get } from "../../lib/http";
import NewChat from "./NewChat";

const Chats = () => {
  const [chats, setChats] = useState([]);
  const [loading, setLoading] = useState(true);
  const [isOpen, setIsOpen] = useState(false);
  useEffect(() => {
    get('support/main').then((data) => setChats(data));
  }, [])


  const handleOpenCreateChat = () => {
    setIsOpen(true);
  }

  return (
    <div>
      <button className="btn btn-primary" onClick={handleOpenCreateChat}>ask question</button>
      <p>My questions:</p>
      {isOpen && <NewChat isOpen={isOpen} setIsOpen={setIsOpen} />}
      
      <div className="ms-3">
        {chats.map((chat) => (
          <div key={chat.id} className="card w-25 mt-3 p-2">
            <div>
              question: <span className="ms-3"><Link to={`/support/chats/${chat.id}`}>{chat.title}</Link></span>
            </div>
          </div>
        ))}
      </div>
    </div>
  )

}

export default Chats;
