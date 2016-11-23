<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
	        $inseriu = insereBem($_GET['unidade'], $_GET['localizacao'], $_GET['valor'], $_GET['data-aquisicao'], $_GET['tipo']);
	        if($inseriu == TRUE){
	            echo "Bem cadastrado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="bens.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>