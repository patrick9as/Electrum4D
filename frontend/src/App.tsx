import { useState } from 'react'
import './App.css'
import axios from 'axios'
import toast, { Toaster } from 'react-hot-toast'

const api = axios.create({
  baseURL: 'http://localhost:9000',
  headers: {
    'Content-Type': 'application/json',
  },
  timeout: 10000,
})

function App() {
  const [user, setUser] = useState('')
  const [password, setPassword] = useState('')

  const handleLogin = () => {
    api.post('/login', { usuario: user, senha: password })
      .then(() => {
        console.log('oi')
          toast.success('Login realizado com sucesso!');
      })
      .catch(
        () => toast.error('Email ou senha errado')
      );
  }

  return (
    <>
      <input type="text" value={user} onChange={(e) => setUser(e.target.value)}/>
      <input type="password" value={password} onChange={(e) => setPassword(e.target.value)}/>
      <button onClick={() => handleLogin()}>Submit</button>

      <Toaster />
    </>
  )
}

export default App
