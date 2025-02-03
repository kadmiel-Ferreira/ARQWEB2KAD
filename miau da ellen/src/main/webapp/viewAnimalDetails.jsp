<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    body {
        background: #191970 !important;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    .container {
        flex-grow: 1;
    }
    .animal-card {
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        background: #fff;
    }
    .animal-img {
        width: 100%;
        height: 300px;
        object-fit: cover;
        border-radius: 15px 15px 0 0;
    }
    .details-list p {
        margin-bottom: 8px;
        font-size: 18px;
    }
    .btn-adopt {
        font-size: 20px;
        padding: 12px;
        border-radius: 10px;
    }
</style>
<title>Detalhes do Pet</title>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card animal-card bg-dark">
                    <c:if test="${not empty animal.imagem}">
                        <img src="${animal.imagem}" class="animal-img" alt="Imagem de ${animal.nome}">
                    </c:if>
                    <div class="card-body text-center">
                        <h2 class="text-primary">${animal.nome}</h2>
                        <p class="text-muted">${animal.descricao}</p>
                        
                        <div class="details-list text-start mt-4">
                            <p><i class="fas fa-paw"></i> <strong>Espécie:</strong> ${animal.especie}</p>
                            <p><i class="fas fa-dna"></i> <strong>Raça:</strong> ${animal.raca}</p>
                            <p><i class="fas fa-birthday-cake"></i> <strong>Idade:</strong> ${animal.idade} anos</p>
                            <p><i class="fas fa-venus-mars"></i> <strong>Sexo:</strong> ${animal.sexo}</p>
                            <p><i class="fas fa-ruler-combined"></i> <strong>Porte:</strong> ${animal.porte}</p>
                            <p><i class="fas fa-check-circle"></i> <strong>Castrado:</strong> ${animal.castrado ? 'Sim' : 'Não'}</p>
                            <p><i class="fas fa-tag"></i> <strong>Status:</strong> <span class="badge ${animal.status == 'DISPONIVEL' ? 'bg-success' : 'bg-secondary'}">${animal.status}</span></p>
                        </div>
                        <c:choose>
					<c:when test="${animal.sexo == 'FEMEA'}">
						<a href="https://api.whatsapp.com/send?phone=${animal.telefone}" class="btn btn-success btn-adopt w-100 mt-3" target="_blank">
                            <i class="fab fa-whatsapp"></i> Quero Adotar a ${animal.nome}
                        </a>
					</c:when>
					<c:when test="${animal.sexo == 'MACHO'}">
						<a href="https://api.whatsapp.com/send?phone=${animal.telefone}" class="btn btn-success btn-adopt w-100 mt-3" target="_blank">
                            <i class="fab fa-whatsapp"></i> Quero Adotar o ${animal.nome}
                        </a>
					</c:when>
				</c:choose>
                        
                    </div>
                </div>
            </div>
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