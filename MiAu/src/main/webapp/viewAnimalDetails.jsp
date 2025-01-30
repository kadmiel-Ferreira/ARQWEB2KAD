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
	<jsp:include page="navbar.jsp" />
	<div class="container">
		<div class="col-lg-6 offset-lg-3 col-sm-12">

			<form action="ControllerServlet" method="post" id="form1">
				
				<h1 class="text-center">Detalhes do Animal</h1>
				
				<div class="card mb-3" style="max-width: 540px;">
				  <div class="row g-0">
				    <div class="col-md-4">				      
					    <c:if test="${not empty animal.imagem}">
					        <img src="${animal.imagem}" alt="Imagem de ${animal.nome}" width="100">
					    </c:if>								
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">${animal != null ? animal.nome : ''}</h5>
				        <p class="card-text">${animal != null ? animal.descricao : ''}</p>
				        <p class="card-text">${animal != null ? animal.especie : ''}</p>
				        <p class="card-text">${animal != null ? animal.raca : ''}</p>
				        <p class="card-text">${animal != null ? animal.idade : ''}</p>
				        <p class="card-text">${animal != null ? animal.sexo : ''}</p>
				        <p class="card-text">${animal != null ? animal.porte : ''}</p>
				        <p class="card-text">${animal != null ? animal.castrado : ''}</p>
				        
				        
				        
				        <p class="card-text"><small class="text-muted">${animal != null ? animal.status : ''}</small></p>
				        <a href="https://api.whatsapp.com/send?phone=${animal.telefone}" class="btn btn-success" target="_blank">Quero Adotar Esse Animal</a>
				        
				      </div>
				    </div>
				  </div>
				</div>

			</form>
		</div>
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/theme.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>

</body>
</html>







