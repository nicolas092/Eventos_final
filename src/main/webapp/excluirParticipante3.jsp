<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="paginaErro.jsp" import="pessoas.Participante"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if (request.getParameter("id") != null) {
	Long id = Long.parseLong(request.getParameter("id"));
	Participante participante = new Participante();
%>
<c:set var="participante" value="<%= participante.buscarRegistroPorId(id) %>"/>	
<%}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exclusão de participante</title>
</head>
<body>
	<form action="excluirParticipante4.jsp" method="post">
		<input type="hidden" id="id" name="id" value="${ participante.getId() }">
		<label for="nome">Nome</label> <br>
		<input type="text" id="nome" name="nome" size="30" readonly value="${ participante.getNome() }" placeholder="Insira seu nome"> <br>
		<label for="cpf">CPF (apenas dígitos)</label> <br>
		<input type="text" id="cpf" name="cpf" size="30" readonly pattern="^[0-9]{11}$" value="${ participante.getCpf() }" placeholder="Insira seu cpf"> <br>
		<label for="telefone">Telefone com DDD (apenas dígitos)</label> <br>
		<input type="tel" id="telefone" name="telefone" readonly size="30" maxlength="11" value="${ participante.getTelefone() }" placeholder="Insira seu número de telefone"> <br>
		<label for="email">E-mail</label> <br>
		<input type="email" id="email" name="email" readonly size="30" value="${ participante.getEmails()[0] }" placeholder="Insira seu e-mail"> <br>
		<label for="endereco">Endereço</label> <br>
		<input type="text" id="endereco" name="endereco" size="50" readonly value="${ participante.getEndereco() }" placeholder="Insira seu endereço"> <br>
		<input type="submit" value="Confirmar exclusão">
	</form>
	<a href="menu.jsp">Voltar para o menu</a>
</body>
</html>