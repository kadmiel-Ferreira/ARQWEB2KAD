<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<jsp:include page="modalLogin.jsp" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<nav class="navbar navbar-expand-lg">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"
			style="display: flex; align-items: center; gap: 8px; text-decoration: none; color: inherit;">
			<span><strong>MiauDote</strong></span> <i class="fa-solid fa-cat"></i>
			<i class="fa-solid fa-dog"></i>
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<c:choose>
					<c:when test="${sessionScope.user.tipoUsuario == 'ONG'}">
						<li class="nav-item"><a class="nav-link"
							href="cadastrarAnimal.jsp">Cadastrar Animal</a></li>
						<li class="nav-item"><a class="nav-link"
							href="ControllerServlet?action=ListAnimalUsers">Animais
								Cadastrados</a></li>
					</c:when>
				</c:choose>
				<li class="nav-item"><a class="nav-link"
					href="ControllerServlet?action=ListAnimal">Adote</a></li>

				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Conta </a>
							<ul class="dropdown-menu">
								<li><button type="button" class="dropdown-item"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										Login</button></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="cadastrarPessoa.jsp">Cadastrar</a></li>
							</ul></li>
			</ul>
			</c:when>
			</c:choose>

			</ul>

			<div class="d-flex align-items-center">
				<c:if test="${not empty sessionScope.user }">

					<a href="paginaUsuario.jsp" class="nav-link"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							color="grey" fill="currentColor" class="bi bi-person-circle"
							viewBox="0 0 16 16">
                        <path
								d="M13.468 12.37C12.282 11.226 10.482 10.5 8 10.5s-4.282.726-5.468 1.87A6.99 6.99 0 0 0 8 15a6.99 6.99 0 0 0 5.468-2.63z" />
                        <path fill-rule="evenodd"
								d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                        <path fill-rule="evenodd"
								d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM1 8a7 7 0 1 1 14 0A7 7 0 0 1 1 8z" />
                    </svg>
					</a>
				</c:if>


				<button id="switchTheme" class="btn btn-outline-secondary ms-2">
					<svg id="themeIcon" xmlns="http://www.w3.org/2000/svg" width="18"
						height="18" fill="currentColor" class="bi bi-sun-fill"
						viewBox="0 0 16 16">
                        <path
							d="M8 3a5 5 0 1 0 0 10A5 5 0 0 0 8 3zM8 0a.5.5 0 0 1 .5.5V2a.5.5 0 0 1-1 0V.5A.5.5 0 0 1 8 0zm4.546 2.354a.5.5 0 1 1 .708.708l-1.5 1.5a.5.5 0 1 1-.708-.708l1.5-1.5zM16 7.5a.5.5 0 0 1-.5-.5h-1.5a.5.5 0 0 1 0-1H15.5a.5.5 0 0 1 .5.5zm-2.354 6.046a.5.5 0 1 1-.708.708l-1.5-1.5a.5.5 0 1 1 .708-.708l1.5 1.5zM8 14a.5.5 0 0 1 .5.5V16a.5.5 0 0 1-1 0v-1.5A.5.5 0 0 1 8 14zM2.354 13.646a.5.5 0 1 1-.708-.708l1.5-1.5a.5.5 0 1 1 .708.708l-1.5 1.5zM1 7.5a.5.5 0 0 1 .5-.5H3a.5.5 0 0 1 0 1H1.5a.5.5 0 0 1-.5-.5zm2.354-5.146a.5.5 0 1 1 .708-.708l1.5 1.5a.5.5 0 1 1-.708.708l-1.5-1.5z" />
                    </svg>
				</button>
			</div>
		</div>
	</div>
</nav>