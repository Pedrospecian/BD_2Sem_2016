<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = insereOcorrenciaFuncionario( $_GET['id-ocorr'], $_GET['tipo-oco'], $_GET['data-oco']);
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