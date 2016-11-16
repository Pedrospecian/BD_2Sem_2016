<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Projetos</h2>
		<p>
			Nessa tela é possível cadastrar projetos de pesquisa ou de extensão. De 
			cada projeto são listados objetivos, descrição, orçamento, atividades etc.
			<br>
			É possível, também, cadastrar relatórios sobre a finalização dos projetos.
		</p>
		<h3>
			Cadastrar projeto de pesquisa
		</h3>
		<form action="inserePesquisa.php" method="get" class="form-horizontal">			
			<div class="row">
				<div class="form-group">
					<label for="objetivo" class="control-label col-sm-2 text-right">Objetivo</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="objetivo"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="descricao" class="control-label col-sm-2 text-right">Descrição</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="descricao"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="orcamento" class="control-label col-sm-2 text-right">Orçamento</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="orcamento"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="atividade" class="control-label col-sm-2 text-right">Atividade</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="atividade"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="idFinanciador" class="control-label col-sm-2 text-right">Financiador</label>
					<div class="col-sm-5">
						<select class="form-control" name="idFinanciador">
							<option value="">--</option>
							<?php
								$financiadores = consultaFinanciadores();
								while ($dados = mysqli_fetch_array($financiadores)) {
									//<option value="volvo">Volvo</option>
									echo "<option value=".$dados['ID_Financiador'].">".$dados['nome']."</option>";
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="idAluno" class="control-label col-sm-2 text-right">Aluno</label>
					<div class="col-sm-5">
						<select class="form-control" name="idAluno">
							<option value="">--</option>
							<?php
								$alunos = consultaTodosAlunos();
								while ($dados = mysqli_fetch_array($alunos)) {
									//<option value="volvo">Volvo</option>
									echo "<option value=".$dados['ID_Usuario'].">".$dados['nome']."</option>";
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="bolsa" class="control-label col-sm-2 text-right">Bolsa</label>
					<div class="col-sm-5"><input class="form-control" type="number" name="bolsa"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="professor" class="control-label col-sm-2 text-right">Professor Coordenador</label>
					<div class="col-sm-5">
						<select class="form-control" name="professor">
							<option value="">--</option>
							<?php
								$professores = consultaTodosProfessores();
								while ($dados = mysqli_fetch_array($professores)) {
									//<option value="volvo">Volvo</option>
									echo "<option value=".$dados['ID_Usuario'].">".$dados['nome']."</option>";
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<button type="submit" class="btn btn-default col-sm-3 col-sm-offset-1">Criar projeto de pesquisa</button>
				</div>
			</div>
		
		</form>
		<h3>
			Cadastrar projeto de extensão
		</h3>
		<form action="insereExtensao.php" class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<label for="objetivo" class="control-label col-sm-2 text-right">Objetivo</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="objetivo"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="descricao" class="control-label col-sm-2 text-right">Descrição</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="descricao"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="orcamento" class="control-label col-sm-2 text-right">Orçamento</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="orcamento"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="atividade" class="control-label col-sm-2 text-right">Atividade</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="atividade"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="idFinanciador" class="control-label col-sm-2 text-right">Financiador</label>
					<div class="col-sm-5">
						<select class="form-control" name="idFinanciador">
							<option value="">--</option>
							<?php
								$financiadores = consultaFinanciadores();
								while ($dados = mysqli_fetch_array($financiadores)) {
									//<option value="volvo">Volvo</option>
									echo "<option value=".$dados['ID_Financiador'].">".$dados['nome']."</option>";
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="idAluno" class="control-label col-sm-2 text-right">Aluno</label>
					<div class="col-sm-5">
						<select class="form-control" name="idAluno">
							<option value="">--</option>
							<?php
								$alunos = consultaTodosAlunos();
								while ($dados = mysqli_fetch_array($alunos)) {
									echo "<option value=".$dados['ID_Usuario'].">".$dados['nome']."</option>";
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="bolsa" class="control-label col-sm-2 text-right">Bolsa</label>
					<div class="col-sm-5"><input class="form-control" type="number" name="bolsa"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="professor" class="control-label col-sm-2 text-right">Professor Coordenador</label>
					<div class="col-sm-5">
						<select class="form-control" name="professor">
							<option value="">--</option>
							<?php
								$professores = consultaTodosProfessores();
								while ($dados = mysqli_fetch_array($professores)) {
									//<option value="volvo">Volvo</option>
									echo "<option value=".$dados['ID_Usuario'].">".$dados['nome']."</option>";
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<button type="submit" class="btn btn-default col-sm-3 col-sm-offset-1">Criar projeto de pesquisa</button>
				</div>
			</div>
		</form>
		<h3>Projetos de pesquisa</h3>
		<table class="table">
			<thead>
				<tr>
		        	<th>Objetivo</th>
		        	<th>Orçamento</th>
		        	<th>Atividade</th>
		        	<th>Fiananciador</th>
		        	<th>Aluno</th>
		        	<th>Professor</th>
		        	<th>alterar</th>
		        	<th>apagar</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$alunos = consultaProjetoPesquisa();
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<form action='detalheProjetoPesquisa.php' method='post'>";
		    			echo "<tr>";
		    			echo "<td>".$dados['objetivo']."</td>";
		    			echo "<td>".$dados['orcamento']."</td>";
		    			echo "<td>".$dados['atividade']."</td>";
		    			echo "<td>".$dados['nome']."</td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td><button type='submit' value='update' name='update' class='btn btn-info'>Alterar</button></td>";
			    		echo "<td><button type='submit' value='delete' name='delete' class='btn btn-danger'>Apagar</button></td>";
		    			echo "</tr>";
		    			echo "</form>";
		    		}
		    	?>
			</tbody>
		</table>
		<h3>Projetos de extensão</h3>
		<table class="table">
			<thead>
				<tr>
		        	<th>Objetivo</th>
		        	<th>Orçamento</th>
		        	<th>Atividade</th>
		        	<th>Fiananciador</th>
		        	<th>Aluno</th>
		        	<th>Calendário</th>
		        	<th>alterar</th>
		        	<th>apagar</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$alunos = consultaProjetoExtensao();
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<form action='detalheProjetoExtensao.php' method='post'>";
		    			echo "<tr>";
		    			echo "<td>".$dados['objetivo']."</td>";
		    			echo "<td>".$dados['orcamento']."</td>";
		    			echo "<td>".$dados['atividade']."</td>";
		    			echo "<td>".$dados['nome']."</td>";
		    			echo "<td></td>";
		    			echo "<td><button type='submit' value='calendario' name='calendario' class='btn btn-default'>Calendário</button></td>";
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