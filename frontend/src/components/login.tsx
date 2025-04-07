import { useState } from "react";
import toast from "react-hot-toast";
import { api } from "../api";
import { Card } from "./card";
import BlackLogo from "../assets/Gsoft_black_logo.png";

interface LoginProps {
  onAuthenticated: (done: boolean) => void;
}
export const Login = ({ onAuthenticated }: LoginProps) => {
  const [user, setUser] = useState("");
  const [password, setPassword] = useState("");

  const handleLogin = () => {
    api
      .post("/login", { usuario: user, senha: password })
      .then(() => {
        onAuthenticated(true);
        toast.success("Login realizado com sucesso!");
      })
      .catch((res) => {
        onAuthenticated(false);
        toast.error(res.message);
      });
  };

  return (
    <>
      <Card>
        <img className="m-4 h-18" src={BlackLogo} alt="" />
        <div className="flex flex-col gap-2">
          <input
            className="rounded-md p-2 border-1 border-black w-md"
            type="text"
            value={user}
            onChange={(e) => setUser(e.target.value)}
          />
          <input
            className="rounded-md p-2 border-1 border-black w-md"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <button className="m-4 w-md" onClick={() => handleLogin()}>
          Entrar
        </button>
      </Card>
    </>
  );
};
