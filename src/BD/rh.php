<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Recursos Humanos</h2>
		<p>
			Nessa tela, são exibidas as ocorrências referentes ao trabalho dos professores
			e funcionários. São exibidos: férias, licenças, advertências, afastamentos 
			remunerados e afastamentos não remunerados.
		</p>
		<h3>Professores</h3>
		<h4>Inserir novo professor:</h4>
		<form action="insereProfessor.php" method="GET" class="form-horizontal">
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
					<label for="carreira" class="control-label col-sm-2 text-right">Carreira</label>
					<div class="col-sm-5">
						<input class="form-control" type="text" name="carreira">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="nivel" class="control-label col-sm-2 text-right">Nível</label>
					<div class="col-sm-5">
						<input class="form-control" type="text" name="nivel">
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
				<button class="btn btn-default col-sm-offset-2" type="submit" name="InserirProfessor">Inserir Professor</button>
			</div>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th></th>
		        	<th>nome</th>
		        	<th>cpf</th>
		        	<th>carreira</th>
		        	<th>nivel</th>
		        	<th>unidade</th>
		        	<th>ocorrências</th>
		        	<th>alterar</th>
		        	<th>apagar</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<form action="detalheRH.php" method="get">
			    	<?php
			    		$professores = consultaTodosProfessores();
			    		while ($dados = mysqli_fetch_array($professores)) {
			    			echo "<tr>";
			    			echo "<td>".$dados['ID_Usuario']."<input type='hidden' name='id' value='".$dados['ID_Usuario']."'></td>";
			    			echo "<td>".$dados['nome']."<input type='hidden' name='nome' value='".$dados['nome']."'></td>";
			    			echo "<td>".$dados['cpf']."</td>";
			    			echo "<td>".$dados['carreira']."</td>";
			    			echo "<td>".$dados['nivel']."</td>";
			    			echo "<td>".$dados['ID_Unidade']."</td>";
			    			echo "<td><button type='submit' value='1' class='btn btn-default'>Ocorrências</button></td>";
			    			echo "<td><button type='button' value='1' class='btn btn-info'>Alterar</button></td>";
			    			echo "<td><button type='button' value='1' class='btn btn-danger'>Apagar</button></td>";
			    			echo "</tr>";
			    		}
			    	?>
		    	</form>
			</tbody>
		</table>

	    <h3>Funcionários</h3>
	    <h4>Inserir novo funcionário:</h4>
	    <form action="insereFuncionario.php" method="GET" class="form-horizontal">
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
					<label for="funcao" class="control-label col-sm-2 text-right">Função</label>
					<div class="col-sm-5">
						<input class="form-control" type="text" name="funcao">
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
				<button class="btn btn-default col-sm-offset-2" type="submit" name="InserirFuncionario">Inserir Funcionário</button>
			</div>
		</form>
	    <table class="table">
			<thead>
				<tr>
					<th></th>
		        	<th>nome</th>
		        	<th>cpf</th>
		        	<th>função</th>
		        	<th>unidade</th>
		        	<th>ocorrências</th>
		        	<th>alterar</th>
		        	<th>apagar</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<form action="detalheRH.php" method="get">
			    	<?php
			    		$funcionarios = consultaTodosFuncionarios();
			    		while ($dados = mysqli_fetch_array($funcionarios)) {
			    			echo "<tr>";
			    			echo "<td>".$dados['ID_Usuario']."<input type='hidden' name='id' value='".$dados['ID_Usuario']."'></td>";
			    			echo "<td>".$dados['nome']."<input type='hidden' name='nome' value='".$dados['nome']."'></td>";
			    			echo "<td>".$dados['cpf']."</td>";
			    			echo "<td>".$dados['Funcao']."</td>";
			    			echo "<td>".$dados['ID_Unidade']."</td>";
			    			echo "<td></td>";
			    			echo "<td><button type='submit' value='1' class='btn btn-default'>Ocorrências</button></td>";
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