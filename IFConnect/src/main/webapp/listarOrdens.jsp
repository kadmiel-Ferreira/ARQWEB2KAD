<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Ordens de Serviço</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
</head>
<body>
    <div class="container">
    <jsp:include page="navbar.jsp" />
        <h1 class="my-4">Ordens de Serviço</h1>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Cliente</th>
                    <th>Forma de Pagamento</th>
                    <th>Status</th>
                    <th>Descrição</th>
                    <th>Data Criação</th>
                    <th>Data Conclusão</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ordem" items="${ordens}">
                    <tr>
                        <td>${ordem.id}</td>
                        <td>${ordem.cliente.nome}</td>
                        <td>${ordem.formapagamento.descricao}</td>
                        <td>${ordem.status}</td>
                        <td>${ordem.descricao}</td>
                        <td>${ordem.dataCriacao}</td>
                        <td>
                            <c:choose>
                                <c:when test="${ordem.dataConclusao != null}">
                                    ${ordem.dataConclusao}
                                </c:when>
                                <c:otherwise>
                                    Não Concluída
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</body>
</html>
