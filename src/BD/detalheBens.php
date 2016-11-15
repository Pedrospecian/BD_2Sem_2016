<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
	<?php
	if(isset($_POST["update"])) { ?>
		<h3>Alterar dados do bem de ID=<?php echo $_POST['idBem']?></h3>
		<form action="atualizaBem.php" method="GET" class="form-horizontal">
			<input type="hidden" name="idBem-alt" value="<?php echo $_POST['idBem']; ?>"/>
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
										echo "<option selected value=".$dados['ID_Unidade'].">".$dados['nome']."</option>";
									}else {
										echo "<option value=".$dados['ID_Unidade'].">".$dados['nome']."</option>";
									}
									
						        }
							?>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="localizacao-alt" class="control-label col-sm-2 text-right">Localização</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="localizacao-alt" value="<?php echo $_POST['localizacao']; ?>"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="valor-alt" class="control-label col-sm-2 text-right">Valor</label>
					<div class="col-sm-5"><input class="form-control" type="number" name="valor-alt" value="<?php echo $_POST['valor']; ?>"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="data-aquisicao-alt" class="control-label col-sm-2 text-right">Data de Aquisição</label>
					<div class="col-sm-5"><input class="form-control" type="date" name="data-aquisicao-alt" value="<?php echo $_POST['data-aquisicao']; ?>"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="tipo-alt" class="control-label col-sm-2 text-right">Tipo</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="tipo-alt" value="<?php echo $_POST['tipo']; ?>"/></div>
				</div>
			</div>
			<div class="form-group">
				<button class="btn btn-default col-sm-offset-2" type="submit" name="AlterarBem">Alterar Bem</button>
			</div>
		</form>
	<?php }
	if(isset($_POST["delete"])) {
		var_dump($_POST);
	    $inseriu = deletaBem($_POST['idBem']);
	    if($inseriu == TRUE){
	        echo "Bem excluído com sucesso!";
	        echo "<br>";
	    	echo "<a href='bens.php'>Voltar</a>";
	    }
	}
	?>
	</div>
</main>
<?php 
	include "footer.html"; 
?>