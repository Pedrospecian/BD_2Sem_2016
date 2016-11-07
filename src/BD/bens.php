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
		<br>
		<p>
			A universidade possui um total de <?php echo mysqli_fetch_array(somaValorBens())['total'] ?> reais em bens.
		</p>
		
		<br>
		<h1>Pesquisar bens de uma determinada unidade:</h1>
		<form action="bensUnidade.php" method="GET">
			Nome da unidade: 
			<input type="text" name="nomeUnidade"/>
			<input type="submit" name="Pesquisar" value="Pesquisar"/>
		</form>
		<br>
		<table class="table">
			<thead>
				<tr>
		        	<th>Identificador</th>
		        	<th>Localizacao</th>
		        	<th>Valor</th>
		        	<th>Data de aquisição</th>
		        	<th>Tipo</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$bens = consultaBens();
		    		while ($dados = mysqli_fetch_array($bens)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['Identificador']."</td>";
		    			echo "<td>".$dados['Localizacao']."</td>";
		    			echo "<td>".$dados['Valor']."</td>";
		    			echo "<td>".$dados['Data_de_Aquisicao']."</td>";
		    			echo "<td>".$dados['Tipo']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
			</tbody>
		</table>
	</div>
</main>
<?php 
	include "footer.html"; 
?>