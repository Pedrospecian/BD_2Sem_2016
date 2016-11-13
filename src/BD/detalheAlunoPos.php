<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2>Aluno Pós-Graduação: <?php echo $_GET['nomeAluno'];?></h2>
	    <h3>Projetos de extensão do aluno</h3>
	    <table class="table">
			<thead>
			    <tr>
	    		    <th>Descrição</th>
	    		    <th>Atividade</th>
	    		    <th>Orçamento</th>
	    		    <th>Data Início</th>
	    		    <th>Data Término</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaHistoricoAluno($_GET['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "</tr>";
		    		}
		    	?>
		    	
			</tbody>
		</table>

	    <h3>Projetos de pesquisa do aluno</h3>
	    <table class="table">
			<thead>
			    <tr>
	    		    <th>Descrição</th>
	    		    <th>Atividade</th>
	    		    <th>Orçamento</th>
	    		    <th>Data Início</th>
	    		    <th>Data Término</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaHistoricoAluno($_GET['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "</tr>";
		    		}
		    	?>
		    	
			</tbody>
		</table>

	    <h3>Disciplinas cursadas pelo aluno</h3>
	    <table class="table">
			<thead>
			    <tr>
	    		    <th>Código disciplina</th>
	    		    <th>Nome disciplina</th>
	    		    <th>Nota do aluno</th>
	    		    <th>Frequencia do aluno</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaHistoricoAluno($_GET['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_Disciplina']."</td>";
		    			echo "<td>".$dados['Nome']."</td>";
		    			echo "<td>".$dados['Notas']."</td>";
		    			echo "<td>".$dados['Frequencia']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
		    	
			</tbody>
		</table>
		<h3>Bolsas recebidas pelo aluno</h3>
		<table class="table">
			<thead>
			    <tr>
	    		    <th>Código disciplina</th>
	    		    <th>Nome disciplina</th>
	    		    <th>Nota do aluno</th>
	    		    <th>Frequencia do aluno</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaHistoricoAluno($_GET['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "<td></td>";
		    			echo "</tr>";
		    		}
		    	?>
		    	
			</tbody>
		</table>
		<h3>Datas Importantes do curso de <?php echo $_GET['nomeAluno'];?></h3>
		<table class="table">
			<thead>
			    <tr>
	    		    <th>Etapa</th>
	    		    <th>Data</th>
	    		    <th>Nota do aluno</th>
	    		    <th>Frequencia do aluno</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaHistoricoAluno($_GET['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td></td>";
		    			echo "<td></td>";
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