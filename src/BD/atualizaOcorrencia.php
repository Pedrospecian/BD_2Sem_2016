<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $atualizou = atualizaOcorrencia($_GET['idOcorrencia-alt'], $_GET['tipo-alt'], $_GET['data-ini-alt'], $_GET['data-fin-alt']);
	        if($atualizou == TRUE){
	            echo "Ocorrência atualizada com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="rh.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>