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
		<?php }
		if(isset($_GET['delete'])){
			echo "deleta projeto de extensao";
		}?>
	</div>
	<h1>Adicionar atividade</h1>
	<form action="inserePesquisa.php" method="get" class="form-horizontal">			
		<div class="row">
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
		    		$atividades = consultaAtividades($_GET['calendario']);
		    		while ($dados = mysqli_fetch_array($atividades)) {
		    			echo "<form action='detalheProjetoExtensao.php' method='post'>";
		    			echo "<tr>";
		    			echo "<td>".$dados['localizacao']."</td>";
		    			echo "<td>".$dados['Data_Atividade']."</td>";
		    			echo "</tr>";
		    			echo "</form>";
		    		}
		    	?>
			</tbody>
		</table>
</main>
<?php 
	include "footer.html"; 
?>