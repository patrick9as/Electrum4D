import toast from 'react-hot-toast';
import { api } from '../api';
import Logo from '../assets/Gsoft.svg'

interface MenuProps {
  onLogout: () => void
}

const openPDV = () => {
  api.get('/pdv/open')
    .then(() => {
      toast.success('Abrindo PDV');
    }
    )
    .catch(() => {
      toast.error('Erro ao abrir PDV');
    });
}

export const Menu = ({onLogout}: MenuProps) => {
  return (
    <>
      <div className="bg-[#16140C] w-full flex gap-1">
        <div className="p-4 pt-5 pb-3"><img src={Logo} className="w-[65px]"></img></div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-white text-black p-2 px-4 rounded-t-[12px]">Geral</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px]">Cadastro</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px]">Financeiro</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px]" onClick={() => openPDV()}>Vendas</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px]">Estoque</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px]">Relatórios</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px]">Utilitários</div>
        <div className="flex mt-4 flex-row w-fit font-semibold bg-none text-white p-2 px-4 rounded-t-[12px]" onClick={onLogout}>Logout</div>
      </div>
    </>
  );
};
