<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErro.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var='email' value='<%=request.getParameter("email")%>' />
<c:set var='senha' value='<%=request.getParameter("senha")%>' />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Login</title>
</head>
<body class="bg-dark container mt-5" style="max-width:500px">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header text-center">Login</div>
			<div class="card-body">
				<form method="post" action="valida.jsp">
					<div class="form-group">
						<label for="email" class="form-label">E-mail</label> <br>
						<input type="email"	class="form-control" name="email" id="email" placeholder="Insira seu email" value=${ email }> <br>
					</div>
					<div class="form-group">
						<label for="senha" class="form-label">Senha</label> <br>
						<input type="password" class="form-control" name="senha" id="senha" placeholder="Insira sua senha" value=${ senha }> <br>
					</div>
					<div class="form-group text-center">
						<input type="submit" value="Autenticar" class="btn btn-primary">
					</div>
					<div class="form-group">
						<div class="text-center">
							<a href="#" class="d-block small mt-3" style="color:gray">Esqueci minha senha</a>
							<a href="#" class="d-block small" style="color:gray">Não é cadastrado? Crie sua conta aqui</a>
						</div>
					</div>	
				</form>
			</div>
		</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>