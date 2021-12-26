<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErro.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<jsp:useBean id="usuarioBean" class="util.Usuario" scope="request" />
	<jsp:setProperty name="usuarioBean" property="*" />
	<c:if test="${ usuarioBean.autenticar() }">
		<jsp:forward page="inicio.jsp" />
	</c:if>
	<h1>
		<c:out value="E-mail ou senha incorretos" />
	</h1>
	<jsp:include page="index.html" />
</body>
</html>