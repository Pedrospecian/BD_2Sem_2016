<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = insereOcorrenciaFuncionario( $_GET['id-ocorr'], $_GET['tipo-oco'], $_GET['data-ini-oco'], $_GET['data-fin-oco']);
	        if($inseriu == TRUE){
	            echo "Ocorrência cadastrada com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="rh.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>