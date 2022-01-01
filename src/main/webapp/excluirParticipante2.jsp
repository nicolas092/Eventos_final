<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pessoas.Participante"
	errorPage="paginaErro.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exclusão de participante</title>
</head>
<body>
	<jsp:useBean id="participanteBean" class="pessoas.Participante"
		scope="request" />
	<jsp:setProperty property="nome" name="participanteBean" />
	<c:if test="${ participanteBean.pesquisarPeloNome() != null }">
		<%
		Participante participante = participanteBean.pesquisarPeloNome();
		request.setAttribute("participante", participante);
		%>
		<jsp:forward page="excluirParticipante3.jsp" />
	</c:if>
	<p style="color:white">Nome de participante não encontrado</p>
	<jsp:include page="excluirParticipante1.jsp" />
</body>
</html>