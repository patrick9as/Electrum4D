# API_ATENDIMENTO

Este projeto é uma API desenvolvida em Delphi utilizando o framework **Horse** para atender requisições HTTP. A API realiza operações relacionadas a **perguntas e respostas** utilizando um banco de dados SQL Server, acessado através da biblioteca **UniDAC**.

## Funcionalidades

- **Cadastro de Perguntas e Respostas**: A API permite a criação, edição e listagem de perguntas e suas respectivas respostas.
- **Migrações de Banco de Dados**: O projeto possui migrações SQL para criar e alterar tabelas necessárias no banco de dados.
- **Servidor HTTP com Horse**: A API é executada através do framework Horse, que facilita a manipulação de requisições HTTP.

## Requisitos

- **Delphi** (suporte para RAD Studio com **UniDAC**)
- **SQL Server** (ou outro banco de dados compatível com as migrações)
- **Bibliotecas**:
  - [Horse Framework](https://github.com/HashLoad/horse) (para requisições HTTP)
  - [UniDAC](https://www.devart.com/unidac/) (para conexão com banco de dados)

## Configuração do Ambiente

### 1. Banco de Dados

Antes de iniciar o projeto, configure seu banco de dados SQL Server e execute as migrações:

1. Crie um banco de dados no SQL Server.
2. Execute os arquivos de migração localizados na pasta `migrations/` para criar as tabelas necessárias.

Exemplo de criação de tabelas no SQL Server (migração SQL):

```sql
CREATE TABLE GCOM.dbo.NPS_Respostas (
  ID UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID()),
  ID_Pergunta UNIQUEIDENTIFIER NOT NULL,
  Valor INT NULL,
  CONSTRAINT PK_NPS_Respostas_ID PRIMARY KEY CLUSTERED (ID)
);
```
2. Configuração do Projeto Delphi
No Delphi, abra o projeto API_Atendimento.dproj e configure o TUniConnection no módulo database:

Configure as credenciais do banco de dados SQL Server no TUniConnection (host, usuário, senha, nome do banco de dados).
Certifique-se de que o UniDAC está instalado e configurado no Delphi.
3. Instalação do Horse Framework
Você pode instalar o Horse Framework para facilitar o desenvolvimento de APIs REST em Delphi. Utilize o gerenciador de pacotes Boss para instalar o Horse:

```boss install horse```

4. Executando o Servidor
Com tudo configurado, você pode iniciar o servidor HTTP.
O projeto possui uma tela gráfica mínima para rodar e parar o servidor. Execute o projeto no Delphi ou, caso prefira, configure a execução no ambiente de produção:

Iniciar o servidor:
- Use a tela disponível no projeto para inicializar o servidor.

Acessar a API:
- A API estará disponível no endereço configurado, por exemplo: http://localhost:9000/

5. Parando o Servidor
Use a interface gráfica da aplicação (pasta view) para parar o servidor quando necessário.

Rotas Disponíveis
Aqui estão algumas das rotas configuradas para o sistema:

Perguntas
POST /perguntas - Cadastrar nova pergunta
GET /perguntas - Listar perguntas

Respostas
POST /respostas - Cadastrar nova resposta
GET /respostas - Listar respostas

Estrutura dos Modelos
Pergunta
```pascal
type
  TPergunta = class
    ID: integer;
    Descricao: string;
  end;
```

Resposta
```pascal
type
  TResposta = class
    ID: integer;
    ID_Pergunta: integer;
    Valor: Integer;
  end;
```
Utilitários
A pasta utils contém funções auxiliares para conversão de objetos para JSON, manipulação de encoding e outras tarefas repetitivas.

Futuras Melhorias
Autenticação JWT: Adicionar autenticação com JWT para proteger as rotas.
Testes Unitários: Implementar testes automatizados para garantir a integridade do sistema.
Documentação da API: Adicionar suporte à Swagger ou outra ferramenta para gerar documentação automática da API.
Contribuição
Sinta-se à vontade para contribuir com este projeto, abrindo issues ou enviando pull requests. A colaboração é sempre bem-vinda!

Licença
Este projeto é licenciado sob a MIT License.
