<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php 
		var_dump($_GET);
		if(isset($_GET['update'])){ ?>
			atualiza dados de projeto de extensao
			<form action="atualizaProjetoExtensao.php" method="GET" class="form-horizontal">
				<input type="hidden" name="idProjeto-alt" value="<?php echo $_GET['idProjeto']; ?>"/>
				<div class="row">
					<div class="form-group">
						<label for="objetivo-alt" class="control-label col-sm-2 text-right">Objetivo</label>
						<div class="col-sm-5"><input class="form-control" type="text" name="objetivo-alt" value="<?php echo $_GET['objetivo']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="descricao-alt" class="control-label col-sm-2 text-right">Descrição</label>
						<div class="col-sm-5"><input class="form-control" type="text" name="descricao-alt" value="<?php echo $_GET['descricao']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="orcamento-alt" class="control-label col-sm-2 text-right">Orçamento</label>
						<div class="col-sm-5"><input class="form-control" type="number" name="orcamento-alt" value="<?php echo $_GET['orcamento']; ?>"/></div>
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
										if($dados['ID_Financiador']==$_GET['idFinanciador']) {
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
										if($dados['ID_Usuario']==$_GET['idAluno']) {
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
						<div class="col-sm-5"><input class="form-control" type="number" name="bolsa-alt" value="<?php echo $_GET['bolsa']; ?>"/></div>
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
									if($dados['ID_Usuario']==$_GET['coordenador']) {
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
						<div class="col-sm-5"><input class="form-control" type="date" name="data-inicio" value="<?php echo $_GET['dataInicio']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="data-fim" class="control-label col-sm-2 text-right">Data de termino</label>
						<div class="col-sm-5"><input class="form-control" type="date" name="data-fim" value="<?php echo $_GET['dataTermino']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<button type="submit" class="btn btn-default col-sm-3 col-sm-offset-1">Alterar projeto de pesquisa</button>
					</div>
				</div>
			</form>
		<?php }
			if(isset($_GET['delete'])){
				echo "deleta projeto de extensao";
				deletaExtensao($_GET['idProjeto']);
			}
			if($_GET['localizacao']){
				insereAtividade($_GET['idProjeto'], $_GET['data'], $_GET['localizacao']);
			}
		
		?>
	</div>
	
	<h1>Adicionar atividade</h1>
 	<form action="#" method="get" class="form-horizontal">			
 		<div class="row">
 			<input type="hidden" name="idProjeto" value=<?php echo "'".$_GET['idProjeto']."'";?>/>
 			<div class="row">
 				<div class="form-group">
 					<label for="localizacao" class="control-label col-sm-2 text-right">Localizacao</label>
 					<div class="col-sm-5"><input class="form-control" type="text" name="localizacao"/></div>
 				</div>
 			</div>
 			<div class="form-group">
 				<label for="data" class="control-label col-sm-2 text-right">Data</label>
 				<div class="col-sm-5"><input class="form-control" type="date" name="data"/></div>
 			</div>
 		</div>
 		<div class="row">
 			<div class="form-group">
 				<button type="submit" class="btn btn-default col-sm-3 col-sm-offset-1">Criar projeto de pesquisa</button>
 			</div>
 		</div>
 	</form>
 	<br/>
  	
 	<h3>Atividades desse projeto de extensao</h3>
 		<table class="table">
 			<thead>
 				<tr>
 		        	<th>Localização</th>
 		        	<th>data</th>
 		     	</tr>
     		</thead>
 		    <tbody>
 		    	<?php
 		    		$atividades = consultaAtividades($_GET['idProjeto']);
 		    		while ($dados = mysqli_fetch_array($atividades)) {
 		    			echo "<tr>";
 		    			echo "<td>".$dados['localizacao']."</td>";
 		    			echo "<td>".$dados['Data_Atividade']."</td>";
 		    			echo "</tr>";
 		    		}
 		    	?>
 			</tbody>
 		</table>
	
</main>
<?php 
	include "footer.html"; 
?>