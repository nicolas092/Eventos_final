<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="paginaErro.jsp" import="java.util.List"
	import="eventos.Evento"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Eventos</title>
</head>
<body>
	<jsp:useBean id="eventoBean" class="eventos.Evento" scope="request" />
	<c:set var="eventos" value="<%=eventoBean.buscarTodos()%>" />
	<table border="5" style="border-collapse: collapse">
		<tr>
			<th>Nome</th>
			<th>Data</th>
			<th>Local</th>
		</tr>
		<c:forEach var="evento" items="${ eventos }">
			<tr>
				<td>${ evento.getNome() }</td>
				<td>${ evento.getData() }</td>
				<td>${ evento.getLocal().getInstituicao() }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="menu.jsp">Voltar para o menu</a>
</body>
</html>