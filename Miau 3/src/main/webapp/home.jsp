<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnfn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Home - Miaudote</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<div class="container mt-5">
		<h2 class="text-center text-white mb-4">Encontre seu novo amigo
			🐶🐱</h2>

		<form action="ControllerServlet" method="post" class="mb-4">
			<div class="row justify-content-center">
				<div class="col-md-4">
					<select class="form-select" name="especie" id="especie">
						<option value="" selected>Selecione a espécie</option>
						<option value="CACHORRO">Cachorro</option>
						<option value="GATO">Gato</option>
					</select>
				</div>
				<div class="col-md-2">
					<button type="submit" class="btn btn-light w-100" name="action"
						value="searchEspecies">Filtrar</button>
				</div>
			</div>
		</form>

		<div class="row">
			<c:forEach var="animal" items="${listaDeAnimais}">
				<div class="col-md-4 mb-4">
					<div class="card animal-card">
						<img src="${animal.imagem}" class="card-img-top animal-img"
							alt="${animal.nome}">
						<div class="card-body text-center">
							<h5 class="card-title">${animal.nome}</h5>
							<%--                             <p class="card-text"><strong>Espécie:</strong> ${animal.especie}</p> --%>
							<%--                             <p class="card-text"><strong>Raça:</strong> ${animal.raca}</p> --%>
							<%--                             <p class="card-text"><strong>Sexo:</strong> ${animal.sexo}</p> --%>
							<!--                             <p class="card-text"><strong>Status:</strong>  -->
							<p>
								<span
									class="badge ${animal.status == 'DISPONIVEL' ? 'bg-success' : 'bg-secondary'}">${animal.status}</span>
							</p>
							<%--                             <a href="ControllerServlet?action=ViewAnimalDetails&animal-id=${animal.id}" class="btn btn-primary btn-adopt w-100">Ver detalhes</a> --%>
							<button type="button" class="btn btn-primary btn-adopt w-100"
								data-bs-toggle="modal" data-bs-target="#${animal.id}">
								Ver detalhes</button>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="${animal.id}" tabindex="-1"
					aria-labelledby="modalLabel-${animal.id}" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content"
							style="border-radius: 15px; overflow: hidden;">

							<!-- Cabeçalho do Modal -->
							<div class="modal-header"
								style="background: linear-gradient(to right, #6a11cb, #2575fc);">
								<h5 class="modal-title fw-bold" id="modalLabel-${animal.id}">${animal.nome}
									🐾</h5>
								<button type="button" class="btn-close btn-close-white"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>

							<!-- Corpo do Modal -->
							<div class="modal-body p-4">
								<div class="row">

									<!-- Imagem -->
									<div
										class="col-md-5 d-flex justify-content-center align-items-center">
										<div class="img-container">
											<c:if test="${not empty animal.imagem}">
												<img src="${animal.imagem}" class="animal-img"
													alt="Imagem de ${animal.nome}">
											</c:if>
										</div>
									</div>

									<!-- Informações do Animal -->
									<div class="col-md-7">
										<div class="info-animal">
											<p>
												<i class="fas fa-note text-light"></i> <strong>Descrição:</strong>
												${animal.descricao}
											</p>
											<p>
												<i class="fas fa-paw"></i> <strong>Espécie:</strong>
												${animal.especie}
											</p>
											<p>
												<i class="fas fa-dna"></i> <strong>Raça:</strong>
												${animal.raca}
											</p>
											<p>
												<i class="fas fa-birthday-cake"></i> <strong>Idade:</strong>
												${animal.idade} anos
											</p>
											<p>
												<i class="fas fa-venus-mars"></i> <strong>Sexo:</strong>
												${animal.sexo}
											</p>
											<p>
												<i class="fas fa-ruler-combined"></i> <strong>Porte:</strong>
												${animal.porte}
											</p>
											<p>
												<i class="fas fa-check-circle"></i> <strong>Castrado:</strong>
												${animal.castrado ? 'Sim' : 'Não'}
											</p>
											<p>
												<i class="fas fa-tag"></i> <strong>Status:</strong> <span
													class="badge ${animal.status == 'DISPONIVEL' ? 'bg-success' : 'bg-secondary'}">${animal.status}</span>
											</p>
										</div>
									</div>

								</div>
							</div>

							<!-- Rodapé do Modal -->
							<div class="modal-footer d-flex justify-content-between">
								<button type="button" class="btn btn-outline-light"
									data-bs-dismiss="modal">Fechar</button>
								<c:choose>
									<c:when test="${animal.sexo == 'FEMEA'}">
										<a
											href="https://api.whatsapp.com/send?phone=${animal.telefone}"
											class="btn btn-success shadow-lg px-4"> <i
											class="fab fa-whatsapp"></i> Quero Adotar a ${animal.nome}
										</a>
									</c:when>
									<c:when test="${animal.sexo == 'MACHO'}">
										<a
											href="https://api.whatsapp.com/send?phone=${animal.telefone}"
											class="btn btn-success shadow-lg px-4"> <i
											class="fab fa-whatsapp"></i> Quero Adotar o ${animal.nome}
										</a>
									</c:when>
								</c:choose>
							</div>

						</div>
					</div>
				</div>



			</c:forEach>

		</div>

		<c:if test="${fn:length(listaDeAnimais) == 0}">
			<div class="alert alert-light text-center" role="alert">Nenhum
				animal disponível para adoção.</div>
		</c:if>
	</div>

	<jsp:include page="modalLogin.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/home.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>

</body>
</html>