<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Recursos Humanos</h2>
		<p>
			Nessa tela, são exibidas as ocorrências referentes ao trabalho dos professores
			e funcionários. São exibidos: férias, licenças, advertências, afastamentos 
			remunerados e afastamentos não remunerados.
		</p>
		<h3>Professores</h3>
		<table class="table">
			<thead>
				<tr>
					<th></th>
		        	<th>nome</th>
		        	<th>cpf</th>
		        	<th>carreira</th>
		        	<th>nivel</th>
		        	<th>detalhes</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<form action="detalheRH.php" method="get">
			    	<?php
			    		$professores = consultaTodosProfessores();
			    		while ($dados = mysqli_fetch_array($professores)) {
			    			echo "<tr>";
			    			echo "<td>".$dados['ID_Usuario']."<input type='hidden' name='id' value='".$dados['ID_Usuario']."'></td>";
			    			echo "<td>".$dados['nome']."<input type='hidden' name='nome' value='".$dados['nome']."'></td>";
			    			echo "<td>".$dados['cpf']."</td>";
			    			echo "<td>".$dados['carreira']."</td>";
			    			echo "<td>".$dados['nivel']."</td>";
			    			echo "<td><button type='submit' value='1' class='btn btn-default'>Detalhes</button></td>";
			    			echo "</tr>";
			    		}
			    	?>
		    	</form>
			</tbody>
		</table>

	    <h3>Funcionários</h3>
	    <table class="table">
			<thead>
				<tr>
					<th></th>
		        	<th>nome</th>
		        	<th>cpf</th>
		        	<th>função</th>
		        	<th>detalhes</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<form action="detalheRH.php" method="get">
			    	<?php
			    		$funcionarios = consultaTodosFuncionarios();
			    		while ($dados = mysqli_fetch_array($funcionarios)) {
			    			echo "<tr>";
			    			echo "<td>".$dados['ID_Usuario']."<input type='hidden' name='id' value='".$dados['ID_Usuario']."'></td>";
			    			echo "<td>".$dados['nome']."<input type='hidden' name='nome' value='".$dados['nome']."'></td>";
			    			echo "<td>".$dados['cpf']."</td>";
			    			//echo "<td>".$dados['funcao']."</td>";
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