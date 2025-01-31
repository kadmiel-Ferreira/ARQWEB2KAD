<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!doctype html>
<html lang="pt-BR" data-bs-theme="light">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Estilo Personalizado -->
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .input-group-text {
            background: transparent;
            border: none;
        }

        .form-control {
            border-radius: 25px;
            padding: 10px;
        }

        .btn-primary {
            border-radius: 25px;
            padding: 10px;
            font-size: 18px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background: #2575fc;
        }

        .btn-secondary {
            border-radius: 25px;
            padding: 10px;
        }

        .toggle-password {
            cursor: pointer;
        }
    </style>
    
    <title>Página de Login</title>
  </head>
  <body>
  
    <div class="login-container">
        <h2 class="mb-4">MiAuDote 🐶🐱</h2>

        <c:if test="${param.notLogged == 'true'}">
            <div class="alert alert-danger">Você ainda não está logado!</div>
        </c:if>

        <c:choose>
            <c:when test="${result == 'registered'}">
                <div class="alert alert-success">Usuário cadastrado com sucesso. Faça o login.</div>
            </c:when>
            <c:when test="${result == 'loginError'}">
                <div class="alert alert-danger">E-mail e/ou senha inválidos.</div>
            </c:when>
        </c:choose>

        <form action="ControllerServlet" method="post">
            <div class="input-group mb-3">
                <span class="input-group-text">
                    <i class="fa-solid fa-envelope"></i>
                </span>
                <input type="email" name="email" id="email"
                    placeholder="E-mail" required class="form-control">
            </div>
            
            <div class="input-group mb-3">
                <span class="input-group-text">
                    <i class="fa-solid fa-lock"></i>
                </span>
                <input type="password" name="password" id="password"
                    placeholder="Senha" required class="form-control">
                <span class="input-group-text toggle-password">
                    <i class="fa-solid fa-eye"></i>
                </span>
            </div>

            <div class="mb-3">
                <button type="submit" class="btn btn-primary w-100" name="action" value="login">Login</button>
            </div>
            
            <div class="mb-3">
                <a href="cadastrarPessoa.jsp" class="btn btn-secondary w-100">Cadastrar</a>
            </div>
        </form>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/cookies.js"></script>
    <script type="text/javascript" src="js/mostrarSenha.js"></script>
  </body>
</html>
