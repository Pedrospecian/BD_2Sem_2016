<?php
	include "header.html";
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Alunos</h2>
		<p>
			Na tabela abaixo é possível visualizar todos os alunos, tanto de graduação quanto de pós-graduação, cuja média das notas finais de todas as matérias é maior ou igual a 7.
			<br>
			O resultado abaixo foi gerado com a <strong>consulta G_4</strong>.
		</p>
		<table class="table">
			<thead>
				<tr>
					<th></th>
		        	<th>Nome</th>
		        	<th>CPF</th>
		        	<th>Data nascimento</th>
		        	<th>Unidade</th>
		        	<th>Média</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$alunos = alunosMediaMaiorQue7();
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_Usuario']."</td>";
		    			echo "<td>".$dados['nome']."</td>";
		    			echo "<td>".$dados['cpf']."</td>";
		    			echo "<td>".$dados['data_de_nascimento']."</td>";
		    			echo "<td>".$dados['ID_Unidade']."</td>";
		    			echo "<td>".$dados['Media']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
			</tbody>
		</table>
		<p>
			Para visualizar e gerenciar os alunos de graduação e pós-graduação, clique em um dos links abaixo:
		</p>
		<div class="row">
			<div class="col-sm-12">
				<a href="graduacao.php">Graduação</a>
				<br>
				<a href="pos-graduacao.php">Pós-Graduação</a>
			</div>
		</div>
	</div>
</main>
<?php
	include "footer.html";
?>