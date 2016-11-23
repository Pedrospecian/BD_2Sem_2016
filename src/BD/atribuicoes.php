<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Atribuições de Professores</h2>
		<p>
			Nessa tela são listados todos os professores, listando, ao lado, as atribuições dos que possuem.
		</p>

		<table class="table">
			<thead>
				<tr>
		        	<th>Nome do Professor</th>
		        	<th>CPF</th>
		        	<th>Nível</th>
		        	<th>Carreira</th>
		        	<th>ID Unidade</th>
		        	<th>Cargo</th>
		        	<th>Início</th>
		        	<th>Fim</th>
		        	<th>alterar</th>
		        	<th>apagar</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$atribuicoes = consultaAtribuicoesProfessores();
		    		while ($dados = mysqli_fetch_array($atribuicoes)) {
		    			echo "<form action='detalheBens.php' method='post'>";
		    			echo "<tr>";
		    			echo "<input type='hidden' name='id' value='".$dados['Id_Atribuicoes']."'/>";
		    			echo "<td>".$dados['nome']."<input type='hidden' name='localizacao' value='".$dados['nome']."'/></td>";
		    			echo "<td>".$dados['cpf']."<input type='hidden' name='localizacao' value='".$dados['cpf']."'/></td>";
		    			echo "<td>".$dados['nivel']."<input type='hidden' name='localizacao' value='".$dados['nivel']."'/></td>";
		    			echo "<td>".$dados['carreira']."<input type='hidden' name='localizacao' value='".$dados['carreira']."'/></td>";
		    			echo "<td>".$dados['ID_Unidade']."</td>";
		    			echo "<td>".$dados['Nome_Atribuicao']."</td>";
		    			echo "<td>".$dados['Data_inicio']."</td>";
		    			echo "<td>".$dados['Data_fim']."</td>";
		    			if($dados['Id_Atribuicoes']!='') {
		    				echo "<td><button type='submit' name='update' value='update' class='btn btn-info'>Alterar</button></td>";
			    			echo "<td><button type='submit' name='delete' value='delete' class='btn btn-danger'>Apagar</button></td>";
		    			}else{
		    				echo "<td></td>";
			    			echo "<td></td>";
		    			}
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