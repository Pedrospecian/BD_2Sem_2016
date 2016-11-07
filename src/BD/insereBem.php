<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = insereBem($_GET['identificador'], $_GET['localizacao'], $_GET['valor'], $_GET['data-aquisicao'], $_GET['tipo']);
	        if($inseriu == TRUE){
	            echo "inseriu";
	        }
	    ?>

	</div>
</main>
<?php 
	include "footer.html"; 
?>