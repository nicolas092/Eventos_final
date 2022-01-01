<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="paginaErro.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Cadastro de Participante</title>
</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header text-center">Cadastro de Participante</div>
			<div class="card-body">
				<form action="cadastroParticipante.jsp" method="post">
					<p>Campos com asterisco são obrigatórios</p>
					<div class="form-group">
						<label class="form-label" for="nome">Nome*</label> <br>
						<input class="form-control" type="text" id="nome" name="nome" size="40" required placeholder="Insira seu nome"> <br>
					</div>
					<div class="form-group">
						<label class="form-label" for="cpf">CPF*</label> <br>
						<input class="form-control" type="text" id="cpf" name="cpf" size="40" required pattern="^[0-9]{11}$" placeholder="Insira seu cpf (apenas dígitos)"> <br>
					</div>
					<div class="form-group">
						<label class="form-label" for="telefone">Telefone (com DDD)</label> <br>
						<input class="form-control" type="tel" id="telefone" name="telefone" size="40" maxlength="11" placeholder="Insira seu número de telefone (apenas dígitos) com DDD"> <br>
					</div>
					<div class="form-group">
						<label class="form-label" for="email">E-mail</label> <br>
						<input class="form-control" type="email" id="email" name="email" size="40" placeholder="Insira seu e-mail"> <br>
					</div>
					<div class="form-group">
						<label class="form-label" for="endereco">Endereço*</label> <br>
						<input class="form-control" type="text" id="endereco" name="endereco" size="50" required placeholder="Insira seu endereço"> <br>
					</div>
					<div class="form-group text-center">
						<input type="reset" value="Limpar" class="btn btn-primary">
						<input type="submit" value="Cadastrar" class="btn btn-primary"> <br>
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