<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php
		if(isset($_POST["detalhes"])) { ?>
		<h2>Professor: <?php echo $_POST['nome'];?></h2>
	    <h3>Ocorrências</h3>
	    <h4>Inserir nova Ocorrência</h4>
	    <form method="GET" action="insereOcorrenciaProfessor.php" class="form-horizontal">
	    	<input type="hidden" name="id-ocorr" value="<?php echo $_POST['id']; ?>"/>
	    	<div class="row">
	    		<div class="form-group">
	    			<label for="tipo-oco" class="control-label col-sm-2 text-right">Tipo</label>
	    			<div class="col-sm-5">
	    				<input class="form-control" type="text" name="tipo-oco">
	    			</div>
	    		</div>
	    		<div class="form-group">
	    			<label for="data-ini-oco" class="control-label col-sm-2 text-right">Data Inicio</label>
	    			<div class="col-sm-5">
	    				<input class="form-control" type="date" name="data-ini-oco">
	    			</div>
	    		</div>
	    		<div class="form-group">
	    			<label for="data-fin-oco" class="control-label col-sm-2 text-right">Data Final</label>
	    			<div class="col-sm-5">
	    				<input class="form-control" type="date" name="data-fin-oco">
	    			</div>
	    		</div>
    			<div class="form-group">
					<button class="btn btn-default col-sm-offset-2" type="submit" name="InserirOcorrencia">Inserir Ocorrência</button>
				</div>
	    	</div>
	    </form>
		<table class="table">
			<thead>
			    <tr>
	    		    <th>Código Ocorrência</th>
	    		    <th>Tipo da Ocorrência</th>
	    		    <th>Data Início</th>
	    		    <th>Data Final</th>
	    		    <th>Alterar</th>
	    		    <th>Apagar</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$ocorrencias = consultaOcorrencias($_POST['id']);
		    		while ($dados = mysqli_fetch_array($ocorrencias)) {
		    			echo "<form method='post' action='detalheOcorrencia.php'>";
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_Ocorrencia']."<input type='hidden' name='id-oco' value='".$dados['ID_Ocorrencia']."'/></td>";
		    			echo "<td>".$dados['Tipo_Ocorrencia']."<input type='hidden' name='tipo-oco' value='".$dados['Tipo_Ocorrencia']."'/></td>";
		    			echo "<td>".$dados['Data_Inicio']."<input type='hidden' name='data-ini-oco' value='".$dados['Data_Inicio']."'/></td>";
		    			echo "<td>".$dados['Data_Final']."<input type='hidden' name='data-fin-oco' value='".$dados['Data_Final']."'/></td>";
		    			echo "<td><button type='submit' value='update' name='update' class='btn btn-info'>Alterar</button></td>";
			    		echo "<td><button type='submit' value='delete' name='delete' class='btn btn-danger'>Apagar</button></td>";
		    			echo "</tr>";
		    			echo "</form>";
		    		}
		    	?>
		    	
			</tbody>
		</table>
		<?php }
		if(isset($_POST["update"])) { ?>
			<form action="atualizaProfessor.php" method="GET" class="form-horizontal">
				<input type="hidden" name="idProfessor-alt" value="<?php echo $_POST['id']; ?>"/>
				<div class="row">
					<div class="form-group">
						<label for="nome-alt" class="control-label col-sm-2 text-right">Nome</label>
						<div class="col-sm-5">
							<input class="form-control" type="text" name="nome-alt" value="<?php echo $_POST['nome']; ?>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="cpf-alt" class="control-label col-sm-2 text-right">CPF</label>
						<div class="col-sm-5"><input class="form-control" type="text" name="cpf-alt" value="<?php echo $_POST['cpf']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="data-nascimento-alt" class="control-label col-sm-2 text-right">Data de Nascimento</label>
						<div class="col-sm-5"><input class="form-control" type="date" name="data-nascimento-alt" value="<?php echo $_POST['data-nascimento']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="carreira-alt" class="control-label col-sm-2 text-right">Carreira</label>
						<div class="col-sm-5">
							<input class="form-control" type="text" name="carreira-alt" value="<?php echo $_POST['carreira']; ?>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="nivel-alt" class="control-label col-sm-2 text-right">Nível</label>
						<div class="col-sm-5">
							<input class="form-control" type="text" name="nivel-alt" value="<?php echo $_POST['nivel']; ?>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="unidade-alt" class="control-label col-sm-2 text-right">Unidade</label>
						<div class="col-sm-5">
							<select class="form-control" name="unidade-alt">
								<option value="">--</option>
								<?php
									$unidades = consultaUnidades();
									while ($dados = mysqli_fetch_array($unidades)) {
										if($dados['ID_Unidade']==$_POST['unidade']) {
											echo "<option selected value=".$dados['ID_Unidade'].">".$dados['Nome_Unidade']."</option>";
										}else {
											echo "<option value=".$dados['ID_Unidade'].">".$dados['Nome_Unidade']."</option>";
										}
							        }
								?>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-default col-sm-offset-2" type="submit" name="AtualizarProfessor">Atualizar Professor</button>
				</div>
			</form>
		<?php }
		if(isset($_POST["delete"])) { 
		    $deletou = deletaProfessor($_POST['id']);
		    if($deletou == TRUE){
		        echo "Professor excluído com sucesso!";
		        echo "<br>";
		    	echo "<a href='rh.php'>Voltar</a>";
		    }
		} ?>
	</div>
</main>
<?php 
	include "footer.html"; 
?>