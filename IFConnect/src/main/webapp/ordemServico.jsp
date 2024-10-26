<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>IFConnect - Ordem de Serviço</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/errors.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<jsp:include page="navbar.jsp" />
    <div class="col-lg-6 offset-lg-3 col-sm-12">

        <c:choose>
            <c:when test="${ordemServico == null}">
                <h1 class="text-center">Cadastrar Ordem de Serviço</h1>
            </c:when>
            <c:otherwise>
                <h1 class="text-center">Editar Ordem de Serviço</h1>
            </c:otherwise>
        </c:choose>

        <!-- Formulário de Ordem de Serviço -->
        <form action="ordemServico" method="POST">
            
            <!-- Campo oculto para ID (0 para nova ordem) -->
            <input type="hidden" name="id" value="${ordemServico != null ? ordemServico.id : 0}">

				<!-- Seleção de Cliente -->
<div class="mb-2">
    <label for="cliente_id">Cliente*</label>
    <select id="cliente_id" name="cliente_id" class="form-control" required>
        <option value="">Selecione um cliente</option>
        
        <c:choose>
            
            <c:when test="${ordemServico == null}">
                <c:forEach var="cliente" items="${clientes}">
                    <option value="${cliente.codigo}">${cliente.nome}</option>
                </c:forEach>
            </c:when>
            
            
            <c:otherwise>
                <option value="${ordemServico.cliente.codigo}" selected>${ordemServico.cliente.nome}</option>
            </c:otherwise>
        </c:choose>
    </select>
</div>





				<!-- Seleção de Forma de Pagamento -->
            <div class="mb-2">
                <label for="forma_pagamento_id">Forma de Pagamento*</label>
                <select id="forma_pagamento_id" name="forma_pagamento_id" class="form-control" required>
                    <option value="">Selecione uma forma de pagamento</option>
                    <option value="1" ${ordemServico != null && ordemServico.formapagamento.id == 1 ? 'selected' : ''}>Dinheiro</option>
                    <option value="2" ${ordemServico != null && ordemServico.formapagamento.id == 2 ? 'selected' : ''}>Cartão de Crédito</option>
                    <option value="3" ${ordemServico != null && ordemServico.formapagamento.id == 3 ? 'selected' : ''}>Cartão de Débito</option>
                    <option value="4" ${ordemServico != null && ordemServico.formapagamento.id == 4 ? 'selected' : ''}>Transferência Bancária</option>
                </select>
            </div>

            <!-- Seleção de Status -->
            <div class="mb-2">
                <label for="status">Status*</label>
                <select id="status" name="status" class="form-control" required>
                    <option value="ABERTA" ${ordemServico != null && ordemServico.status == 'ABERTA' ? 'selected' : ''}>Aberta</option>
                    <option value="EM_ANDAMENTO" ${ordemServico != null && ordemServico.status == 'EM_ANDAMENTO' ? 'selected' : ''}>Em Andamento</option>
                    <option value="CONCLUIDA" ${ordemServico != null && ordemServico.status == 'CONCLUIDA' ? 'selected' : ''}>Concluída</option>
                    <option value="CANCELADA" ${ordemServico != null && ordemServico.status == 'CANCELADA' ? 'selected' : ''}>Cancelada</option>
                </select>
            </div>

            <!-- Campo de Descrição -->
            <div class="mb-2">
                <label for="descricao">Descrição*</label>
                <input type="text" name="descricao" id="descricao" class="form-control" required
                       value="${ordemServico != null ? ordemServico.descricao : ''}">
            </div>

            <!-- Campo de Data de Conclusão -->
            <div class="mb-2">
                <label for="dataConclusao">Data de Conclusão</label>
                <input type="date" id="dataConclusao" name="dataConclusao" class="form-control" 
                       value="${ordemServico != null && ordemServico.dataConclusao != null ? ordemServico.dataConclusao : ''}">
            </div>

            <div class="mb-2">
                <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
