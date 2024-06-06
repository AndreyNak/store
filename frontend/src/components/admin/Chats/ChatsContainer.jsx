import { Router } from "@reach/router";
import Chat from "./Chat";
import Chats from "./Chats";

const ChatsContainer = () => (
  <Router>
    <Chats path="/" />
    <Chat path=":id" />
  </Router>
)

export default ChatsContainer;