<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:choose>
		<c:when test="${not empty sessionScope.user}">Editar Usuário</c:when>
		<c:otherwise>Cadastre-se</c:otherwise>
	</c:choose></title>


<link rel="stylesheet" type="text/css" href="css/styles.css">
<style>


.form-container {
    font-family: 'Arial', sans-serif;
    background-color: #FFF8DC;
    margin: 0;
    padding: 0;
    margin-top: 50px;
	margin-bottom: 30px;
}

.form-container form {
    background-color: #191970;
    padding: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-top: 5px solid #F4A460;
    border-radius: 10px;
    width: 100%;
    max-width: 900px;
    min-width: 0;
}

.form-container .form-group {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 10px;
}

.form-container .form-group > div {
    flex: 1;
    min-width: 280px; /* Garantindo que os inputs se ajustem */
}

/* Estilos para os inputs */
.form-container input[type="text"], .form-container input[type="number"], 
.form-container input[type="file"], .form-container input[type="email"], 
.form-container input[type="password"], .form-container select, 
.form-container textarea {
    border: 1px solid #ccc;
    padding: 5px;
    width: 100%;
    margin-bottom: 10px;
    font-size: 16px;
    transition: border-color 0.3s ease;
    border-radius: 0;
    background-color: #333;
    color: #fff;
    box-sizing: border-box;
}

.form-container h1, .form-container h2 {
    color: #F4A460;
    font-size: 24px;
    text-align: center;
    margin-bottom: 10px;
    font-weight: bold;
}

