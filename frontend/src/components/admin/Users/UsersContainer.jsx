import { Routes, Route } from "react-router-dom";
import { NotFound } from "../../../bundles/Errors";
import User from "./User";
import Users from "./Users";

const UsersContainer = () => (
  <Routes>
    <Route path="*" element={<NotFound/>} />
    <Route path="/" element={<Users/>} />
    <Route path=":id" element={<User/>} />
  </Routes>
)

export default UsersContainer;