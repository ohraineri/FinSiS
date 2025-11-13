# FinSiS - Sistema ERP Completo
Sistema ERP (Enterprise Resource Planning) em Delphi para controle financeiro e gestão empresarial.

## Módulos Implementados

### 1. Clientes (Customers)
- Cadastro completo de clientes
- Campos: Nome, Telefone, Email, Data de Aniversário
- Funcionalidades: Criar, Editar, Excluir, Pesquisar

### 2. Fornecedores (Suppliers)
- Gerenciamento de fornecedores
- Campos: Nome, CNPJ, Email, Telefone
- Funcionalidades: Criar, Editar, Excluir, Pesquisar

### 3. Usuários (Users)
- Controle de usuários do sistema
- Campos: Nome, Usuário, Senha, Email
- Funcionalidades: Criar, Editar, Excluir, Pesquisar

### 4. Contas a Pagar (Accounts Payable)
- Gestão de contas a pagar
- Campos: Descrição, Valor, Vencimento, Fornecedor, Status
- Funcionalidades: Criar, Editar, Excluir, Pesquisar

### 5. Contas a Receber (Accounts Receivable)
- Gestão de contas a receber
- Campos: Descrição, Valor, Vencimento, Cliente, Status
- Funcionalidades: Criar, Editar, Excluir, Pesquisar

## Tecnologias Utilizadas
- Delphi 7/2010
- Firebird Database
- DBExpress Components
- ClientDataSet para manipulação de dados

## Instalação

1. Execute o script SQL em `Database/create_erp_tables.sql` no banco de dados Firebird
2. Configure a conexão do banco de dados em `DataModule.dfm`
3. Compile e execute o projeto `SCF.dpr`

## Estrutura do Banco de Dados
- CUSTOMERS - Clientes
- SUPPLIERS - Fornecedores
- USUARIOS - Usuários do sistema
- CONTAS_A_PAGAR - Contas a pagar
- CONTAS_A_RECEBER - Contas a receber

