<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Pós-Graduação</h2>
		<p>
			Nessa tela é possível gerenciar os assuntos referentes aos alunos de
			diferentes tipos de pós-graduação, como notas e frequência obtidas em 
			disciplinas, bolsas que o aluno recebe durante o período em que está na 
			universidade e datas finais para cumprimento de etapas importantes de seu
			curso (qualificação, para mestrado e doutorado, e defesa de trabalho final
			para todos os casos).
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
								$unidades = consultaCursosPos();
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
									echo "<option value=".$dados['ID_Unidade'].">".$dados['Nome_Unidade']."</option>";
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
		        	<th>data nascimento</th>
		        	<th>unidade</th>
		        	<th>detalhes</th>
		        	<th>alterar</th>
		        	<th>apagar</th>
		     	</tr>
    		</thead>
		    <tbody>		    	
		    	<?php
		    		$alunos = consultaAlunosPos();
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<form action='detalheAlunoPos.php' method='post'>";
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_Usuario']."<input type='hidden' name='idAluno' value='".$dados['ID_Usuario']."'></td>";
		    			echo "<td>".$dados['nome']."<input type='hidden' name='nomeAluno' value='".$dados['nome']."'></td>";
		    			echo "<td>".$dados['cpf']."<input type='hidden' name='cpfAluno' value='".$dados['cpf']."'></td>";
		    			echo "<td>".$dados['data_de_nascimento']."<input type='hidden' name='dataNasc' value='".$dados['data_de_nascimento']."'></td>";
		    			echo "<td>".$dados['ID_Unidade']."<input type='hidden' name='unidade' value='".$dados['ID_Unidade']."'></td>";
		    			echo "<td><button type='submit' value='detalhes' name='detalhes' class='btn btn-default'>Detalhes</button></td>";
		    			echo "<td><button type='submit' value='update' name='update' class='btn btn-info'>Alterar</button></td>";
		    			echo "<td><button type='submit' value='delete' name='delete' class='btn btn-danger'>Apagar</button></td>";
		    			echo "</tr>";
		    			echo "</form>";
		    		}
		    	?>		    	
			</tbody>
		</table>
	</div>
</main>
<?php 
	include "footer.html"; 
?>