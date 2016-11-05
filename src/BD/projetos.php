<?php 
	include "header.html"; 
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
			inserePesquisa($objetivo, $descricao, $orcamento, $atividade, $idFiananciador)
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
			<input type="number" name="idFinanciador"/><br>
			<input type="submit" value="Criar projeto de pesquisa">
		
		</form>
	</div>
</main>
<?php 
	include "footer.html"; 
?>