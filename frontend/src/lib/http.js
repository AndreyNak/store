import { navigate } from "@reach/router";

const BASE_URL = 'http://localhost:3000/api';
const BASE_HEADER = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': localStorage.getItem("token"),
}

const handleResponse = async (response) => {
  const responseData = await response.json();

  if (!response.ok) {
    if (response.status === 401) return navigate('/401');
    throw responseData;
  }

  return responseData;
};

const request = async (method, path, body = null, params = {}) => {
  const queryParams = new URLSearchParams(params).toString();
  const url = `${BASE_URL}/${path}${queryParams ? `?${queryParams}` : ''}`;

  const options = {
    method,
    headers: BASE_HEADER,
  };

  if (body) {
    options.body = JSON.stringify(body);
  }

  const response = await fetch(url, options);
  return handleResponse(response);
};

export const postFile = async (path, FormData) => {
  const url = `${BASE_URL}/${path}`;

  const response = await fetch(url, {
    method: "POST",
    headers: {
      'Authorization': localStorage.getItem("token"),
    },
    body: FormData
  });

  const responseData = await response.json()

  if (!response.ok) {
    throw  responseData;
  }

  return responseData
};

export const patchFile = async (path, FormData) => {
  const url = `${BASE_URL}/${path}`;

  const response = await fetch(url, {
    method: "PATCH",
    headers: {
      'Authorization': localStorage.getItem("token"),
    },
    body: FormData
  });

  const responseData = await response.json()

  if (!response.ok) {
    throw  responseData;
  }

  return responseData
};

const auth = async (method, path, body = null) => {
  const url = `http://localhost:3000/${path}`;

  const options = {
    method,
    headers: {
      'content-type': 'application/json',
      'accept': 'application/json'
    },
  };

  if (body) {
    options.body = JSON.stringify(body);
  }

  const response = await fetch(url, options);

  const responseData = await response.json();

  if (!response.ok) {
    throw responseData;
  }

  if (path === 'logout') {
    localStorage.removeItem("token");
  } else {
    localStorage.setItem("token", response.headers.get("Authorization"));
  }
  return responseData;
}

export const patch = (path, body) => request('PATCH', path, body);
export const del = (path) => request('DELETE', path);
export const get = (path, params = {}) => request('GET', path, null, params);
export const post = (path, body) => request('POST', path, body);

export const login = (body) => auth('POST','login', body);
export const signup = (body) => auth('POST', 'signup', body);
export const logout = () => auth('DELETE', 'logout');