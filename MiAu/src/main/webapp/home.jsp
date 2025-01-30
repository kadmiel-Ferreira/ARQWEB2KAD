
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<title>Home</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5">
		<form action="ControllerServlet" method="post">
				<div class="row">
					<div class="col-12 col-lg-3">
					  	<div class="mb-2">
							<label for="type">Especie</label> 
							<select class="form-select"
								name="especie" id="especie">
								<option value="" selected>Selecione</option>
								<option value="CACHORRO">Cachorro</option>
								<option value="GATO">Gato</option>
							</select>
						</div>
					</div>
					<div class="col-12 col-lg-3 mt-4">
						<button type="submit" class="btn btn-primary" name="action" value="searchEspecies">Filtrar</button>
					</div>  
				</div>
			</form>
		
		
		<c:out value="Tamanho da lista: ${fn:length(listaDeAnimais)}" />
		<c:choose>
			<c:when test="${fn:length(listaDeAnimais) > 0}">
				<table class="table table-striped table-hover table-responsive">
					<thead>
						<tr>
							<th>#</th>
							<th>Nome</th>
							<th>Espécie</th>
							<th>Raça</th>
							<th>Sexo</th>
							<th>Status</th>
							<th>Imagem</th>
							<th>Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="animal" items="${listaDeAnimais}" varStatus="index">
							<tr>
								<td>${index.count}</td>
								<td>${animal.nome}</td>
								<td>${animal.especie}</td>
								<td>${animal.raca}</td>
								<td>${animal.sexo}</td>
								<td><c:choose>
										<c:when test="${animal.status == 'DISPONIVEL'}">Disponível</c:when>
										<c:when test="${animal.status == 'ADOTADO'}">Adotado</c:when>
										<c:otherwise>Indefinido</c:otherwise>
									</c:choose></td>
								<td>
								    <c:if test="${not empty animal.imagem}">
								        <img src="${animal.imagem}" alt="Imagem de ${animal.nome}" width="100">
								    </c:if>
								</td>
								<td>
									<span data-bs-toggle="tooltip"
										data-bs-placement="top" title="ViewAnimalDetails"> <a class="btn"
											href="ControllerServlet?action=ViewAnimalDetails&animal-id=${animal.id}">
												<i class="bi bi-eye-fill"></i>
										</a>
									</span>
									
								
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<div class="alert alert-info" role="alert">Nenhum animal
					cadastrado.</div>
			</c:otherwise>
		</c:choose>


	</div>
	<!-- Modal -->
	<div class="modal" tabindex="-1" id="myModal">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Exclusão</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p>Tem certeza que deseja excluir a atividade?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		        <button type="button" id="delete" class="btn btn-danger">Excluir</button>
		      </div>
		    </div>
	  	</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/home.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>
</body>
</html>
