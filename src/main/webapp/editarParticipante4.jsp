<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="paginaErro.jsp" import="java.util.List"
	import="java.util.Arrays" import="pessoas.Participante"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alteração de cadastro</title>
</head>
<body>
	<%
	String identificador = request.getParameter("id");
	Long id = Long.parseLong(identificador);
	Participante participante = new Participante();
	participante = participante.buscarRegistroPorId(id);

	participante.setNome(request.getParameter("nome"));
	participante.setCpf(request.getParameter("cpf"));
	participante.setTelefone(request.getParameter("telefone"));
	participante.setEndereco(request.getParameter("endereco"));
	List<String> emails = Arrays.asList(request.getParameter("email"));
	participante.setEmails(emails);
	if (participante.atualizar()) {
	%>
	<jsp:forward page="mensagemDeSucesso.jsp" />
	<%
	}
	%>
	<jsp:forward page="mensagemDeErro.jsp" />
</body>
</html>