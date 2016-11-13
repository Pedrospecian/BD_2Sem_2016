<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = insereExtensao( $_GET['objetivo'], $_GET['descricao'], $_GET['orcamento'], $_GET['atividade'], $_GET['idFinanciador']);
	        if($inseriu == TRUE){
	            echo "inseriu";
	        }
	    ?>
	    <br>
	    <a href="projetos.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>