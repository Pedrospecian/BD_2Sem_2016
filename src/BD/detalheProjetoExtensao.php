<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php 
		//var_dump($_POST);
		if(isset($_POST['update'])){ ?>
			<form action="atualizaProjetoExtensao.php" method="GET" class="form-horizontal">
				<input type="hidden" name="idProjeto-alt" value="<?php echo $_POST['idProjeto']; ?>"/>
				<div class="row">
					<div class="form-group">
						<label for="objetivo-alt" class="control-label col-sm-2 text-right">Objetivo</label>
						<div class="col-sm-5"><input class="form-control" type="text" name="objetivo-alt" value="<?php echo $_POST['objetivo']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="descricao-alt" class="control-label col-sm-2 text-right">Descrição</label>
						<div class="col-sm-5"><input class="form-control" type="text" name="descricao-alt" value="<?php echo $_POST['descricao']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="orcamento-alt" class="control-label col-sm-2 text-right">Orçamento</label>
						<div class="col-sm-5"><input class="form-control" type="number" name="orcamento-alt" value="<?php echo $_POST['orcamento']; ?>"/></div>
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
										if($dados['ID_Financiador']==$_POST['idFinanciador']) {
											echo "<option selected value=".$dados['ID_Financiador'].">".$dados['nome']."</option>";
										}
										else{
											echo "<option value=".$dados['ID_Financiador'].">".$dados['nome']."</option>";
										}
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
										if($dados['ID_Usuario']==$_POST['idAluno']) {
											echo "<option selected value=".$dados['ID_Usuario'].">".$dados['nome']."</option>";
										}
										else{
											echo "<option value=".$dados['ID_Usuario'].">".$dados['nome']."</option>";
										}
										
							        }
								?>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="bolsa-alt" class="control-label col-sm-2 text-right">Bolsa</label>
						<div class="col-sm-5"><input class="form-control" type="number" name="bolsa-alt" value="<?php echo $_POST['bolsa']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="servidor" class="control-label col-sm-2 text-right">Professor/Funcionário Coordenador</label>
						<div class="col-sm-5">
							<select class="form-control" name="servidor">
								<option value="">--</option>
								<?php
									$professores = consultaServidores();
									while ($dados = mysqli_fetch_array($professores)) {
									if($dados['ID_Usuario']==$_POST['coordenador']) {
										echo "<option selected value=".$dados['ID_Usuario'].">".$dados['nome']."</option>";
									}
										echo "<option value=".$dados['ID_Usuario'].">".$dados['nome']."</option>";
							        }
								?>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="data-inicio" class="control-label col-sm-2 text-right">Data de inicio</label>
						<div class="col-sm-5"><input class="form-control" type="date" name="data-inicio" value="<?php echo $_POST['dataInicio']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="data-fim" class="control-label col-sm-2 text-right">Data de termino</label>
						<div class="col-sm-5"><input class="form-control" type="date" name="data-fim" value="<?php echo $_POST['dataTermino']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<button type="submit" class="btn btn-default col-sm-3 col-sm-offset-1">Alterar projeto de pesquisa</button>
					</div>
				</div>
			</form>
		<?php }
			if(isset($_POST['delete'])){
				//echo "deleta projeto de extensao";
				deletaExtensao($_POST['idProjeto']);
					echo "Projeto de extensão deletado com sucesso!";
				echo '<br><a href="projetos.php">Voltar</a>';
			}
		
		if(isset($_POST['calendario'])) { ?>		  	
		 	<h1>Atividades desse projeto de extensao</h1>
			<table class="table">
				<thead>
					<tr>
			        	<th>Localização</th>
			        	<th>Data</th>
			     	</tr>
				</thead>
			    <tbody>
			    	<?php
			    		$atividades = consultaAtividades($_POST['idProjeto']);
			    		while ($dados = mysqli_fetch_array($atividades)) {
			    			echo "<tr>";
			    			echo "<td>".$dados['Localizacao']."</td>";
			    			echo "<td>".$dados['Data_Atividade']."</td>";
			    			echo "</tr>";
			    		}
			    	?>
				</tbody>
			</table>

		<?php } ?>

	</div>
	
</main>
<?php 
	include "footer.html"; 
?>