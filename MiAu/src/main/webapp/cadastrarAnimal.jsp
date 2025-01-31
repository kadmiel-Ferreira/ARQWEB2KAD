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
<script type="text/javascript" src="js/CachorroOuGato.js" defer></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet">
<link href="css/errors.css" rel="stylesheet">

<title>Página de Cadastro de Animais</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.user.tipoUsuario == 'ONG'}">
			<jsp:include page="navbar.jsp" />
	<div class="container">
		<div class="col-lg-6 offset-lg-3 col-sm-12">

			<form action="ControllerServlet" method="post" id="form1" enctype="multipart/form-data">
				<c:choose>
					<c:when test="${animal == null}">
						<h1 class="text-center">Novo Animal</h1>
					</c:when>
					<c:when test="${animal != null}">
						<h1 class="text-center">Edição do Animal</h1>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${animal == null}">
						<input type="hidden" name="id" value="0">
					</c:when>
					<c:when test="${animal != null}">
						<input type="hidden" name="id" value="${animal.id}">
					</c:when>
				</c:choose>

				<!-- Nome -->
				<div class="mb-2">
					<label for="nome">Nome do Animal*</label> <input type="text"
						name="nome" id="nome" class="form-control" required="required"
						value="${animal != null ? animal.nome : ''}">
				</div>

				<!-- Espécie -->
				<div class="mb-2">
					<label for="especie">Espécie*</label> <select id="especie"
						name="especie" class="form-control" required>
						<option value="">Selecione a espécie</option>
						<option value="CACHORRO"
							${animal != null && animal.especie == 'CACHORRO' ? 'selected' : ''}>Cachorro</option>
						<option value="GATO"
							${animal != null && animal.especie == 'GATO' ? 'selected' : ''}>Gato</option>
					</select>
				</div>

				<!-- Campo Raça -->
				<div class="mb-2" id="racaCaes">
					<label for="raca">Raça*</label> <select id="raca" name="racaCaes"
						class="form-control" >
						<option value=""
							${animal == null || animal.raca == '' ? 'selected' : ''}>Selecione</option>
						<option value="LABRADOR"
							${animal != null && animal.raca == 'LABRADOR' ? 'selected' : ''}>Labrador
							Retriever</option>
						<option value="GOLDEN_RETRIEVER"
							${animal != null && animal.raca == 'GOLDEN_RETRIEVER' ? 'selected' : ''}>Golden
							Retriever</option>
						<option value="PASTOR_ALEMAO"
							${animal != null && animal.raca == 'PASTOR_ALEMAO' ? 'selected' : ''}>Pastor
							Alemão</option>
						<option value="PUG"
							${animal != null && animal.raca == 'PUG' ? 'selected' : ''}>Pug</option>
						<option value="SHIH_TZU"
							${animal != null && animal.raca == 'SHIH_TZU' ? 'selected' : ''}>Shih
							Tzu</option>
						<option value="BULLDOG"
							${animal != null && animal.raca == 'BULLDOG' ? 'selected' : ''}>Bulldog</option>
						<option value="ROTTWEILER"
							${animal != null && animal.raca == 'ROTTWEILER' ? 'selected' : ''}>Rottweiler</option>
						<option value="BEAGLE"
							${animal != null && animal.raca == 'BEAGLE' ? 'selected' : ''}>Beagle</option>
						<option value="BORDER_COLLIE"
							${animal != null && animal.raca == 'BORDER_COLLIE' ? 'selected' : ''}>Border
							Collie</option>
						<option value="DALMATA"
							${animal != null && animal.raca == 'DALMATA' ? 'selected' : ''}>Dálmata</option>
						<option value="CHIHUAHUA"
							${animal != null && animal.raca == 'CHIHUAHUA' ? 'selected' : ''}>Chihuahua</option>
						<option value="YORKSHIRE"
							${animal != null && animal.raca == 'YORKSHIRE' ? 'selected' : ''}>Yorkshire
							Terrier</option>
						<option value="SRD"
							${animal != null && animal.raca == 'SRD' ? 'selected' : ''}>Sem
							Raça Definida</option>
					</select>
				</div>
				<div class="mb-2" id="racaGatos">
					<label for="raca">Raça*</label> 
					<select id="raca" name="racaGatos" class="form-control">
					    <option value="" ${animal == null || animal.raca == '' ? 'selected' : ''}>Selecione</option>
					    <option value="PERSA" ${animal != null && animal.raca == 'PERSA' ? 'selected' : ''}>Persa</option>
					    <option value="SIAMES" ${animal != null && animal.raca == 'SIAMES' ? 'selected' : ''}>Siamês</option>
					    <option value="MAINE_COON" ${animal != null && animal.raca == 'MAINE_COON' ? 'selected' : ''}>Maine Coon</option>
					    <option value="SPHYNX" ${animal != null && animal.raca == 'SPHYNX' ? 'selected' : ''}>Sphynx</option>
					    <option value="BENGAL" ${animal != null && animal.raca == 'BENGAL' ? 'selected' : ''}>Bengal</option>
					    <option value="RAGDOLL" ${animal != null && animal.raca == 'RAGDOLL' ? 'selected' : ''}>Ragdoll</option>
					    <option value="BRITISH_SHORTHAIR" ${animal != null && animal.raca == 'BRITISH_SHORTHAIR' ? 'selected' : ''}>British Shorthair</option>
					    <option value="SCOTTISH_FOLD" ${animal != null && animal.raca == 'SCOTTISH_FOLD' ? 'selected' : ''}>Scottish Fold</option>
					    <option value="ABISSINIO" ${animal != null && animal.raca == 'ABISSINIO' ? 'selected' : ''}>Abissínio</option>
					    <option value="BIRMANES" ${animal != null && animal.raca == 'BIRMANES' ? 'selected' : ''}>Birmanês</option>
					    <option value="SRD" ${animal != null && animal.raca == 'SRD' ? 'selected' : ''}>Sem Raça Definida</option>
					</select>
				</div>

				<!-- Idade -->
				<div class="mb-2">
					<label for="idade">Idade (anos)*</label> <input type="number"
						name="idade" id="idade" class="form-control" required="required"
						min="0" value="${animal != null ? animal.idade : ''}">
				</div>

				<!-- Campo Sexo -->
				<div class="mb-2">
					<label for="sexo">Sexo*</label> <select id="sexo" name="sexo"
						class="form-control" required>
						<option value="">Selecione o sexo</option>
						<option value="MACHO"
							${animal != null && animal.sexo == 'MACHO' ? 'selected' : ''}>Macho</option>
						<option value="FEMEA"
							${animal != null && animal.sexo == 'FEMEA' ? 'selected' : ''}>Fêmea</option>
					</select>
				</div>

				<!-- Campo Porte -->
				<div class="mb-2">
					<label for="porte">Porte*</label> <select id="porte" name="porte"
						class="form-control" required>
						<option value="">Selecione o porte</option>
						<option value="PEQUENO"
							${animal != null && animal.porte == 'PEQUENO' ? 'selected' : ''}>Pequeno</option>
						<option value="MEDIO"
							${animal != null && animal.porte == 'MEDIO' ? 'selected' : ''}>Médio</option>
						<option value="GRANDE"
							${animal != null && animal.porte == 'GRANDE' ? 'selected' : ''}>Grande</option>
					</select>
				</div>

				<!-- Campo Castrado -->
				<div class="mb-2">
					<label for="castrado">Castrado*</label> <select id="castrado"
						name="castrado" class="form-control" required>
						<option value="">Selecione uma opção</option>
						<option value="true"
							${animal != null && animal.castrado ? 'selected' : ''}>Sim</option>
						<option value="false"
							${animal != null && !animal.castrado ? 'selected' : ''}>Não</option>
					</select>
				</div>

				<!-- Campo Status -->
				<div class="mb-2">
					<label for="status">Status*</label> <select id="status"
						name="status" class="form-control" required>
						<option value="DISPONIVEL"
							${animal != null && animal.status == 'DISPONIVEL' ? 'selected' : ''}>Disponível</option>
						<option value="ADOTADO"
							${animal != null && animal.status == 'ADOTADO' ? 'selected' : ''}>Adotado</option>
					</select>
				</div>

				<!-- Campo Descrição -->
				<div class="mb-2">
					<label for="descricao">Descrição*</label>
					<textarea id="descricao" name="descricao" class="form-control"
						required>${animal != null ? animal.descricao : ''}</textarea>
				</div>
				
				<div class="mb-2">
					<label for="imagem">Imagem*</label> <input type="file"
						name="imagem" id="imagem" class="form-control"
						value="${animal != null ? animal.imagem : ''}">
				</div>

				<div class="mb-2">
					<button type="submit" name="action" value="saveAnimal"
						class="btn btn-primary">Salvar</button>
				</div>
			</form>
		</div>
	</div>
		</c:when>
		<c:when test="${sessionScope.user.tipoUsuario == 'ADOTANTE'}">
			<p>Você não possui permissão para esse cadastro</p>
		</c:when>
	</c:choose>
	

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/theme.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>

</body>
</html>