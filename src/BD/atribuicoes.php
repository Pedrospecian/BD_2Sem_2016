<?php
	include "header.html";
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Atribuições de Professores</h2>
		<p>
			Nessa tela são listados todos os professores, listando, ao lado, as atribuições dos que possuem.
			<br>
			O resultado abaixo foi gerado com a <strong>consulta F_1</strong>.
		</p>

		<table class="table">
			<thead>
				<tr>
		        	<th>Nome do Professor</th>
		        	<th>Cargo</th>
		        	<th>Início</th>
		        	<th>Fim</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$atribuicoes = consultaAtribuicoesProfessores();
		    		while ($dados = mysqli_fetch_array($atribuicoes)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['nome']."</td>";
		    			echo "<td>".$dados['Cargo']."</td>";
		    			echo "<td>".$dados['Data_inicio']."</td>";
		    			echo "<td>".$dados['Data_fim']."</td>";
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