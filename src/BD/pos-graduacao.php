<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Pós-Graduação</h2>
		<p>
			Nessa tela é possível gerenciar os assuntos referentes aos alunos de
			diferentes tipos de pós-graduação, como notas e frequência obtidas em 
			disciplinas, bolsas que o aluno recebe durante o período em que está na 
			universidade e datas finais para cumprimento de etapas importantes de seu
			curso (qualificação, para mestrado e doutorado, e defesa de trabalho final
			para todos os casos).
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
		    	<form action="detalheAlunoPos.php" method="get">
			    	<?php
			    		$alunos = consultaAlunosPos();
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