<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="paginaErro.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alteração de cadastro</title>
</head>
<body>
	<form action="editarParticipante2.jsp" method="post">
		<label for="nome">Insira o nome do participante que você deseja editar</label> <br>
		<input type="text" id="nome" name="nome" required> <br>
		<input type="submit" value="Enviar">
	</form>
	<a href="menu.jsp">Voltar para o menu</a>
</body>
</html>