.form-container button[type="submit"] {
    background-color: #F4A460;
    font-weight: bold;
    color: white;
    border: none;
    padding: 7px 15px;
    font-size: 18px;
    cursor: pointer;
    width: 40%;
    margin-top: 5px;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

.form-container button[type="submit"]:hover {
    background-color: #FF7F50;
}

.form-container label {
    font-weight: bold;
    color: #DCDCDC;
}

.form-container .mb-2 {
    margin-bottom: 20px;
}

/* Responsividade */
@media (max-width: 768px) {
    .form-container {
        margin-top: 20px;
    }
    .form-container form {
        padding: 25px;
        width: 95%;
        min-width: 0;
    }
    .form-container h1 {
        font-size: 24px;
    }
    .form-container button[type="submit"] {
        padding: 12px 25px;
    }
    .form-container .form-group {
        flex-direction: column; /* Alinha os campos de entrada na vertical em telas pequenas */
        gap: 15px;
    }
}

</style>



<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="js/CPFouCNPJ.js" defer></script>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<div class="form-container">
		<div class="col-lg-8 offset-lg-2 col-sm-12">
			<c:if test="${result == 'notRegistered'}">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					E-mail já cadastrado. Tente novamente.
					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				</div>
			</c:if>

			<form
				action="${empty sessionScope.user ? 'ControllerServlet?action=AdicionarPessoa' : 'ControllerServlet?action=editUsuario'}"
				method="post">


				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<h1 class="text-center">Cadastre-se</h1>
						<input type="hidden" name="id" value="0">
					</c:when>
					<c:when test="${not empty sessionScope.user}">
						<h1 class="text-center">Editar Perfil</h1>
						<input type="hidden" name="id" value="${sessionScope.user.id}">
					</c:when>
				</c:choose>


				<c:if test="${empty sessionScope.user}">
					<!-- Cadastro -->
					<div class="form-group">
						<label for="tipoUsuario">Tipo de Usuário:</label> <select
							name="tipoUsuario" class="form-control" id="tipoUsuario" required>
							<option value="#" disable>Selecione</option>
							<option value="ADOTANTE">Adotante</option>
							<option value="ONG">ONG</option>
						</select>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.user}">
					<!-- Cadastro -->
					<div class="form-group">
						<input type="hidden" name="tipoUsuario"
							value="${sessionScope.user.tipoUsuario}">

					</div>
				</c:if>


				<div class="form-group">
					<div>
						<label for="nome">Nome completo</label> <input type="text"
							name="nome" id="nome" class="form-control" minlength="3"
							maxlength="50" required
							value="${not empty requestScope.user ? requestScope.user.nome : ''}">
					</div>

					<div>
						<label for="email">E-mail</label> <input type="email" name="email"
							id="email" class="form-control" required
							value="${not empty sessionScope.user ? sessionScope.user.email : ''}">

					</div>
				</div>



				<div class="form-group">
					<div>
						<label for="password">Senha</label> <input type="password"
							name="password" id="password" class="form-control" minlength="6"
							maxlength="12" required>
					</div>

					<div>
						<label for="confirmPassword">Confirmação de Senha</label> <input
							type="password" name="confirmPassword" id="confirmPassword"
							class="form-control" minlength="6" maxlength="12" required>
					</div>
				</div>

				<div class="form-group">
					<div>
						<label for="telefone">Telefone</label> <input type="text"
							name="telefone" id="telefone" class="form-control" required
							value="${not empty sessionScope.user ? sessionScope.user.telefone : ''}">

					</div>
					<c:if test="${not empty sessionScope.user}">

						<div id="cpfDiv" style="display: none;">
							<label for="cpf">CPF</label> <input type="text" name="cpf"
								id="cpf" class="form-control" value="${sessionScope.user.cpf}">

							<span id="cpfErro" class="text-danger"></span>
						</div>
					</c:if>

					<c:if test="${not empty sessionScope.user}">

						<div id="cnpjDiv" style="display: none;">
							<label for="cnpj">CNPJ</label> <input type="text" name="cnpj"
								id="cnpj" class="form-control" value="${sessionScope.user.cnpj}">
						</div>
					</c:if>
					<c:if test="${empty sessionScope.user}">
						<div id="cpfDiv" style="display: block;">
							<label for="cpf">CPF</label> <input type="text" name="cpf"
								id="cpf" class="form-control" placeholder="Digite seu CPF">

							<span id="cpfErro" class="text-danger"></span>
						</div>

						<div id="cnpjDiv" style="display: none;">
							<label for="cnpj">CNPJ</label> <input type="text" name="cnpj"
								id="cnpj" class="form-control" placeholder="Digite seu CNPJ">
						</div>
					</c:if>
					</div>


						<fieldset>
							<h2 class="text-center">Endereço</h2>

							<div class="form-group">
								<div>
									<label for="cep">CEP:</label> <input type="text"
										class="form-control" id="cep" name="cep" required
										value="${not empty sessionScope.user ? sessionScope.user.cep : ''}">
								</div>

								<div>
									<label for="numero">Número:</label> <input type="text"
										class="form-control" id="numero" name="numero" required
										value="${not empty sessionScope.user ? sessionScope.user.numero : ''}">
								</div>
							</div>
							<div class="form-group">
								<div>
									<label for="logradouro">Rua:</label> <input type="text"
										id="logradouro" class="form-control" name="logradouro"
										required
										value="${not empty sessionScope.user ? sessionScope.user.logradouro : ''}">
								</div>

								<div>
									<label for="complemento">Complemento:</label> <input
										type="text" class="form-control" id="complemento"
										name="complemento" required
										value="${not empty sessionScope.user ? sessionScope.user.complemento : ''}">
								</div>
							</div>
							<div class="form-group">
								<div>
									<label for="bairro">Bairro:</label> <input type="text"
										class="form-control" id="bairro" name="bairro" required
										value="${not empty sessionScope.user ? sessionScope.user.bairro : ''}">
								</div>

								<div>
									<label for="cidade">Cidade:</label> <input type="text"
										class="form-control" id="cidade" name="cidade" required
										value="${not empty sessionScope.user ? sessionScope.user.cidade : ''}">
								</div>
							</div>
							<div class="form-group">
								<label for="estado">Estado:</label> <input type="text"
									class="form-control" id="estado" name="estado" maxlength="2"
									required
									value="${not empty sessionScope.user ? sessionScope.user.estado : ''}">
							</div>
						</fieldset>

						<div class="mb-2">
							<button type="submit" name="action" value="AdicionarPessoa"
								class="btn btn-primary">Salvar</button>
						</div>
			</form>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/inputmask/5.0.7-beta.20/inputmask.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>
	<script type="text/javascript" src="js/buscaCep.js"></script>
	<script type="text/javascript" src="js/cookies.js"></script>
	<script type="text/javascript" src="js/mostrarSenha.js"></script>

</body>
</html>
