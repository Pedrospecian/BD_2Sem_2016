<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Projetos</h2>
		<p>
			Nessa tela é possível cadastrar projetos de pesquisa ou de extensão. De 
			cada projeto são listados objetivos, descrição, orçamento, atividades etc.
			<br>
			É possível, também, cadastrar relatórios sobre a finalização dos projetos.
		</p>
		<h1>
			Cadastrar projeto de pesquisa
		</h1>
		<form action="inserePesquisa.php" method="get">
			Objetivo: 
			<input type="text" name="objetivo"/><br>
			Descricao:
			<input type="text" name="descricao"/><br>
			Orçamento:
			<input type="text" name="orcamento"/><br>
			Atividade:
			<input type="text" name="atividade"/><br>
			ID Financiador:
			<select name="idFinanciador">
				<?php
					$financiadores = consultaFinanciadores();
					while ($dados = mysqli_fetch_array($financiadores)) {
						//<option value="volvo">Volvo</option>
						echo "<option value=".$dados['ID_Financiador'].">".$dados['Nome']."</option>";
			        }
				?>
			</select><br>
			<input type="submit" value="Criar projeto de pesquisa">
		
		</form>
		<br>
		<h1>
			Cadastrar projeto de extensão.
		</h1>
		<form action="insereExtensao.php">
			Objetivo: 
			<input type="text" name="objetivo"/><br>
			Descricao:
			<input type="text" name="descricao"/><br>
			Orçamento:
			<input type="text" name="orcamento"/><br>
			Atividade:
			<input type="text" name="atividade"/><br>
			ID Financiador:
			<select name="idFinanciador">
				<?php
					$financiadores = consultaFinanciadores();
					while ($dados = mysqli_fetch_array($financiadores)) {
						//<option value="volvo">Volvo</option>
						echo "<option value=".$dados['ID_Financiador'].">".$dados['Nome']."</option>";
			        }
				?>
			</select><br>
			<input type="submit" name="Criar projeto de extensão"/>
		</form>
		
		<br>
		<h1>Projetos de pesquisa</h1>
		<table class="table">
			<thead>
				<tr>
		        	<th>Objetivo</th>
		        	<th>Orcamento</th>
		        	<th>Atividade</th>
		        	<th>Fiananciador</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$alunos = consultaProjetoPesquisa();
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados[objetivo]."</td>";
		    			echo "<td>".$dados[orcamento]."</td>";
		    			echo "<td>".$dados[atividade]."</td>";
		    			echo "<td>".$dados[nome]."</td>";
		    			echo "</tr>";
		    		}
		    	?>
			</tbody>
		</table>
		
		<br>
		
		<h1>Projetos de extensao</h1>
		<table class="table">
			<thead>
				<tr>
		        	<th>Objetivo</th>
		        	<th>Orcamento</th>
		        	<th>Atividade</th>
		        	<th>Fiananciador</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$alunos = consultaProjetoExtensao();
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados[objetivo]."</td>";
		    			echo "<td>".$dados[orcamento]."</td>";
		    			echo "<td>".$dados[atividades]."</td>";
		    			echo "<td>".$dados[nome]."</td>";
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