<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="pt-BR" data-bs-theme="light">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="js/CPFouCNPJ.js" defer></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .toggle-password {
            cursor: pointer;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
        }

        .form-row .form-group {
            flex: 1;
            margin-right: 10px;
        }

        .form-row .form-group:last-child {
            margin-right: 0;
        }

        .form-control {
            margin-bottom: 10px;
        }
		.btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .alert {
            margin-top: 15px;
        }
        
        .input-group {
            position: relative;
        }

        .input-group .form-control {
            padding-right: 40px;
        }

        /* Estilo para o botão de visualização da senha */
        .input-group-text {
            position: absolute;
            top: 40%;
            right: 5px;
            transform: translateY(-50%);
            background-color: transparent;
            border: none;
            cursor: pointer;
        }
        
    </style>

    <title>Cadastre-se</title>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <div class="container">
        <div class="col-lg-8 offset-lg-2 col-sm-12">
            <c:if test="${result == 'notRegistered'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    E-mail já cadastrado. Tente novamente.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <form action="ControllerServlet" method="post" id="form1">
                <h1 class="text-center mb-4">Cadastre-se</h1>

                <!-- Tipo de Usuário -->
                <div class="mb-2">
                    <label for="tipoUsuario">Tipo de Usuário:</label>
                    <select name="tipoUsuario" class="form-control" id="tipoUsuario" required>
                        <option value="#">Selecione</option>
                        <option value="ADOTANTE">Adotante</option>
                        <option value="ONG">ONG</option>
                    </select>
                </div>

                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nome">Nome completo</label>
                        <input type="text" name="nome" id="nome" class="form-control" minlength="3" maxlength="50" required placeholder="Digite seu nome">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="email">E-mail</label>
                        <input type="email" name="email" id="email" class="form-control" required placeholder="Digite seu e-mail">
                    </div>
                </div>

                
               <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="password">Senha</label>
                        <div class="input-group">
                            <input type="password" name="password" id="password" class="form-control" minlength="6" maxlength="12" required placeholder="Digite sua senha">
                            <span class="input-group-text toggle-password"><i class="fa-solid fa-eye"></i></span>
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="confirmPassword">Confirmação de Senha</label>
                        <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" minlength="6" maxlength="12" required placeholder="Confirme sua senha">
                    </div>
                </div>

                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="telefone">Telefone</label>
                        <input type="text" name="telefone" id="telefone" class="form-control" required placeholder="Digite seu telefone">
                    </div>

                    <div class="form-group col-md-6" id="cpfDiv" style="display: none;">
                        <label for="cpf">CPF</label>
                        <input type="text" name="cpf" id="cpf" class="form-control" placeholder="Digite seu CPF">
                        <span id="cpfErro" class="text-danger"></span>
                    </div>

                    <div class="form-group col-md-6" id="cnpjDiv" style="display: none;">
                        <label for="cnpj">CNPJ</label>
                        <input type="text" name="cnpj" id="cnpj" class="form-control" placeholder="Digite seu CNPJ">
                    </div>
                </div>

                <!-- Endereço -->
                <fieldset>
                    <h2 class="text-center">Endereço</h2>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="cep">CEP</label>
                            <input type="text" class="form-control" id="cep" name="cep" required placeholder="Digite seu CEP">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="numero">Número</label>
                            <input type="text" class="form-control" id="numero" name="numero" required placeholder="Número da residência">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="logradouro">Rua</label>
                            <input type="text" class="form-control" id="logradouro" name="logradouro" required placeholder="Nome da rua">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="complemento">Complemento</label>
                            <input type="text" class="form-control" id="complemento" name="complemento" required placeholder="Complemento (opcional)">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="bairro">Bairro</label>
                            <input type="text" class="form-control" id="bairro" name="bairro" required placeholder="Bairro">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cidade">Cidade</label>
                            <input type="text" class="form-control" id="cidade" name="cidade" required placeholder="Cidade">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="estado">Estado</label>
                            <input type="text" class="form-control" id="estado" name="estado" maxlength="2" required placeholder="Estado (UF)">
                        </div>
                    </div>
                </fieldset>

                <div class="mb-2">
                    <button type="submit" name="action" value="AdicionarPessoa" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.8/jquery.inputmask.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- Scripts personalizados -->
    <script type="text/javascript" src="js/theme.js"></script>
    <script type="text/javascript" src="js/buscaCep.js"></script>
    <script type="text/javascript" src="js/cookies.js"></script>
    <script type="text/javascript" src="js/mostrarSenha.js"></script>
    

</body>
</html>
