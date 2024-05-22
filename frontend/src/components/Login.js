import { useRef } from "react"
const Login = () =>{
  const formRef=useRef()
  const login=async (userInfo) => {
    const url="http://localhost:3000/login"
    try{
        const response=await fetch(url, {
            method: "post",
            headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
            },
            body: JSON.stringify(userInfo)
        })
        const data=await response.json()
        if(!response.ok)
          throw data.error

        localStorage.setItem("token", response.headers.get("Authorization"))
        window.location.href = '/';
    }catch(error){
       console.log("error", error)
    }
}
  const handleSubmit=e=>{
    e.preventDefault()
      const formData=new FormData(formRef.current)
      const data=Object.fromEntries(formData)
      const userInfo={
        "user":{ login: data.login, password: data.password }
      }
      login(userInfo)
      e.target.reset()
  }
  const handleClick=e=>{ e.preventDefault() }
  return(
    <div>
      <form ref={formRef} onSubmit={handleSubmit}>
        Login: <input type="login" name='login' placeholder="login" />
        <br/>
        Password: <input type="password" name='password' placeholder="password" />
        <br/>
        <input type='submit' value="Login" />
      </form>
      <br />
      <div>Not registered yet, <a href="#signup" onClick={handleClick} >Signup</a> </div>
    </div>
  )
}
export default Login
