<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="pt-BR" data-bs-theme="light">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="css/styles.css">
	<title>MiAu - Página Principal</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container">
		<div class="center col-lg-10 col-sm-12">
			<h1 class="text-center">Listagem de Animais</h1>
			<c:choose>
				<c:when test="${fn:length(listaDeAnimaisUser) > 0}">
					<table class="table table-striped table-hover table-responsive">
						<tr>
							<th>#</th>
							<th>Nome</th>
							<th>Especie</th>
							<th>Raça</th>
							<th>Sexo</th>
							<th>Status</th>
							<th>Ações</th>
						</tr>
						<c:forEach var="animal" 
							items="${listaDeAnimaisUser}" varStatus="index">
							<tr>
								<td>${index.count}</td>
								<td>${animal != null ? animal.nome : ''}</td>
								<td>${animal != null ? animal.especie : ''}</td>
								<td>${animal != null ? animal.raca : ''}</td>
								<td>${animal != null ? animal.sexo : ''}</td>
								<td>${animal != null ? animal.status : ''}</td>
								
								<td>
									<!-- Ação de editar --> <span data-bs-toggle="tooltip"
									data-bs-placement="top" title="Editar"> <a class="btn"
										href="ControllerServlet?action=updateAnimal&animal-id=${animal.id}">
											<i class="bi bi-pencil-square"></i>
									</a>
								</span> <!-- Ação de excluir --> <span data-bs-toggle="tooltip"
									data-bs-placement="top" title="Excluir"> <a class="btn" data-bs-toggle="modal" data-bs-target="#myModal"
            								data-bs-id="${animal.id}">
											<i class="bi bi-trash-fill"></i>
									</a>
								</span>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<c:out value="Nenhuma atividade cadastrada."></c:out>
				</c:otherwise>
			</c:choose>
		</div>
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