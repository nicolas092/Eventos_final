<%@page import="java.util.ArrayList" import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="paginaErro.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<c:out value="${6+8}" />
		<!-- pra que usar c:out se da pra escrever que nem na linha de baixo -->
		${ 6 + 8 }
	</h1>
	<br>
	<c:set var="salario" value="${2500}" />
	<span>SALARIO: ${salario}</span>

	<%
	List<String> lista = new ArrayList<>();
	lista.add("Alana");
	lista.add("Morgana");
	lista.add("Ashe");
	%>
	<c:set var="l" value="<%= lista %>" />
	<br>
	<c:out value='${ l[1] / 0 }' />
	<br>

	<c:if test="${ salario > 900 }">
		<span>R$${salario},00 é um bom salário</span>
	</c:if>

	<c:choose>
		<c:when test="${ salario < 1000 }">
			<p>${ salario } reais é um salário pequeno.</p>
		</c:when>
		<c:when test="${ salario < 2000 }">
			<p>${ salario } é um bom salário.</p>
		</c:when>
		<c:otherwise>
			<p>${ salario } reais é um ótimo salário.</p>
		</c:otherwise>
	</c:choose>

	<ul>
		<c:forEach var="i" items="${ l }">
			<li><c:out value="${ i }" /></li>
		</c:forEach>
	</ul>

	<ul>
		<c:forEach var="i" begin="${ 0 }" step="${ 10 }" end="${ 50 }">
			<li>${ i }</li>
		</c:forEach>
	</ul>
</body>
</html>




