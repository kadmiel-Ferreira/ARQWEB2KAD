<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="homeServlet">IFConnect - Conectando solu��es ao seus Problemas</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link"
					href="ordemServico">Ordem de Servi�o</a></li>
				<li class="nav-item"><a class="nav-link" href="cliente.jsp">Cliente</a>
				<li class="nav-item"><a class="nav-link" href="listarOrdens">Listar Ordens</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						${sessionScope.user.name} </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Minha Conta</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="logout">Sair</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>