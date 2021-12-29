<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="paginaErro.jsp"
	import="pessoas.Participante"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exclusão de participante</title>
</head>
<body>
	<%
	String identificador = request.getParameter("id");
	Long id = Long.parseLong(identificador);
	Participante participante = new Participante();
	participante = participante.buscarRegistroPorId(id);

	if (participante.remover()) {
	%>
	<jsp:forward page="mensagemDeSucesso.jsp" />
	<%
	}
	%>
	<jsp:forward page="mensagemDeErro.jsp" />
</body>
</html>