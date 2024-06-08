import React from 'react';
import { useTranslation } from 'react-i18next';
import { post } from '../../lib/http';

const Settings = () => {
  const { i18n } = useTranslation();


  const changeLanguage = (locale) => {
    const params = { user: { locale } }

    post('profile/set_locale', params)
      .then(() => {
        localStorage.setItem('locale', locale);
        i18n.changeLanguage(locale);
      })
      .catch((err) => console.log(err))
  };

  return (
    <div>
      <button onClick={() => changeLanguage('en')}>English</button>
      <button onClick={() => changeLanguage('ru')}>Русский</button>
    </div>
  );
};

export default Settings;
