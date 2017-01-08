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
		        	<th>Valor Mensalidade</th>
		        	<th>Qte Isenções</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
					$cursos = consultaCursosLatuSensu();
					
				    while ($dados = mysqli_fetch_array($cursos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['Codigo']."</td>";
		    			echo "<td>".$dados['Nome']."</td>";
		    			echo "<td>".$dados['ID_unidade']."</td>";
		    			echo "<td>".$dados['Valor_Mensalidade']."</td>";
		    			echo "<td>".$dados['Qte_Isentos']."</td>";
		    			
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