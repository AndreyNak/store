export const get = async (path, params = {}) => {
  const queryParams = new URLSearchParams(params).toString();
  const url = `http://localhost:3000/api/${path}?${queryParams}`;

  try {
    const response = await fetch(url, {
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': localStorage.getItem("token"),
      }
    });

    if (!response.ok) {
      throw new Error('Network response was not ok');
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Fetch error:', error);
    throw error;
  }
};


export const post = async (path, body) => {
  const url = `http://localhost:3000/api/${path}`;

  const response = await fetch(url, {
    method: "POST",
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': localStorage.getItem("token"),
    },
    body: JSON.stringify(body)
  });

  const responseData = await response.json()

  if (!response.ok) {
    throw  responseData;
  }

  return responseData
};

export const postFile = async (path, FormData) => {
  const url = `http://localhost:3000/api/${path}`;

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
  const url = `http://localhost:3000/api/${path}`;

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




export const patch = async (path, body) => {
  const url = `http://localhost:3000/api/${path}`;

  const response = await fetch(url, {
    method: "PATCH",
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': localStorage.getItem("token"),
    },
    body: JSON.stringify(body)
  });

  const responseData = await response.json()

  if (!response.ok) {
    throw  responseData;
  }

  return responseData
};



export const del = async (path) => {
  const url = `http://localhost:3000/api/${path}`;

  try {
    const response = await fetch(url, {
      method: "DELETE",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': localStorage.getItem("token"),
      }
    });

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Fetch error:', error);
    throw error;
  }
};