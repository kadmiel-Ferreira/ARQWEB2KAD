# **MiAu - Sistema de Adoção de Animais**

## 🐾 Visão Geral
**MiAu** é um sistema desenvolvido para facilitar a adoção de animais de estimação, conectando adotantes a ONGs e abrigos. A plataforma permite visualizar animais disponíveis, conhecer detalhes sobre cada um e entrar em contato para adoção.

## 🚀 Tecnologias Utilizadas
- **Front-end:** *HTML, CSS, JavaScript, JSP (Java Server Pages)*
- **Back-end:** *Java (Servlets e Helpers), DAO (Data Access Object)*
- **Banco de Dados:** *Oracle Database com procedimentos em PL/SQL*
- **Frameworks e Bibliotecas:** *Bootstrap, Chart.js para visualização de estatísticas*

## 📌 Funcionalidades Principais
1. **🐶 Listagem de Animais:** Os usuários podem visualizar os animais disponíveis para adoção.
2. **🔐 Cadastro e Login:** Permite que os usuários realizem login para acessar funcionalidades personalizadas.
3. **🔎 Filtragem e Busca:** Facilita a localização de animais com base em tipo e raça.
4. **📊 Estatísticas:** Gera gráficos para visualizar dados sobre os animais cadastrados.
5. **📱 Integração com WhatsApp:** Os adotantes podem entrar em contato com as ONGs diretamente pelo WhatsApp.

## 🗄️ Configuração do Banco de Dados
O banco de dados foi implementado utilizando **Oracle** e conta com **procedimentos armazenados em PL/SQL**. As principais tabelas incluem:
- **`animal`** - Registra informações dos animais disponíveis.
- **`adotante`** - Armazena dados dos usuários interessados na adoção.
- **`ONG`** - Contém informações sobre ONGs e abrigos.

## 🔧 Como Executar o Projeto
1. **📂 Configurar o Banco de Dados:**
   - Importe o script SQL no **Oracle Database**.
   - Certifique-se de que os procedimentos **PL/SQL** estão corretamente criados.

2. **🖥️ Configurar o Servidor:**
   - Utilize um servidor compatível, como **Apache Tomcat**.
   - Configure a conexão do banco de dados no **DAO**.

3. **▶️ Rodar o Projeto:**
   - Inicie o servidor e acesse a aplicação pelo navegador

