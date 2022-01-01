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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Alteração de Cadastro</title>
</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header text-center">Alteração de Cadastro de Participante</div>
			<div class="card-body">
				<form action="editarParticipante4.jsp" method="post">
					<input type="hidden" id="id" name="id" value="${ participante.getId() }">
					<div class="form-group">
						<label class="form-label" for="nome">Nome</label> <br>
						<input class="form-control" type="text" id="nome" name="nome" size="30" required value="${ participante.getNome() }" placeholder="Insira seu nome"> <br>
					</div>
					<div class="form-group">
						<label class="form-label" for="cpf">CPF (apenas dígitos)</label> <br>
						<input class="form-control" type="text" id="cpf" name="cpf" size="30" required pattern="^[0-9]{11}$" value="${ participante.getCpf() }" placeholder="Insira seu cpf"> <br>
					</div>
					<div class="form-group">
						<label class="form-label" for="telefone">Telefone com DDD (apenas dígitos)</label> <br>
						<input class="form-control" type="tel" id="telefone" name="telefone" size="30" maxlength="11" value="${ participante.getTelefone() }" placeholder="Insira seu número de telefone"> <br>
					</div>
					<div class="form-group">
						<label class="form-label" for="email">E-mail</label> <br>
						<input class="form-control" type="email" id="email" name="email" size="30" value="${ participante.getEmails()[0] }" placeholder="Insira seu e-mail"> <br>
					</div>
					<div class="form-group">
						<label class="form-label" for="endereco">Endereço</label> <br>
						<input class="form-control" type="text" id="endereco" name="endereco" size="50" required value="${ participante.getEndereco() }" placeholder="Insira seu endereço"> <br>
					</div>
					<div class="form-group text-center">
						<input type="submit" value="Atualizar cadastro" class="btn btn-primary">
					</div>
					<div class="form-group text-center">
						<a class="d-block small mt-3" href="menu.jsp" style="color:gray">Voltar para o menu</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>