<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
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
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            background: #fff;
            cursor: pointer;
            transition: 0.3s;
        }
        .animal-card:hover {
            transform: scale(1.05);
        }
        .animal-img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 15px 15px 0 0;
            
        }
        .info-produto {
            display: none;
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            border-radius: 0 0 15px 15px;
        }
        .btn-adopt {
            font-size: 20px;
            padding: 12px;
            border-radius: 10px;
        }
        .details-list p {
            margin-bottom: 10px;
        }
    </style>
    <title>Miaudote</title>
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container mt-5">
        <h2 class="text-center text-white mb-4">Encontre seu novo amigo 🐶🐱</h2>

        <!-- Formulário de filtro por espécie -->
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

        <!-- Exibindo os cards dos animais -->
        <div class="row" id="gridContainer">
            <c:forEach var="animal" items="${listaDeAnimais}">
                <div class="col-md-4 mb-4">
                    <div class="card animal-card" data-animal-id="${animal.id}">
                    <c:if test="${not empty animal.imagem}">
                        <img src="${animal.imagem}" class="animal-img" alt="Imagem de ${animal.nome}">
                    </c:if>                      
                        <div class="info-produto">
                        	<br>
                            <h5 class="card-title">${animal.nome}</h5>
                            <p><i class="fas fa-note"></i> <strong>Descrição:</strong> ${animal.descricao}</p>
                            <p><i class="fas fa-paw"></i> <strong>Espécie:</strong> ${animal.especie}</p>
                            <p><i class="fas fa-dna"></i> <strong>Raça:</strong> ${animal.raca}</p>
                            <p><i class="fas fa-birthday-cake"></i> <strong>Idade:</strong> ${animal.idade} anos</p>
                            <p><i class="fas fa-venus-mars"></i> <strong>Sexo:</strong> ${animal.sexo}</p>
                            <p><i class="fas fa-ruler-combined"></i> <strong>Porte:</strong> ${animal.porte}</p>
                            <p><i class="fas fa-check-circle"></i> <strong>Castrado:</strong> ${animal.castrado ? 'Sim' : 'Não'}</p>
                            <p><i class="fas fa-tag"></i> <strong>Status:</strong> 
                                <span class="badge ${animal.status == 'DISPONIVEL' ? 'bg-success' : 'bg-secondary'}">${animal.status}</span>
                            </p>
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
            </c:forEach>

            <!-- Mensagem caso não haja animais -->
            <c:if test="${fn:length(listaDeAnimais) == 0}">
                <div class="alert alert-light text-center" role="alert">Nenhum animal disponível para adoção.</div>
            </c:if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/theme.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const galleryContainer = document.getElementById("gridContainer");

            // Função para alternar entre exibir informações e esconder
            function toggleDetails(event) {
                const card = event.currentTarget;
                const info = card.querySelector(".info-produto");

                if (info.style.display === "block") {
                    info.style.display = "none";
                    card.querySelector("img").style.transform = "scale(1)"; // Restaura a escala da imagem
                } else {
                    info.style.display = "block";
                    card.querySelector("img").style.transform = "scale(1.1)"; // Aumenta a imagem ao clicar
                }
            }

            // Adiciona o evento de clique em cada card
            const cards = galleryContainer.getElementsByClassName("animal-card");
            Array.from(cards).forEach(card => {
                card.addEventListener("click", toggleDetails);
            });
        });
    </script>
</body>
</html>
