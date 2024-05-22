import React from 'react';
import { useGenericData } from '../bundles/GeneralContext';

const Home = () => {
  const { currUser } = useGenericData();

  return (
    <div>
      Hello {currUser.email}
    </div>
  )
}
export default Home
