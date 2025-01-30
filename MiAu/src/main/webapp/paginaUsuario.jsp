<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Página do Usuário</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<!-- Estilos personalizados -->

<link href="css/styles.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #1f1c2c, #928DAB);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    .navbar {
        background: rgba(0, 0, 0, 0.8) !important;
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
    }

    .user-icon {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #4CAF50;
        cursor: pointer;
        transition: 0.3s;
    }

    .user-icon:hover {
        opacity: 0.8;
    }

    .info {
        margin: 10px 0;
        font-size: 18px;
        font-weight: 500;
    }

    .btn-custom {
        border-radius: 25px;
        padding: 10px;
        font-size: 16px;
        transition: 0.3s;
        width: 100%;
    }

    .btn-custom:hover {
        opacity: 0.8;
    }

    .logout-icon {
        margin-left: 5px;
    }
</style>
</head>
<body>

    <%@ include file="navbar.jsp"%>

    <c:choose>
        <c:when test="${empty sessionScope.user}">
            <div class="alert alert-danger text-center">Você ainda não está logado!</div>
        </c:when>

        <c:when test="${not empty sessionScope.user}">
            <div class="container">
                <div class="profile-container">
                    <label for="uploadIcon">
                        <img src="img/default-user.jpg" class="user-icon" id="userIcon" alt="Foto de Perfil">
                    </label>
                    <input type="file" id="uploadIcon">

                    <h2 class="mt-3">Olá, ${sessionScope.user.nome}!</h2>
                    
                    <p class="info"><i class="fa-solid fa-envelope"></i><span></span> Email: ${sessionScope.user.email}</p>

                    <c:choose>
                        <c:when test="${sessionScope.user.tipoUsuario == 'ONG'}">
                            <p class="info"><i class="fa-solid fa-paw"></i> Animais para adoção: <strong>5</strong></p>
                        </c:when>
                        <c:when test="${sessionScope.user.tipoUsuario == 'ADOTANTE'}">
                            <p class="info"><i class="fa-solid fa-heart"></i> Animais adotados: <strong>2</strong></p>
                        </c:when>
                    </c:choose>

                    <a href="editarPerfil.jsp" class="btn btn-primary btn-custom mt-3">
                        <i class="fa-solid fa-user-pen"></i> Editar Perfil
                    </a> 
                    
                    <a class="btn btn-danger btn-custom mt-2" href="ControllerServlet?action=logout">
                        <i class="fa-solid fa-right-from-bracket logout-icon"></i> Sair
                    </a>
                </div>
            </div>
        </c:when>
    </c:choose>

    <!-- Bootstrap Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/theme.js"></script>
    <!-- Script para Upload da Imagem -->
    <script>
        document.getElementById('uploadIcon').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('userIcon').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    </script>

</body>
</html>
