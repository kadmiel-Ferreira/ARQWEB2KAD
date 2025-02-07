<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="pt-BR" data-bs-theme="dark">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seu Perfil</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="icon" href="uploads/paw-solid.svg" type="image/x-icon">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<!-- Estilos personalizados -->
<link href="css/styles.css" rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #1f1c2c, #928DAB);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	font-family: Arial, sans-serif;
}

.container {
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	padding-top: 70px; /* Para não ficar atrás da navbar */
}

.profile-container {
	background: rgba(255, 255, 255, 0.1);
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
	text-align: center;
	max-width: 450px;
	backdrop-filter: blur(10px);
	color: #fff;
	background-color: #191970;
}

.user-icon {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	object-fit: cover;
	border: 5px solid #4CAF50;
	cursor: pointer;
	transition: 0.3s;
	margin-bottom: 20px;
	padding: 10px;
	font-size: 80px;
}

.user-icon:hover {
	opacity: 0.8;
}

.info {
	margin: 10px 0;
	font-size: 18px;
	font-weight: 500;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.btn-custom {
	border-radius: 25px;
	padding: 10px;
	font-size: 16px;
	transition: 0.3s;
	width: 100%;
	margin-top: 15px;
}

.btn:hover {
	opacity: 0.8 !important;
}

.logout-icon {
	margin-left: 5px;
}

.icon-container {
	font-size: 50px;
	color: #4CAF50;
}

.profile-header {
	margin-bottom: 20px;
}
</style>

</head>
<body>

	<%@ include file="navbar.jsp"%>

	<c:choose>
		<c:when test="${empty sessionScope.user}">
			<div class="alert alert-danger text-center">Você ainda não está
				logado!</div>
		</c:when>

		<c:when test="${not empty sessionScope.user}">
			<div class="container">
				<div class="profile-container">

					<div class="profile-header">

						<i class="fa-solid fa-paw user-icon"></i>
					</div>

					<h2 class="mt-3">Olá, ${sessionScope.user.nome}!</h2>

					<p class="info">
						<i class="fa-solid fa-envelope"></i><span>Email:
							${sessionScope.user.email}</span>
					</p>
					<p class="info">
						<i class="fa-solid fa-phone"></i><span>Telefone:
							${sessionScope.user.telefone}</span>
					</p>
					<p class="info">
						<i class="fa-solid fa-map-marker-alt"></i><span>Endereço:
							${sessionScope.user.logradouro}, ${sessionScope.user.numero}</span>
					</p>

					<a href="cadastrarPessoa.jsp" class="btn btn-primary btn-custom">
						<i class="fa-solid fa-user-pen"></i> Editar Perfil
					</a> <a class="btn btn-danger btn-custom" onclick="deleteCookies()"
						href="ControllerServlet?action=logout"> <i
						class="fa-solid fa-right-from-bracket logout-icon"></i> Sair
					</a>
				</div>
			</div>
		</c:when>
	</c:choose>

	<div vw class="enabled">
		<div vw-access-button class="active"></div>
		<div vw-plugin-wrapper>
			<div vw-plugin-container></div>
		</div>
	</div>


	<script defer src="js/apiLibras.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- <script type="text/javascript" src="js/theme.js"></script> -->

</body>
</html>
