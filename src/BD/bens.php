<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Gerenciamento de Bens</h2>
		<p>
			Nessa tela, são exibidas as informações sobre cada bem que a universidade
			possui, como prédios, carros e equipamentos.
		</p>
		<p>
			A universidade possui um total de <?php echo mysqli_fetch_array(somaValorBens())['total'] ?> reais em bens.
		</p>
		<h3>Inserir novo bem:</h3>
		<form action="insereBem.php" method="GET" class="form-horizontal">
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
			<div class="row">
				<div class="form-group">
					<label for="localizacao" class="control-label col-sm-2 text-right">Localização</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="localizacao"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="valor" class="control-label col-sm-2 text-right">Valor</label>
					<div class="col-sm-5"><input class="form-control" type="number" name="valor"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="data-aquisicao" class="control-label col-sm-2 text-right">Data de Aquisição</label>
					<div class="col-sm-5"><input class="form-control" type="date" name="data-aquisicao"/></div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="tipo" class="control-label col-sm-2 text-right">Tipo</label>
					<div class="col-sm-5"><input class="form-control" type="text" name="tipo"/></div>
				</div>
			</div>
			<div class="form-group">
				<button class="btn btn-default col-sm-offset-2" type="submit" name="InserirBem">Inserir Bem</button>
			</div>
		</form>
		<h3>Pesquisar bens de uma determinada unidade:</h3>
		<form action="bensUnidade.php" method="GET" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2">Nome da unidade</label> 
				<div class="col-sm-5"><input class="form-control" type="text" name="nomeUnidade"/></div>
				<button class="btn btn-default" type="submit" name="Pesquisar">Pesquisar</button>
			</div>
		</form>
		<table class="table">
			<thead>
				<tr>
		        	<th>Identificador</th>
		        	<th>Localizacao</th>
		        	<th>Valor</th>
		        	<th>Data de aquisição</th>
		        	<th>Tipo</th>
		        	<th>alterar</th>
		        	<th>apagar</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$bens = consultaBens();
		    		while ($dados = mysqli_fetch_array($bens)) {
		    			echo "<form action='detalheBens.php' method='post'>";
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_bem']."<input type='hidden' name='idBem' value='".$dados['ID_bem']."'/></td>";
		    			echo "<input type='hidden' name='unidade' value='".$dados['ID_Unidade']."'/>";
		    			echo "<td>".$dados['Localizacao']."<input type='hidden' name='localizacao' value='".$dados['Localizacao']."'/></td>";
		    			echo "<td>".$dados['Valor']."<input type='hidden' name='valor' value='".$dados['Valor']."'/></td>";
		    			echo "<td>".$dados['Data_de_Aquisicao']."<input type='hidden' name='data-aquisicao' value='".$dados['Data_de_Aquisicao']."'/></td>";
		    			echo "<td>".$dados['Tipo']."<input type='hidden' name='tipo' value='".$dados['Tipo']."'/></td>";
		    			echo "<td><button type='submit' name='update' value='update' class='btn btn-info'>Alterar</button></td>";
			    		echo "<td><button type='submit' name='delete' value='delete' class='btn btn-danger'>Apagar</button></td>";
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