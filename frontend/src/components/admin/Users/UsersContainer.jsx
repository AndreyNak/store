import { Router } from "@reach/router";
import { NotFound } from "../../../bundles/Errors";
import User from "./User";
import Users from "./Users";

const UsersContainer = () => (
  <Router>
    <NotFound default />
    <Users path="/" />
    <User path=":id" />
  </Router>
)

export default UsersContainer;