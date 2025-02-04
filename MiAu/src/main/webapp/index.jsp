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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Home</title>
<title>Encontre Seu Novo AUmigo</title>

</head>
<body>
	<jsp:include page="navbar.jsp" />

	<div class="container-fluid text-center hero">
		<h1 class="display-3 fw-bold">Ajude um amigo de quatro patas a
			encontrar um lar amoroso!</h1>
		<p class="lead">Você pode se apaixonar agora por um pet ♡</p>
	</div>

	<div class="container-fluid mt-3 bg-section">
		<div class="row d-flex align-items-center">
			<div class="col-md-6 text-start" style="padding-left: 160px;">
				<h1 class="fw-bold">Me Leva pra Casa</h1>
				<p class="lead">Nós cuidamos deles. Agora deixe que eles cuidem
					de você.</p>
				<p class="lead">Ter um animal de estimação traz benefícios para
					a saúde física e mental. É uma troca de amor e carinho que faz bem
					pra todo mundo. Leve um para casa, cuide dele e deixe que ele cuide
					de você também.</p>
				<a href="ControllerServlet?action=ListAnimal"
					class="btn cta-button">Ver bichinhos disponíveis</a>
			</div>

			<div class="col-md-5 text-end" style="padding-right: 50px;">
				<img src="img/cachorro-index.png" alt="Cachorro para adoção"
					class="img-fluid rounded" width="350">
			</div>
		</div>
	</div>

	<div class="container-fluid hero text-center py-5 mt-3" id="sobreNos">
		<div class="mx-auto w-75 w-md-100 px-md-5">
			<h1 class="display-4 fw-bold mb-3">Sobre nós</h1>
			<p class="lead fs-5">O Miaudote é um programa de adoção
				responsável que busca encontrar novas famílias para animais
				desabrigados em Araraquara, São Paulo.</p>
			<p class="lead fs-5">Conectamos quem deseja adotar um pet com
				ONGs e protetores parceiros.</p>
			<p class="lead fs-5">Enquanto aguardam um lar, os animais recebem
				cuidados do nosso time de especialistas nas instalações de abrigo.</p>
		</div>
	</div>

	<div class="container-fluid text-center info-section">
		<h2 class="fw-bold">Como funciona?</h2>
		<div class="row mt-4">
			<div class="col-md-4 step">
				<i class="fas fa-search"></i>
				<h5>Busque um pet</h5>
				<p>Veja os animais disponíveis para adoção.</p>
			</div>
			<div class="col-md-4 step">
				<i class="fas fa-heart"></i>
				<h5>Escolha seu amigo</h5>
				<p>Conheça a história de cada um.</p>
			</div>
			<div class="col-md-4 step">
				<i class="fas fa-home"></i>
				<h5>Adote com amor</h5>
				<p>Entre em contato através do WhatsApp e preencha o formulário de interesse e leve para casa um novo membro da família.</p>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row my-3">
			<div class="col">
				<h4>Animais Adotados ao Todo</h4>
			</div>
		</div>
		<div class="row my-2">
			<div class="col-md-6 py-1">
				<div class="card">
					<h5 class="card-title">Animais por tipo</h5>
					<div class="card-body">
						<canvas id="chDonut1"></canvas>
					</div>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="modalLogin.jsp" />
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/home.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>
	<script type="text/javascript" src="js/statistics.js"></script>
	<script type="text/javascript" src="js/criarGaleria.js"></script>

</body>
</html>