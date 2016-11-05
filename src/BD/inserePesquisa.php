<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = inserePesquisa( $_GET['objetivo'], $_GET['descricao'], $_GET['orcamento'], $_GET['atividade'], $_GET['idFinanciador']);
	        if($inseriu == TRUE){
	            echo "inseriu";
	        }
	    ?>

	</div>
</main>
<?php 
	include "footer.html"; 
?>