<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2>Aluno: <?php echo $_GET['nomeAluno'];?></h2>
	    <h3>Projetos de extensão do aluno</h3>

	    <h3>Projetos de pesquisa do aluno</h3>

	    <h3>Disciplinas cursadas pelo aluno</h3>
	    <table class="table">
			<thead>
			    <tr>
	    		    <th>Código disciplina</th>
	    		    <th>Nome disciplina</th>
	    		    <th>Nota do aluno</th>
	    		    <th>Frequencia do aluno</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaHistoricoAluno($_GET['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['Codigo']."</td>";
		    			echo "<td>".$dados['nome']."</td>";
		    			echo "<td>".$dados['Notas']."</td>";
		    			echo "<td>".$dados['Frequencia']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
		    	
			</tbody>
		</table>
		<h3>Bolsas recebidas pelo aluno</h3>
	</div>
</main>
<?php 
	include "footer.html"; 
?>