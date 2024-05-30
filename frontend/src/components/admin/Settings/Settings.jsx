import { useState } from 'react';
import './settings.scss';

const Settings = () => {
  const [isCopy, setIsCopy] = useState(false);

  const token = localStorage.getItem("token").replace('Bearer ', '');

  const copyAction = () => {
    navigator.clipboard.writeText(token);
    setIsCopy(true);
  }

  return (
    <div className='container'>
      <h2>Bearer Token:</h2>
      <div onClick={copyAction} className="token">{token}</div>
      {isCopy && <h3>Token copied!</h3>}
    </div>
  )
}

export default Settings;