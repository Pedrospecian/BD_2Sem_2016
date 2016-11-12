<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2>Professor/Funcionário: <?php echo $_GET['nome'];?></h2>
	    <h3>Ocorrências</h3>
		<table class="table">
			<thead>
			    <tr>
	    		    <th>Código Ocorrência</th>
	    		    <th>Tipo da Ocorrência</th>
	    		    <th>Data</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaOcorrencias($_GET['id']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_Oco']."</td>";
		    			echo "<td>".$dados['Tipo_Ocorrencia']."</td>";
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