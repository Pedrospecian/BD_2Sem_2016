<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Unidades</h2>
		<p>
			Nessa tela são exibidas informações sobre as unidades da universidade.
		</p>

		<table class="table">
			<thead>
				<tr>
		        	<th>ID Unidade</th>
		        	<th>Nome da Unidade</th>
		        	<th>Endereço</th>
		     	</tr>
    		</thead>
		    <tbody>		    	
		    	<?php
		    		$unidades = consultaUnidades();
		    		while ($dados = mysqli_fetch_array($unidades)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_Unidade']."</td>";
		    			echo "<td>".$dados['Nome_Unidade']."</td>";
		    			echo "<td>".$dados['Endereco']."</td>";
		    			echo "<td></td>";
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