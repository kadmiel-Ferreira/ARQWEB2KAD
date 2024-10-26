<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Ordens de Serviço</title>
    <link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
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
                    <th>Ações</th>           
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
						<td>
							<span data-bs-toggle="tooltip" data-bs-placement="top"
								title="Editar"> <a class="btn btn-primary"
									href="ordemServico?action=update&ordemServico-id=${ordem.id}">Editar
								</a>
							</span>
							<span data-bs-toggle="tooltip" data-bs-placement="top" title="Excluir">
        							<a type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" 
        								data-bs-id="${ordem.id}">Excluir
         							</a>
           					</span>
						</td>
					</tr>
                </c:forEach>
            </tbody>
        </table>
        
    </div>
    
    <!-- Modal -->
	<div class="modal" tabindex="-1" id="myModal">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Exclusão</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p>Tem certeza que deseja excluir a Ordem de Serviço?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		        <button type="button" id="delete" class="btn btn-danger">Excluir</button>
		      </div>
		    </div>
	  	</div>
	</div>

    <!-- Bootstrap JS -->
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/listarOrdem.js"></script>
</body>
</html>
