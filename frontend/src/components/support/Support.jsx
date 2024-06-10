import { Link, Router } from "@reach/router";
import { NotFound } from "../../bundles/Errors";
import Chats from "./Chats";
import Chat from "./Chat";

const Support = () => (
  <div>
    <h1>Support</h1>
    <Link to="/products">Main</Link>
    <Router>
      <NotFound default />
      <Chats path="main"/>
      <Chat path="chats/:id" />
    </Router>
  </div>
)

export default Support;
