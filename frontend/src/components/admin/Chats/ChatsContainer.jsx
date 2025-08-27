import { Routes, Route } from "react-router-dom";
import Chat from "./Chat";
import Chats from "./Chats";

const ChatsContainer = () => (
  <Routes>
    <Route path="/" element={<Chats/>} />
    <Route path=":id" element={<Chat/>} />
  </Routes>
)

export default ChatsContainer;