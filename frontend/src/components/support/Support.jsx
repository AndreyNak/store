import { Link, Router } from "@reach/router";
import { NotFound } from "../../bundles/Errors";
import Chats from "./Chats";
import Chat from "./Chat";

const Support = () => {
  return (
    <div>
      <h1>Support</h1>
      <Link to="products">Home</Link>
      <Router>
        <NotFound default />
        <Chats path="main"/>
        <Chat path="chats/:id" />
      </Router>
    </div>
  )
}

export default Support;
