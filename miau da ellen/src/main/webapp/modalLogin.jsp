<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnfn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header" style="background: linear-gradient(to right, #6a11cb, #2575fc);">
        <h2 class="modal-title text-center" id="exampleModalLabel">MiAuDote 🐶🐱</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" >
        <div class="login-container" >

		<c:if test="${param.notLogged == 'true'}">
			<div class="alert alert-danger">Você ainda não está logado!</div>
		</c:if>

		<c:choose>
			<c:when test="${result == 'registered'}">
				<div class="alert alert-success">Usuário cadastrado com
					sucesso. Faça o login.</div>
			</c:when>
			<c:when test="${result == 'loginError'}">
				<div class="alert alert-danger">E-mail e/ou senha inválidos.</div>
			</c:when>
		</c:choose>

		<form action="ControllerServlet" method="post" >
			<div class="input-group mb-3">
				<span class="input-group-text"> <i
					class="fa-solid fa-envelope"></i>
				</span><input type="email" name="email" id="email" placeholder="E-mail"
					required class="form-control" value="${cookie.email.value}">

			</div>

			<div class="input-group mb-3">
				<span class="input-group-text"> <i class="fa-solid fa-lock"></i>
				</span> <input type="password" name="password" id="password"
					placeholder="Senha" required class="form-control"> <span
					class="input-group-text toggle-password"> <i
					class="fa-solid fa-eye"></i>
				</span>
			</div>

			<div class="mb-3">
				<button type="submit" class="btn w-100" name="action" style="background: linear-gradient(to right, #6a11cb, #2575fc);"
					value="login">Login</button>
			</div>

			<div class="mb-3">
				<a href="cadastrarPessoa.jsp" class="btn btn-secondary w-100">Cadastrar</a>
			</div>
		</form>
	</div>
      </div>
    </div>
  </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let emailInput = document.getElementById("email");
        if (emailInput.value) {
            emailInput.value = decodeURIComponent(emailInput.value);
        }
    });
</script>