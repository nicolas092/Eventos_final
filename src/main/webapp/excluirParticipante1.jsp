<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="paginaErro.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Exclusão de Participante</title>
</head>
<body class="bg-dark container mt-5">
	<div class="card card-login mx-auto mt-5">
		<div class="card-header text-center">Exclusão de Cadastro de Participante</div>
		<div class="card-body">
			<form action="excluirParticipante2.jsp" method="post">
				<div class="form-group">
					<label class="form-label" for="nome">Insira o nome do participante que você deseja excluir</label> <br>
					<input class="form-control" type="text" id="nome" name="nome" required> <br>
				</div>
				<div class="form-group text-center">
					<input type="submit" value="Pesquisar" class="btn btn-primary"> <br>
				</div>
				<div class="form-group text-center">
					<a class="d-block small mt-3" href="menu.jsp" style="color:gray">Voltar para o menu</a>
				</div>
			</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>