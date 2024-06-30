import { useEffect, useState } from 'react';
import GenericContext from './bundles/GeneralContext';
import { Toaster } from 'react-hot-toast';
import { get } from './lib/http';
import Loading from './bundles/Loading';
import Authorized from './components/Authorized';
import Unauthorized from './components/Unauthorized';
import { useTranslation } from 'react-i18next';

const App = () => {
  const [currentUser, setCurrentUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const { i18n } = useTranslation();

  useEffect(() => {
    get('current_user')
    .then((userData) => {
      setCurrentUser(userData);
      i18n.changeLanguage(userData?.locale || 'en');
    })
    .finally(() => setLoading(false));
  }, [i18n]);

  if (loading) return <Loading />

  return (
    <GenericContext.Provider value={{ currentUser, setCurrentUser }}>
      <>
        <Toaster position="top-center" reverseOrder={false} />
        {currentUser
          ? <Authorized currentUser={currentUser} setCurrentUser={setCurrentUser} />
          : <Unauthorized setCurrentUser={setCurrentUser} />
        }
      </>
    </GenericContext.Provider>
  );
};

export default App;
