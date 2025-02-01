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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            flex-grow: 1;
        }

        .animal-card {
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            overflow: hidden;
        }

        .animal-card:hover {
            transform: scale(1.05);
        }

        .animal-img {
            height: 250px;
            object-fit: cover;
        }

        .btn-adopt {
            border-radius: 20px;
            transition: 0.3s;
        }
    </style>
<title>Home - Miaudote</title>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <div class="container mt-5">
        <h2 class="text-center text-white mb-4">Encontre seu novo amigo 🐶🐱</h2>
        
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
                    <button type="submit" class="btn btn-light w-100" name="action" value="searchEspecies">Filtrar</button>
                </div>
            </div>
        </form>
        
        <div class="row">
            <c:forEach var="animal" items="${listaDeAnimais}">
                <div class="col-md-4 mb-4">
                    <div class="card animal-card">
                        <img src="${animal.imagem}" class="card-img-top animal-img" alt="${animal.nome}">
                        <div class="card-body text-center">
                            <h5 class="card-title">${animal.nome}</h5>
                            <p class="card-text"><strong>Espécie:</strong> ${animal.especie}</p>
                            <p class="card-text"><strong>Raça:</strong> ${animal.raca}</p>
                            <p class="card-text"><strong>Sexo:</strong> ${animal.sexo}</p>
                            <p class="card-text"><strong>Status:</strong> 
                                <span class="badge ${animal.status == 'DISPONIVEL' ? 'bg-success' : 'bg-secondary'}">${animal.status}</span>
                            </p>
                            <a href="ControllerServlet?action=ViewAnimalDetails&animal-id=${animal.id}" class="btn btn-primary btn-adopt w-100">Ver detalhes</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <c:if test="${fn:length(listaDeAnimais) == 0}">
            <div class="alert alert-light text-center" role="alert">Nenhum animal disponível para adoção.</div>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/home.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>
</body>
</html>