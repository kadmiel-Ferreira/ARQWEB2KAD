<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
.toggle-password {
	cursor: pointer;
}
</style>
<title>Editar Usuário</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container">
		<div class="col-lg-6 offset-lg-3 col-sm-12">
			<c:if test="${empty sessionScope.user}">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					E-mail já cadastrado. Tente novamente.
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			
			<form action="ControllerServlet" method="post" id="form1">
				<h1 class="text-center">Editar Usuário</h1>
						
				<div class="mb-2">
					<label for="nome">Nome completo</label> <input type="text"
						name="nome" id="nome" class="form-control" minlength="3"
						maxlength="50" required="required" value="${sessionScope.user.nome}"> <span id="0"></span>
				</div>

				<div class="mb-2">
					<label for="email">E-mail</label> <input type="email" name="email"
						id="email" class="form-control" required="required" value="${sessionScope.user.email}"> <span
						id="1"></span>
				</div>

				<div class="mb-2">
					<label for="password">Senha</label> <input type="password"
						name="password" id="password" class="form-control" minlength="6"
						maxlength="12" required="required" > <span id="2"></span>
						<span class="input-group-text toggle-password">
                    	<i class="fa-solid fa-eye"></i>
                </span>
				</div>

				<div class="mb-2">
					<label for="confirmPassword">Confirmação de Senha</label> <input
						type="password" name="confirmPassword" id="confirmPassword"
						class="form-control" minlength="6" maxlength="12"
						required="required"> <span id="3"></span>
				</div>

				<div class="mb-2">
					<label for="telefone">Telefone</label> <input
						type="text" name="telefone" id="telefone"
						class="form-control" required="required" value="${sessionScope.user.telefone}">
					<span id="4"></span>
				</div>
				
				<div class="mb-2">
					<fieldset>
						<h2 class="text-center">Endereço</h2>

						<label for="cep">CEP:</label><br> <input type="text" class="form-control"
							id="cep" name="cep" required value="${sessionScope.user.cep}">
						<br>
						
						<label for="numero">Numero:</label><br> <input type="text" class="form-control"
							id="numero" name="numero" required value="${sessionScope.user.numero}">
						<br>

						<label for="rua">Rua:</label><br> <input type="text" id="logradouro" class="form-control"
							name="logradouro" required value="${sessionScope.user.logradouro}">
						<br>
						
						
						
						<label for="complemento">Complemento:</label><br> <input type="text" class="form-control"
							id="complemento" name="complemento" required value="${sessionScope.user.complemento}">
						<br>
						
						<label for="bairro">Bairro:</label><br> <input type="text" class="form-control"
							id="bairro" name="bairro" required value="${sessionScope.user.bairro}">
						<br>
						
						
						<label for="cidade">Cidade:</label><br> <input type="text" class="form-control"
							id="cidade" name="cidade" required value="${sessionScope.user.cidade}">
						<br>

						<label for="estado">Estado:</label><br> <input type="text" class="form-control"
							id="estado" name="estado" maxlength="2" required value="${sessionScope.user.estado}">
						<br>

					</fieldset>
				</div>

				<div class="mb-2">
					<button type="submit"  name="action"
						value="AdicionarPessoa" class="btn btn-primary">Salvar</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.8/jquery.inputmask.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/buscaCep.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>
	<script type="text/javascript" src="js/mostrarSenha.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.8/jquery.inputmask.min.js"></script>
	
	<script>
	  $(document).ready(function () {
        console.log("jQuery carregado, aplicando máscaras...");
        
        // Aplicando máscara ao telefone
        $('#telefone').inputmask('(99) 99999-9999');

        // Aplicando máscara ao CEP
        $('#cep').inputmask('99999-999');
    });
	  </script>
</body>
</html>