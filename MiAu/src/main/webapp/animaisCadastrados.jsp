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
<link rel="icon" href="uploads/paw-solid.svg" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
/* Estilo geral */
body {
	background: linear-gradient(to right, #FFF8DC, #FAF0E6);
	color: #191970;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	overflow-x: hidden;
	font-family: 'Arial', sans-serif;
}

/* Container */
.container {
	max-width: 1100px;
	margin: auto;
	padding: 20px;
}

/* Estilo do cabeçalho */
h1 {
	font-size: 2.5rem;
	font-weight: bold;
	color: #191970;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
}

/* Estilização da tabela */
.table {
	background-color: white;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table thead {
	background-color: #191970;
	color: white;
}

.table th, .table td {
	text-align: center;
	padding: 12px;
	vertical-align: middle;
}

/* Estilização dos botões */
.btn-custom {
	border-radius: 8px;
	padding: 8px 12px;
	transition: 0.3s ease-in-out;
}

.btn-warning {
	background-color: #F4A460 !important;
	border: none;
}

.btn-warning:hover {
	background-color: #FF7F50 !important;
}

.btn-danger {
	background-color: #CD5C5C !important;
	border: none;
}

.btn-danger:hover {
	background-color: #B22222 !important;
}

/* Modal de exclusão */
.modal-header {
	background-color: #F4A460;
	color: #191970;
}

.modal-body {
	background-color: #FFF8DC;
	color: #191970;
	font-size: 1.1rem;
}

.modal-footer {
	background-color: #F4A460;
	border-top: none;
}

.btn-secondary {
	border-radius: 25px;
	padding: 8px 16px;
}

/* Navbar estilizada */
.navbar {
	background-color: #FFF8DC;
	backdrop-filter: blur(10px);
	box-shadow: 0 4px 10px rgba(25, 25, 112, 0.5);
}

.navbar-nav .nav-link {
	color: #696969 !important;
	font-weight: bold;
	transition: color 0.3s;
}

.navbar-nav .nav-link:hover {
	color: #F4A460 !important;
}

/* Ajuste de responsividade */
@media ( max-width : 768px) {
	h1 {
		font-size: 2rem;
	}
	.table {
		font-size: 0.9rem;
	}
	.btn-custom {
		padding: 6px 10px;
	}
}
</style>
<title>Seus Pets</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-4">
		<h1 class="text-center mb-4">Listagem de Animais</h1>
		<div class="table-responsive">
			<c:choose>
				<c:when test="${fn:length(listaDeAnimaisUser) > 0}">
					<table class="table table-striped table-hover">
						<thead class="text-white text-center">
							<tr>
								<th>#</th>
								<th>Nome</th>
								<th>Espécie</th>
								<th>Raça</th>
								<th>Sexo</th>
								<th>Status</th>
								<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="animal" items="${listaDeAnimaisUser}"
								varStatus="index">
								<tr>
									<td>${index.count}</td>
									<td>${animal.nome}</td>
									<td>${animal.especie}</td>
									<td>${animal.raca}</td>
									<td>${animal.sexo}</td>
									<td>${animal.status}</td>
									<td><a class="btn btn-warning btn-custom"
										href="ControllerServlet?action=updateAnimal&animal-id=${animal.id}">
											<i class="bi bi-pencil-square"></i>
									</a>
										<button class="btn btn-danger btn-custom"
											data-bs-toggle="modal" data-bs-target="#myModal"
											data-bs-id="${animal.id}">
											<i class="bi bi-trash-fill"></i>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<p class="text-center text-muted">Nenhum animal cadastrado.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<div class="modal fade" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-danger text-white">
					<h5 class="modal-title">Confirmação de Exclusão</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body text-center">
					<p>Tem certeza que deseja excluir este animal?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="button" id="delete" class="btn btn-danger">Excluir</button>
				</div>
			</div>
		</div>
	</div>
	<div vw class="enabled">
		<div vw-access-button class="active"></div>
		<div vw-plugin-wrapper>
			<div vw-plugin-container></div>
		</div>
	</div>


	<script defer src="js/apiLibras.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/home.js"></script>
	<!-- <script type="text/javascript" src="js/theme.js"></script> -->
</body>
</html>