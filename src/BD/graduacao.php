<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Graduação</h2>
		<p>
			Nessa tela é possível gerenciar os assuntos referentes aos alunos da
			graduação, como notas e frequência obtidas em disciplinas e bolsas que o
			aluno recebe durante o período em que está na universidade.
		</p>
		<h3>Inserir novo aluno:</h3>
		<form action="insereAluno.php" method="GET" class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<label for="nome" class="control-label col-sm-2 text-right">Nome</label>
					<div class="col-sm-5">
						<input class="form-control" type="text" name="nome">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="cpf" class="control-label col-sm-2 text-right">CPF</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="cpf"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="data-nascimento" class="control-label col-sm-2 text-right">Data de Nascimento</label>
					<div class="col-sm-5"><input class="form-control" type="date" name="data-nascimento"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="curso" class="control-label col-sm-2 text-right">Curso</label>
					<div class="col-sm-5">
						<select class="form-control" name="curso">
							<option value="">--</option>
							<?php
								$unidades = consultaCursosGraduacao();
								while ($dados = mysqli_fetch_array($unidades)) {
									echo "<option value=".$dados['Codigo'].">".$dados['Nome']."</option>";
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="unidade" class="control-label col-sm-2 text-right">Unidade</label>
					<div class="col-sm-5">
						<select class="form-control" name="unidade">
							<option value="">--</option>
							<?php
								$unidades = consultaUnidades();
								while ($dados = mysqli_fetch_array($unidades)) {
									echo "<option value=".$dados['ID_Unidade'].">".$dados['nome']."</option>";
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<button class="btn btn-default col-sm-offset-2" type="submit" name="InserirAluno">Inserir Aluno</button>
			</div>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th></th>
		        	<th>nome</th>
		        	<th>cpf</th>
		        	<th>detalhes</th>
		        	<th>alterar</th>
		        	<th>apagar</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<form action="detalheAlunoGraduacao.php" method="get">
			    	<?php
			    		$alunos = consultaAlunosGraduacao();
			    		while ($dados = mysqli_fetch_array($alunos)) {
			    			echo "<tr>";
			    			echo "<td>".$dados['ID_Usuario']."<input type='hidden' name='idAluno' value='".$dados['ID_Usuario']."'></td>";
			    			echo "<td>".$dados['nome']."<input type='hidden' name='nomeAluno' value='".$dados['nome']."'></td>";
			    			echo "<td>".$dados['cpf']."</td>";
			    			echo "<td><button type='submit' value='1' class='btn btn-default'>Detalhes</button></td>";
			    			echo "<td><button type='button' value='1' class='btn btn-info'>Alterar</button></td>";
			    			echo "<td><button type='button' value='1' class='btn btn-danger'>Apagar</button></td>";
			    			echo "</tr>";
			    		}
			    	?>
		    	</form>
			</tbody>
		</table>
	</div>
</main>
<?php 
	include "footer.html"; 
?>