import './index.css'
import { useState } from 'react'
import { Toaster } from 'react-hot-toast'
import { Menu } from './components/menu'
import { Login } from './components/login'

function App() {

  const [authenticated, setAuthenticated] = useState(false)

  return (
    <div className="w-full flex flex-col bg-[#FFFDFA] h-[100vh]">
      {authenticated ? (
        <div>
          <Menu onLogout={() => setAuthenticated(false)}/>
        </div>
      ) : <Login onAuthenticated={setAuthenticated}/>}

      <Toaster />
    </div>
  )
}

export default App
