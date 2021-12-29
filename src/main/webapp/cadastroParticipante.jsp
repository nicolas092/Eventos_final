<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErro.jsp" import="java.util.List" import="java.util.Arrays"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String email = request.getParameter("email");
List<String> emails = Arrays.asList(email);
request.setAttribute("emails", emails); // ou <c:set var="emails" value=<%=emails% /> 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validação do cadastro de participante</title>
</head>
<body>
	<jsp:useBean id="participanteBean" class="pessoas.Participante"
		scope="request" />
	<jsp:setProperty property="nome" param="nome" name="participanteBean" />
	<jsp:setProperty property="cpf" param="cpf" name="participanteBean" />
	<jsp:setProperty property="telefone" param="telefone"
		name="participanteBean" />
	<jsp:setProperty property="endereco" param="endereco"
		name="participanteBean" />
	<jsp:setProperty property="emails" value="${ emails }"
		name="participanteBean" />

	<c:if test="${ participanteBean.persistir() != 0 }">
		<jsp:forward page="mensagemDeSucesso.jsp" />
	</c:if>

	<jsp:forward page="mensagemDeErro.jsp" />
</body>
</html>