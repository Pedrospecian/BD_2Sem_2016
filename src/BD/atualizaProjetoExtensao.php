<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            alteraPesquisa($_GET['objetivo-alt'], $_GET['descricao-alt'], $_GET['orcamento-alt'], $_GET['idFinanciador'], $_GET['idAluno'], $_GET['professor'], $_GET['bolsa-alt'], $_GET['data-inicio'], $_GET['data-fim'], $_GET['idProjeto-alt'], $_GET['indice']);
	        

	    ?>


	</div>
</main>
<?php 
	include "footer.html"; 
?>