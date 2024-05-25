import Logout from "./Logout";

const Header = ({ currentUser, setCurrentUser }) => (
  <div>
    <div className="d-flex">
      <div className="mx-2">Welcome, {currentUser.name || currentUser.email}</div>
      <div>Role {currentUser.role.name}</div>
    </div>
    <Logout setCurrentUser={setCurrentUser}/>
  </div>
)

export default Header;