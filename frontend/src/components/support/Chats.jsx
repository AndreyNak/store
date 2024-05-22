import { useState } from "react";
import { useEffect } from "react";
import { Link } from "@reach/router";
import { get } from "../../lib/http";

const Chats = () => {
  const [chats, setChat] = useState([]);
  useEffect(() => {
    get('support/main').then((data) => setChat(data));
  }, [])

  return (
    <div>
      <button>ask question</button>
      <p>My questions:</p>
      <div class="ms-3">
        {chats.map((chat) => (
          <div class="card w-25 mt-3 p-2">
            <div>
              question: <span class="ms-3"><Link to={`/support/chats/${chat.id}`}>{chat.title}</Link></span>
            </div>
          </div>
        ))}
      </div>
    </div>
  )

}

export default Chats;
