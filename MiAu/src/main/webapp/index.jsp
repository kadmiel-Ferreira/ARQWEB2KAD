<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<title>Home</title>
<title>Miaudote - Encontre Seu Novo Amigo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }
        .hero {
            text-align: center;
            padding: 100px 20px;
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .cta-button {
            font-size: 1.5rem;
            padding: 15px 30px;
            border-radius: 30px;
            transition: transform 0.3s, background-color 0.3s;
        }
        .cta-button:hover {
            transform: scale(1.1);
            background-color: #ffcc00 !important;
        }
        .info-section {
            padding: 50px 20px;
            animation: slideUp 1s ease-in-out;
        }
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .step {
            text-align: center;
            padding: 30px;
        }
        .step i {
            font-size: 3rem;
            color: #ffcc00;
            transition: transform 0.3s;
        }
        .step:hover i {
            transform: rotate(10deg) scale(1.2);
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <div class="container-fluid text-center hero">
        <h1 class="display-3 fw-bold">Bem-vindo ao Miaudote 🐾</h1>
        <p class="lead">Ajude um amigo de quatro patas a encontrar um lar amoroso!</p>
        
        <a href="ControllerServlet?action=ListAnimal" class="btn btn-warning cta-button">Ver animais disponíveis</a>
    </div>

    <div class="container text-center info-section">
        <h2 class="fw-bold">Como funciona?</h2>
        <div class="row mt-4">
            <div class="col-md-4 step">
                <i class="fas fa-search"></i>
                <h5>1. Explore os pets</h5>
                <p>Veja os animais disponíveis para adoção.</p>
            </div>
            <div class="col-md-4 step">
                <i class="fas fa-heart"></i>
                <h5>2. Escolha seu amigo</h5>
                <p>Conheça a história de cada um.</p>
            </div>
            <div class="col-md-4 step">
                <i class="fas fa-home"></i>
                <h5>3. Adote com amor</h5>
                <p>Leve para casa um novo membro da família.</p>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/home.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>
</body>
</html>
