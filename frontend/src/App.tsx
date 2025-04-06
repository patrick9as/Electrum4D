import { useState } from 'react'
import './App.css'
import axios from 'axios'
import toast, { Toaster } from 'react-hot-toast'

const api = axios.create({
  baseURL: 'http://localhost:9000/api',
  headers: {
    'Content-Type': 'application/json',
  },
  timeout: 10000,
})

function App() {
  const [user, setUser] = useState('')
  const [password, setPassword] = useState('')
  const [authenticated, setAuthenticated] = useState(false)
  

  const handleLogin = () => {
    api.post('/login', { usuario: user, senha: password })
      .then(() => {
        console.log('oi')
          toast.success('Login realizado com sucesso!');
          setAuthenticated(true)
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
      {authenticated && (
        <div>
          <p>Logado</p>
          <button onClick={() => setAuthenticated(false)}>Logout</button>

          <button
            onClick={() => {
              api.get('/pdv/open')
                .then(() => {
                  toast.success('Abrindo PDV');
                }
                )
            }}
          >
            Abrir PDV
          </button>

        </div>
          )}

      <Toaster />
    </>
  )
}

export default App
