<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErro.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Participante</title>
</head>
<body>
	<form action="cadastroParticipante.jsp" method="post">
		<label for="nome">Nome</label> <br>
		<input type="text" id="nome" name="nome" size="30" checked="checked" placeholder="Insira seu nome"> <br>
		<label for="cpf">CPF</label> <br>
		<input type="text" id="cpf" name="cpf" size="30" checked="checked" minlength="11" maxlength="11" placeholder="Insira seu cpf (apenas dígitos)"> <br>
		<label for="telefone">Telefone (com DDD)</label> <br>
		<input type="tel" id="telefone" name="telefone" size="30" checked="checked" minlength="10" maxlength="11" placeholder="Insira seu número de telefone (apenas dígitos) com DDD"> <br>
		<label for="email">E-mail</label> <br>
		<input type="email" id="email" name="email" size="30" checked="checked" placeholder="Insira seu e-mail"> <br>
		<label for="endereco">Endereço</label> <br>
		<input type="text" id="endereco" name="endereco" size="50" checked="checked" placeholder="Insira seu endereço"> <br>
		<input type="reset" value="Limpar">
		<input type="submit" value="Cadastrar">
	</form>
	<a href="menu.jsp">Voltar para o menu</a>
</body>
</html>