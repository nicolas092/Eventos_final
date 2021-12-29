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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Login</title>
</head>
<body>
	<form method="post" action="valida.jsp">
		<label for="email">E-mail:</label> <br> <input type="email"
			name="email" id="email" placeholder="Insira seu email nesse campo"
			value=${ email }> <br> <label for="senha">Senha:</label>
		<br> <input type="password" name="senha" id="senha"
			placeholder="Insira sua senha nesse campo" value=${ senha }>
		<br> <input type="submit" value="Autenticar">
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>