<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            alteraExtensao( $_GET['objetivo-alt'], $_GET['descricao-alt'], $_GET['orcamento-alt'], $_GET['idFinanciador'], $_GET['idAluno'], $_GET['servidor'], $_GET['bolsa-alt'], $_GET['data-inicio'], $_GET['data-fim'], $_GET['idProjeto-alt']);

	    ?>


	</div>
</main>
<?php 
	include "footer.html"; 
?>