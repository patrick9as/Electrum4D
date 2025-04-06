import { useState } from "react"
import toast from "react-hot-toast"
import { api } from "../api"

interface LoginProps {
	onAuthenticated: (done: boolean) => void
}
export const Login = ({onAuthenticated}: LoginProps) => {
	const [user, setUser] = useState('')
  const [password, setPassword] = useState('')  

  const handleLogin = () => {
    api.post('/login', { usuario: user, senha: password })
      .then(() => {
					onAuthenticated(true);
          toast.success('Login realizado com sucesso!');
      })
      .catch(
        (res) => {
					onAuthenticated(false);
					toast.error(res.message)
				}
      );
  }

	return (
		<>
			<input type="text" value={user} onChange={(e) => setUser(e.target.value)}/>
      <input type="password" value={password} onChange={(e) => setPassword(e.target.value)}/>
      <button onClick={() => handleLogin()}>Submit</button>
		</>
	)
}