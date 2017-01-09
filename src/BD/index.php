<?php
	include "header.html";
?>
<main>
	<div class="container">
		<h2 class="title">Página Inicial</h2>
		<p>Integrantes:</p>
		<div class="row">
			<div class="col-sm-4">
				Lucas Covre Delboni
			</div>
			<div class="col-sm-4">
				n° USP: 8516006
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				Renato Seiji Matsudo
			</div>
			<div class="col-sm-4">
				n° USP: 8516542
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				Ricardo Praxedes Alves dos Santos
			</div>
			<div class="col-sm-4">
				n° USP: 6470204
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				Pedro Toupitzen Specian
			</div>
			<div class="col-sm-4">
				n° USP: 8082640
			</div>
		</div>
		<h2 class="title">Sistemas</h2>
		<p>Clique nos links abaixo para acessar as telas do sistema:</p>
		<div class="row">
			<div class="col-sm-12">
				<a href="alunos.php">Alunos</a>
				<br>
				<a href="financeiro.php">Sistema Financeiro</a>
				<br>
				<a href="rh.php">Recursos Humanos</a>
				<br>
				<a href="projetos.php">Gerenciamento de Projetos</a>
				<br>
				<a href="bens.php">Gerenciamento de Bens</a>
				<br>
				<a href="unidades.php">Unidades</a>
				<br>
				<a href="cursos.php">Cursos</a>
				<br>
				<a href="atribuicoes.php">Atribuições de Professores</a>
			</div>
		</div>
		<h3>
			As consultas especiais foram usadas nas seguintes telas:
		</h3>
		<table class="table">
			<thead>
				<tr>
		        	<th>Consulta</th>
		        	<th>Local</th>
		     	</tr>
    		</thead>
		    <tbody>
				<tr>
					<td>F_1</td>
					<td><a href="atribuicoes.php">Atribuições de Professores</a></td>
				</tr>
				<tr>
					<td>F_2</td>
					<td><a href="cursos.php">Cursos</a>, no final da página</td>
				</tr>
				<tr>
					<td>G_1</td>
					<td><a href="bens.php">Gerenciamento de Bens</a>, no campo de busca</td>
				</tr>
				<tr>
					<td>G_2</td>
					<td>Tela de detalhes do aluno de graduação/pós-graduação</td>
				</tr>
				<tr>
					<td>G_3</td>
					<td><a href="rh.php">Recursos Humanos</a>, no final da página</td>
				</tr>
				<tr>
					<td>G_4</td>
					<td><a href="alunos.php">Alunos</a>, no começo da página</td>
				</tr>
			</tbody>
		</table>
	</div>
</main>
<?php
	include "footer.html";
?>