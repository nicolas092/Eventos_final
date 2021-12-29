<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="paginaErro.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Lista de participantes</title>
</head>
<body>
	<jsp:useBean id="participanteBean" class="pessoas.Participante"
		scope="request" />
	<c:set var="listaDeParticipantes"
		value="<%=participanteBean.buscarTodos()%>" />
	<table border="5" style="border-collapse: collapse">
		<tr>
			<th>Nome</th>
			<th>CPF</th>
			<th>Telefone</th>
			<th>E-mail</th>
			<th>Endereço</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>
		<c:forEach var="participante" items="${ listaDeParticipantes }">
			<tr>
				<td>${ participante.getNome() }</td>
				<td>${ participante.getCpf() }</td>
				<td>${ participante.getTelefone() }</td>
				<c:set var="email" value="${ participante.getEmails()[0] }" />
				<td>${ email }</td>
				<td>${ participante.getEndereco() }</td>
				<td><a
					href="editarParticipante3.jsp?id=${ participante.getId() }">Editar</a></td>
				<td><a
					href="excluirParticipante3.jsp?id=${ participante.getId() }">Excluir</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="menu.jsp">Voltar para o menu</a>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>