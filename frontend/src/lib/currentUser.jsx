export const SESSION_STORAGE_KEY = 'auth-token';
export const getToken = () => window.localStorage.getItem(SESSION_STORAGE_KEY) || '';
export const log = (token) => window.localStorage.setItem(SESSION_STORAGE_KEY, token);

export const logout = async () => {
  // Devise requires to send request to warden to reset session
  await fetch('/logout', {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json',
      'Accept-Type': 'application/json',
    },
  });

  window.localStorage.setItem(SESSION_STORAGE_KEY, '');
  // { state: { from: window.location.pathname } } need to figure out redirect back
  window.location.href = ''; // hard reload to drop data
};
