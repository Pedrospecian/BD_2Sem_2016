<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Gerenciamento de Bens</h2>
		<p>
			Nessa tela são exibidas informações sobre as unidades da universidade.
		</p>
		<p>
			A universidade possui um total de <?php echo mysqli_fetch_array(somaValorBens())['total'] ?> reais em bens.
		</p>

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