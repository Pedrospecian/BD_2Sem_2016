<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
    <h1>Projetos de extensão do aluno:</h1>
    <br>
    <h1>Projetos de pesquisa do aluno</h1>
    <br>
    <h1>Disciplinas cursadas pelo aluno</h1>
    <table class="table">
		<thead>
		    <tr>
    		    <th>Código disciplina</th>
    		    <th>Nome disciplina</th>
    		    <th>Nota do aluno</th>
    		    <tH>Frequencia do aluno</tH>
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
</main>
<?php 
	include "footer.html"; 
?>