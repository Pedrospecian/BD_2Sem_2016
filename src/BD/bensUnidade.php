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
			A universidade possui um total de <?php echo mysqli_fetch_array(somaValorBensUnidade($_GET['nomeUnidade']))['total'] ?> reais em bens.
		</p>
		
		<br>
		<table class="table">
			<thead>
				<tr>
		        	<th>Identificador</th>
		        	<th>Localizacao</th>
		        	<th>Valor</th>
		        	<th>Data de aquisição</th>
		        	<th>Tipo do bem</th>
		        	<th>Nome da unidade</th>
		        	<th>Tipo da unidade</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$bens = consultaBensUnidade($_GET['nomeUnidade']);
		    		while ($dados = mysqli_fetch_array($bens)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['Identificador']."</td>";
		    			echo "<td>".$dados['Localizacao']."</td>";
		    			echo "<td>".$dados['Valor']."</td>";
		    			echo "<td>".$dados['Data_de_Aquisicao']."</td>";
		    			echo "<td>".$dados['tipoBem']."</td>";
		    			echo "<td>".$dados['nomeUnidade']."</td>";
		    			echo "<td>".$dados['tipoUnidade']."</td>";
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