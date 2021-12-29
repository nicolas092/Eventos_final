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
		<p>Campos com asterisco são obrigatórios</p>
		<label for="nome">Nome*</label> <br>
		<input type="text" id="nome" name="nome" size="30" required placeholder="Insira seu nome"> <br>
		<label for="cpf">CPF*</label> <br>
		<input type="text" id="cpf" name="cpf" size="30" required pattern="^[0-9]{11}$" placeholder="Insira seu cpf (apenas dígitos)"> <br>
		<label for="telefone">Telefone (com DDD)</label> <br>
		<input type="tel" id="telefone" name="telefone" size="30" maxlength="11" placeholder="Insira seu número de telefone (apenas dígitos) com DDD"> <br>
		<label for="email">E-mail</label> <br>
		<input type="email" id="email" name="email" size="30" placeholder="Insira seu e-mail"> <br>
		<label for="endereco">Endereço*</label> <br>
		<input type="text" id="endereco" name="endereco" size="50" required placeholder="Insira seu endereço"> <br>
		<input type="reset" value="Limpar">
		<input type="submit" value="Cadastrar">
	</form>
	<a href="menu.jsp">Voltar para o menu</a>
</body>
</html>