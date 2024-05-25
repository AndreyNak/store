import { useEffect, useState } from 'react';
import GenericContext from './bundles/GeneralContext';

import { get } from './lib/http';
import Loading from './bundles/Loading';
import Authorized from './components/Authorized';
import Unauthorized from './components/Unauthorized';

const App = () => {
  const [currentUser, setCurrentUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    get('current_user')
    .then((userData) => setCurrentUser(userData))
    .finally(() => setLoading(false));
  }, []);

  if (loading) return <Loading />

  return (
    <GenericContext.Provider value={{ currentUser, setCurrentUser }}>
      <>
        {currentUser
          ? <Authorized currentUser={currentUser} setCurrentUser={setCurrentUser} />
          : <Unauthorized setCurrentUser={setCurrentUser} />
        }
      </>
    </GenericContext.Provider>
  );
};

export default App;
