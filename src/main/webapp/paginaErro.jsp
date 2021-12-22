<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Erro</title>
</head>
<body>
	<c:set var="mensagemDeErro" value="${ exception.getMessage() }" />
	<c:set var="printStackTrace"
		value="${ exception.printStackTrace(new java.io.PrintWriter(out)) }" />
	<h1>Ocorreu o seguinte erro: ${ mensagemDeErro }</h1>
	<br>
	<p>${ printStackTrace }</p>
</body>
</html>