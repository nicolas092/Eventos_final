<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="paginaErro.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Lista de Eventos</title>
</head>
<body class="bg-dark">
	<jsp:useBean id="eventoBean" class="eventos.Evento" scope="request" />
	<c:set var="listaDeEventos" value="<%=eventoBean.buscarTodos()%>" />
	<div class="container mx-auto mt-5">
		<table border="5" class="table bg-light table-striped">
			<thead>
				<tr>
					<th scope="col">Nome</th>
					<th scope="col">Data</th>
					<th scope="col">Local</th>
				</tr>
			</thead>
			<c:forEach var="evento" items="${ listaDeEventos }">
				<tr>
					<td>${ evento.getNome() }</td>
					<td>${ evento.getData() }</td>
					<td>${ evento.getLocal().getInstituicao() }</td>
				</tr>
			</c:forEach>
		</table>
		<a href="menu.jsp" class="container" style="color:white">Voltar para o menu</a>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>