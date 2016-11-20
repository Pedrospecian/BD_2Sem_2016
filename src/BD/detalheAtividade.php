<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php 
		var_dump($_GET);
		if(isset($_GET['altera'])){
		    alteraAtividade($_GET['id'], $_GET['localizacao'], $_GET['data']);
		}
		if(isset($_GET['update'])){ ?>
    		<h1>Atualiza atividade</h1>
         	<form action="#" method="get" class="form-horizontal">	
         	    <input class="form-control" type="hidden" name="id" value=<?php echo "'".$_GET['id']."'";?>/>
         		<div class="row">
         			<input type="hidden" name="idProjeto" value=<?php echo "'".$_GET['idProjeto']."'";?>/>
         			<div class="row">
         				<div class="form-group">
         					<label for="localizacao" class="control-label col-sm-2 text-right">Localizacao</label>
         					<div class="col-sm-5"><input class="form-control" type="text" name="localizacao" value=<?php echo "'".$_GET['local']."'";?>/></div>
         				</div>
         			</div>
         			<div class="form-group">
         				<label for="data" class="control-label col-sm-2 text-right">Data</label>
         				<div class="col-sm-5"><input class="form-control" type="date" name="data" value=<?php echo "'".$_GET['data']."'";?>/></div>
         			</div>
         		</div>
         		<div class="row">
         			<div class="form-group">
         				<button type="submit" value="altera" name="altera" class="btn btn-default col-sm-3 col-sm-offset-1">Alterar atividade</button>
         			</div>
         		</div>
         	</form>
			
		<?php }
			if(isset($_GET['delete'])){
			    echo "deletar atividade";
			    deletaAtividade($_GET['id']);
			}
		
		?>
	</div>

	
</main>
<?php 
	include "footer.html"; 
?>