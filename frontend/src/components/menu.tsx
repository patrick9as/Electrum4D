import toast from 'react-hot-toast';
import { api } from '../api';
import Logo from '../assets/Gsoft.svg'

interface MenuProps {
  onLogout: () => void
}

const openPDV = () => {
  api.get('/pdv/open');
  toast.success('PDV aberto com sucesso!');
}

export const Menu = ({onLogout}: MenuProps) => {
  return (
    <>
      <div className="bg-[#16140C] w-full flex gap-1">
        <div className="p-4 pt-5 pb-3 cursor-pointer"><img src={Logo} className="w-[65px]"></img></div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-white text-black p-2 px-4 rounded-t-[12px] cursor-pointer">Geral</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px] cursor-pointer">Cadastro</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px] cursor-pointer">Financeiro</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px] cursor-pointer" onClick={() => openPDV()}>Vendas</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px] cursor-pointer">Estoque</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px] cursor-pointer">Relatórios</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px] cursor-pointer">Utilitários</div>
        <div className="ml-auto flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px] cursor-pointer" onClick={onLogout}>Logout</div>
      </div>
    </>
  );
};
