<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Cursos</h2>
		<p>
			Nessa tela, são exibidas as informações sobre os cursos de graduação e pós-graduação da universidade.
		</p>

		<h3>Cursos de Graduação</h3>

		<table class="table">
			<thead>
				<tr>
		        	<th>Codigo</th>
		        	<th>Nome</th>
		        	<th>Unidade</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$cursos = consultaCursosGraduacao();
		    		while ($dados = mysqli_fetch_array($cursos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['Codigo']."</td>";
		    			echo "<td>".$dados['Nome']."</td>";
		    			echo "<td>".$dados['ID_Unidade']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
			</tbody>
		</table>

		<h3>Cursos de Pós-Graduação</h3>

		<table class="table">
			<thead>
				<tr>
		        	<th>Codigo</th>
		        	<th>Nome</th>
		        	<th>Unidade</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$cursos = consultaCursosPos();
		    		while ($dados = mysqli_fetch_array($cursos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['Codigo']."</td>";
		    			echo "<td>".$dados['Nome']."</td>";
		    			echo "<td>".$dados['ID_Unidade']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
			</tbody>
		</table>

		<h3>Cursos Latu Sensu e Isenção de Alunos</h3>

		<table class="table">
			<thead>
				<tr>
		        	<th>Código do Curso</th>
		        	<th>Nome do Curso</th>
		        	<th>Unidade do Curso</th>
		        	<th>Defesa Final</th>
		        	<th>Valor Mensalidade</th>
		        	<th>Aluno ID</th>
		        	<th>Isento (ID do Curso Isento)</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
					$cursos = consultaCursosLatuSensu();
					
				    while ($dados = mysqli_fetch_array($cursos)) {  		
		    			echo "<tr>";
		    			echo "<td>".$dados['Codigo']."</td>";
		    			echo "<td>".$dados['Nome']."</td>";
		    			echo "<td>".$dados['ID_Unidade']."</td>";
		    			echo "<td>".$dados['Data_defesa_do_Trabalho_final']."</td>";
		    			echo "<td>".$dados['Valor_Mensalidade']."</td>";
		    			echo "<td>".$dados['ID_Usuario']."</td>";
		    			if($dados['Ise_Codigo'] && $dados['Ise_Codigo']==$dados['Codigo']) {
		    				echo "<td>Sim (".$dados['Ise_Codigo'].")</td>";
		    			} else {
		    				echo "<td>Não (--)</td>";
		    			}
		    			
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