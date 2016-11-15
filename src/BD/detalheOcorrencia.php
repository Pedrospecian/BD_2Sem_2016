<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php 
		if(isset($_POST['update'])){ ?>
			<form action="atualizaOcorrencia.php" method="GET" class="form-horizontal">
				<input type="hidden" name="idOcorrencia-alt" value="<?php echo $_POST['id-oco']; ?>"/>
				<div class="row">
					<div class="form-group">
						<label for="tipo-alt" class="control-label col-sm-2 text-right">Tipo</label>
						<div class="col-sm-5">
							<input class="form-control" type="text" name="tipo-alt" value="<?php echo $_POST['tipo-oco']; ?>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="data-alt" class="control-label col-sm-2 text-right">Data</label>
						<div class="col-sm-5"><input class="form-control" type="date" name="data-alt" value="<?php echo $_POST['data-oco']; ?>"/></div>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-default col-sm-offset-2" type="submit" name="AtualizarOcorrencia">Atualizar Ocorrência</button>
				</div>
			</form>
		<?php }
		if(isset($_POST['delete'])){
			var_dump($_POST);
			$deletou = deletaOcorrencia($_POST['id-oco']);
		    if($deletou == TRUE){
		        echo "Ocorrência excluída com sucesso!";
		        echo "<br>";
		    	echo "<a href='rh.php'>Voltar</a>";
		    }
		}?>
	</div>
</main>
<?php 
	include "footer.html"; 
?>