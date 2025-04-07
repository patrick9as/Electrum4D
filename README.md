# 🧠 WebServer - Delphi + React Hybrid Framework

Este projeto tem como objetivo modernizar aplicações Delphi legadas através de uma arquitetura híbrida, combinando a robustez do Delphi com interfaces modernas desenvolvidas em React + Vite.

> 💡 Ideal para aplicações que ainda utilizam versões antigas do Delphi e não têm acesso ao `TEdgeBrowser`, aproveitando o poder do [CEF4Delphi](https://github.com/salvadordf/CEF4Delphi).

---

## 🚀 O que esse projeto faz

- **Embute o Chromium (CEF4Delphi)** em aplicações Delphi antigas.
- Cria um **servidor HTTP local com Horse** para servir páginas React/Vite.
- Permite comunicação entre o **frontend web** e a **aplicação Delphi nativa**.
- Oferece uma arquitetura pronta para aplicações **híbridas**: web para UI modernas, e Delphi nativo para funcionalidades sensíveis (como PDV, impressoras, acesso a hardware etc).

---

## 🛠 Tecnologias utilizadas

### 🔙 Backend (Delphi)
- [Horse](https://github.com/HashLoad/horse) – microframework HTTP
- [CEF4Delphi](https://github.com/salvadordf/CEF4Delphi) – Chromium embutido
- `TForm` clássico do Delphi para telas nativas (ex: PDV)

### 🌐 Frontend
- [React](https://reactjs.org/)
- [Vite](https://vitejs.dev/)
- [TypeScript](https://www.typescriptlang.org/)

---

## 🔄 Comunicação Web <-> Delphi

- O frontend roda dentro de um componente CEF.
- As ações do usuário na interface React disparam chamadas HTTP para o backend Delphi.
- O backend, por sua vez, responde com dados ou executa ações locais (ex: abrir um `TForm`).

Exemplo:  
➡️ Usuário clica em “Abrir PDV” →  
➡️ Frontend faz `GET /api/pdv/open` →  
➡️ Backend executa `FormPDV.Show` no Delphi

---

## 🧪 Como rodar

### 1. Frontend (React + Vite)
```bash
cd frontend
npm install
npm run build
```

> O build gerado será colocado em `backend/www/`

### 2. Backend (Delphi)
Abra o projeto no Delphi (qualquer versão compatível com Horse e CEF4Delphi) e execute.

---

## ✨ Futuras melhorias

- Comunicação em tempo real (WebSocket, eventos)
- Empacotamento automatizado do frontend no `.exe`
- Validação de sessão/token
- Logs e observabilidade

---

## 🤝 Contribuições

Ideias, sugestões, issues e PRs são sempre bem-vindos! Se você também está tentando modernizar um legado em Delphi, esse projeto é pra você.

---

Se curtir esse formato, posso adaptar com mais detalhes (prints, GIFs, badges, etc.). Quer que eu gere uma versão `.md` pra você colar direto no repositório?