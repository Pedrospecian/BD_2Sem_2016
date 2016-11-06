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
		<br>
		<table class="table">
			<thead>
				<tr>
		        	<th>id</th>
		        	<th>nome</th>
		        	<th>cpf</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$alunos = consultaTodosAlunos();
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados[ID_Usuario]."</td>";
		    			echo "<td>".$dados[nome]."</td>";
		    			echo "<td>".$dados[cpf]."</td>";
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