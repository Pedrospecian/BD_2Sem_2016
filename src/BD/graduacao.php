<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Graduação</h2>
		<p>
			Nessa tela é possível gerenciar os assuntos referentes aos alunos da
			graduação, como notas e frequência obtidas em disciplinas e bolsas que o
			aluno recebe durante o período em que está na universidade.
		</p>
		<table class="table">
			<thead>
				<tr>
					<th></th>
		        	<th>nome</th>
		        	<th>cpf</th>
		        	<th>detalhes</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<form action="detalheAlunoGraduacao.php" method="get">
			    	<?php
			    		$alunos = consultaAlunosGraduacao();
			    		while ($dados = mysqli_fetch_array($alunos)) {
			    			echo "<tr>";
			    			echo "<td>".$dados['ID_Usuario']."<input type='hidden' name='idAluno' value='".$dados['ID_Usuario']."'></td>";
			    			echo "<td>".$dados['nome']."<input type='hidden' name='nomeAluno' value='".$dados['nome']."'></td>";
			    			echo "<td>".$dados['cpf']."</td>";
			    			echo "<td><button type='submit' value='1' class='btn btn-default'>Detalhes</button></td>";
			    			echo "</tr>";
			    		}
			    	?>
		    	</form>
			</tbody>
		</table>
	</div>
</main>
<?php 
	include "footer.html"; 
?>