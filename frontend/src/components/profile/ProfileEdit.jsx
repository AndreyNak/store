import React, { useState } from 'react';
import { patch } from '../../lib/http';
import { Link, Router } from '@reach/router';
import FormError from '../../bundles/FormError';
import FormSuccess from '../../bundles/FormSuccess';
import Orders from './Orders';
import { useGenericData } from '../../bundles/GeneralContext';

const ProfileEdit = () => {
  const { currentUser  } = useGenericData();
  const [errors, setErrors] = useState([]);

  const [formState, setFormState] = useState({
    name: currentUser.name || '',
    surname: currentUser.surname || '',
    date_of_birth: currentUser.date_of_birth || '',
    login: currentUser.login || '',
    address: currentUser.address || '',
  });

  const handleSubmit = async (e) => {
    e.preventDefault();

    const body = { user: formState }
    patch('profile', body)
    .catch((err) => {
      setErrors(err.errors)
    });
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormState({
      ...formState,
      [name]: value,
    });
  };

  return (
    <div>
      <h1>Edit Profile</h1>
      <Link to="/profile/orders">View Orders</Link>
      <form onSubmit={handleSubmit} className="container mt-4">
        <div className="mb-3">
          <label htmlFor="name" className="form-label">Name</label>
          <input
            type="text"
            name="name"
            className="form-control"
            value={formState.name}
            onChange={handleChange}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="surname" className="form-label">Surname</label>
          <input
            type="text"
            name="surname"
            className="form-control"
            value={formState.surname}
            onChange={handleChange}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="date_of_birth" className="form-label">Date of Birth</label>
          <input
            type="date"
            name="date_of_birth"
            className="form-control"
            value={formState.date_of_birth}
            onChange={handleChange}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="login" className="form-label">Login</label>
          <input
            type="text"
            name="login"
            className="form-control"
            value={formState.login}
            onChange={handleChange}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="address" className="form-label">Address</label>
          <input
            type="text"
            name="address"
            className="form-control"
            value={formState.address}
            onChange={handleChange}
          />
        </div>
        <button type="submit" className="btn btn-primary">Update Profile</button>

        <FormError errors={errors} />
      </form>
      <Router>
        <Orders path='orders'/>
      </Router>
    </div>

  )
}
export default ProfileEdit;
