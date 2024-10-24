<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="pt-BR">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/errors.css" rel="stylesheet">
    <title>IFConnect - Página de Criação de Ordem de Serviço</title>
</head>
<body>
<div class="container">
	<jsp:include page="navbar.jsp" />
    <div class="col-lg-6 offset-lg-3 col-sm-12">

        <form action="ordemServico" method="POST">
            <h1 class="text-center">Cadastrar Ordem de Serviço</h1>

            <div class="mb-2">
                <label for="cliente_id">Cliente*</label> <select id="cliente_id" name="cliente_id" class="form-control" required>
						<option value="">Selecione um cliente</option>
						<c:forEach var="cliente" items="${clientes}">
							<option value="${cliente.codigo}">${cliente.nome}</option>
						</c:forEach>
					</select><br>
				</div>
			<div class="mb-2">
                <label for="forma_pagamento_id">Forma de Pagamento*</label>
                <select id="forma_pagamento_id" name="forma_pagamento_id" class="form-control" required>
                    <option value="1">Dinheiro</option>
                    <option value="2">Cartão de Crédito</option>
                    <option value="3">Cartão de Débito</option>
                    <option value="4">Transferência Bancária</option>
                </select><br>
            </div>
            <div class="mb-2">
                <label for="status">Status*</label>
                <select id="status" name="status" class="form-control" required>
                    <option value="ABERTA">Aberta</option>
                    <option value="EM_ANDAMENTO">Em Andamento</option>
                    <option value="CONCLUIDA">Concluída</option>
                    <option value="CANCELADA">Cancelada</option>
                </select><br>
            </div>

            <div class="mb-2">
                <label for="descricao">Descrição*</label>
                <input type="text" name="descricao" id="descricao" class="form-control"
                       required="required">
            </div>

            <div class="mb-2">
                <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        </form>
        
    </div>
</div>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="js/user-register.js"></script>
</body>
</html>
