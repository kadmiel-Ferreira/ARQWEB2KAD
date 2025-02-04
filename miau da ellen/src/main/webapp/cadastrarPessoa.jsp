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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="js/CPFouCNPJ.js" defer></script>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<div class="container">
		<div class="col-lg-8 offset-lg-2 col-sm-12">
			<c:if test="${result == 'notRegistered'}">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					E-mail já cadastrado. Tente novamente.
					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				</div>
			</c:if>

			<form action="ControllerServlet" method="post">
				<h1 class="text-center">
					<c:choose>
							<c:when test="${sessionScope.user == null}">
								<input type="hidden" name="id" value="0">
							</c:when>
							<c:when test="${sessionScope.user != null}">
								<input type="hidden" name="id" value="${sessionScope.user.id}">
							</c:when>
						</c:choose>
				</h1>

				<c:if test="${empty sessionScope.user}">
					<!-- Cadastro -->
					<div class="mb-2">
						<label for="tipoUsuario">Tipo de Usuário:</label> <select
							name="tipoUsuario" class="form-control" id="tipoUsuario" required>
							<option value="#">Selecione</option>
							<option value="ADOTANTE">Adotante</option>
							<option value="ONG">ONG</option>
						</select>
					</div>
				</c:if>

				<div class="mb-2">
					<label for="nome">Nome completo</label> <input type="text"
						name="nome" id="nome" class="form-control" minlength="3"
						maxlength="50" required
						value="${not empty sessionScope.user ? sessionScope.user.email : ''}">
				</div>

				<div class="mb-2">
					<label for="email">E-mail</label> <input type="email" name="email"
						id="email" class="form-control" required
						value="${not empty sessionScope.user ? sessionScope.user.email : ''}">

				</div>

				
					
					<div class="mb-2">
						<label for="password">Senha</label> <input type="password"
							name="password" id="password" class="form-control" minlength="6"
							maxlength="12" required>
					</div>

					<div class="mb-2">
						<label for="confirmPassword">Confirmação de Senha</label> <input
							type="password" name="confirmPassword" id="confirmPassword"
							class="form-control" minlength="6" maxlength="12" required>
					</div>
				

				<div class="mb-2">
					<label for="telefone">Telefone</label> <input type="text"
						name="telefone" id="telefone" class="form-control" required
						value="${not empty sessionScope.user ? sessionScope.user.telefone : ''}">

				</div>

				<fieldset>
					<h2 class="text-center">Endereço</h2>

					<div class="mb-2">
						<label for="cep">CEP:</label> <input type="text"
							class="form-control" id="cep" name="cep" required
							value="${not empty sessionScope.user ? sessionScope.user.cep : ''}">
					</div>

					<div class="mb-2">
						<label for="numero">Número:</label> <input type="text"
							class="form-control" id="numero" name="numero" required
							value="${not empty sessionScope.user ? sessionScope.user.numero : ''}">
					</div>

					<div class="mb-2">
						<label for="logradouro">Rua:</label> <input type="text"
							id="logradouro" class="form-control" name="logradouro" required
							value="${not empty sessionScope.user ? sessionScope.user.logradouro : ''}">
					</div>

					<div class="mb-2">
						<label for="complemento">Complemento:</label> <input type="text"
							class="form-control" id="complemento" name="complemento" required
							value="${not empty sessionScope.user ? sessionScope.user.complemento : ''}">
					</div>

					<div class="mb-2">
						<label for="bairro">Bairro:</label> <input type="text"
							class="form-control" id="bairro" name="bairro" required
							value="${not empty sessionScope.user ? sessionScope.user.bairro : ''}">
					</div>

					<div class="mb-2">
						<label for="cidade">Cidade:</label> <input type="text"
							class="form-control" id="cidade" name="cidade" required
							value="${not empty sessionScope.user ? sessionScope.user.cidade : ''}">
					</div>

					<div class="mb-2">
						<label for="estado">Estado:</label> <input type="text"
							class="form-control" id="estado" name="estado" maxlength="2"
							required
							value="${not empty sessionScope.user ? sessionScope.user.estado : ''}">
					</div>
				</fieldset>

				<div class="mb-2">
					<button type="submit" name="action"
						value="AdicionarPessoa"
						class="btn btn-primary">Salvar</button>
				</div>
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>
	<script type="text/javascript" src="js/buscaCep.js"></script>
	<script type="text/javascript" src="js/cookies.js"></script>
	<script type="text/javascript" src="js/mostrarSenha.js"></script>

</body>
</html>
