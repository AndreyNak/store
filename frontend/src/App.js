import { useEffect, useState } from 'react';
import { Link, Redirect, Router } from '@reach/router';
import './App.css';
import Signup from './components/Signup';
import Login from './components/Login';
import Logout from './components/Logout';
import { NotFound, Unauthorized } from './bundles/Errors';
import Home from './components/Home';
import Products from './components/products/Products';
import Cart from './components/cart/Cart';
import Profile from './components/profile/Profile';
import AdminDashboard from './components/admin/AdminDashboard';
import GenericContext from './bundles/GeneralContext';
import Support from './components/support/Support';

const App = () => {
  const [currUser, setCurrUser] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchGenericData = async () => {
    const url="http://localhost:3000/api/current_user"
    try{
        const response=await fetch(url, {
            method: "get",
            headers: {
                'content-type': 'application/json',
                'accept': 'application/json',
                'authorization': localStorage.getItem("token")
            }
        })
        if (response.ok) {
          const user_data = await response.json();
          setCurrUser(user_data);
        }
    }catch(error){
       console.log("error", error)
    }
  };

  useEffect(() => {
    fetchGenericData().finally(() => setLoading(false));
  }, []);

  if (loading) return (
    <div>
      <h1>Loading!</h1>
    </div>
  );

  return (
    <GenericContext.Provider value={{ currUser, setCurrUser }}>
      <div className="App">
        <div className="d-flex flex-row">
          <div className="jumbotron">
            {currUser ? (
              <>
                <div className="d-flex">
                  <div className="mx-2">Welcome, {currUser.name || currUser.email}</div>
                  <div>Role {currUser.role.name}</div>
                </div>
                <Logout setCurrUser={setCurrUser}/>
              </>
            ) : (
              <>
                <Link to="/signup">Sign Up</Link>
                <Link to="/login">Login</Link>

                <Router>
                  <NotFound default />
                  <Signup path="/signup" setCurrUser={setCurrUser} />
                  <Login path="/login" />
                </Router>
              </>
            )}
          </div>
        </div>
        {currUser && (
          <div>
            <Router>
              <NotFound default />
              <Unauthorized path='401' />
              <Redirect from="/" to="/products" noThrow />
              <Cart path='cart'/>
              <Profile path='profile/*' />
              <Products path="products" />
              <Support path="support/*" />
              {currUser.role.name === 'admin' && (
                <AdminDashboard path='admin/*' />
              )}
            </Router>
          </div>
        )}
      </div>

    </GenericContext.Provider>

  );
}

export default App;
