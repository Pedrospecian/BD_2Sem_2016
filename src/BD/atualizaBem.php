<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = atualizaBem($_GET['idBem-alt'], $_GET['unidade-alt'], $_GET['localizacao-alt'], $_GET['valor-alt'], $_GET['data-aquisicao-alt'], $_GET['tipo-alt']);
	        if($inseriu == TRUE){
	            echo "Bem atualizado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="bens.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>