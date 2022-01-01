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
<title>Login</title>
</head>
<body>
	<jsp:useBean id='usuarioBean' class='util.Usuario' scope='request' />
	<jsp:setProperty name='usuarioBean' property='*' />
	<c:if test='${ usuarioBean.autenticar() }'>
		<jsp:forward page='menu.jsp' />
	</c:if>
	<p style="color:white">E-mail e/ou senha incorretos</p>
	<jsp:include page='index.jsp'>
		<jsp:param value='${ email }' name='email' />
		<jsp:param value='${ senha }' name='senha' />
	</jsp:include>
</body>
</html>