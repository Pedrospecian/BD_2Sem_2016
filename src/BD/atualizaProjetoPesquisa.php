<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
           $alterou = alteraPesquisa( $_GET['objetivo-alt'], $_GET['descricao-alt'], $_GET['orcamento-alt'], $_GET['idFinanciador'], $_GET['idAluno'], $_GET['bolsa-alt'], $_GET['data-inicio'], $_GET['data-fim'], $_GET['idProjeto-alt']);
           	if($alterou == TRUE){
	            echo "Projeto de Pesquisa atualizado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="projetos.php">Voltar</a>


	</div>
</main>
<?php 
	include "footer.html"; 
?>