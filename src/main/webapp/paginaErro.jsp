<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true"%>
<c:set var="mensagemDeErro" value="<%=exception.getMessage()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Erro</title>
</head>
<body>
	<h1>
		Ocorreu o seguinte erro:
		<c:out value="${ mensagemDeErro }" />
	</h1>
	<br>
	<p>
		<%
		exception.printStackTrace(new java.io.PrintWriter(out));
		%>
	</p>
</body>
</html>