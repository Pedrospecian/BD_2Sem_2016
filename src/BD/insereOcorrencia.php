<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = insereOcorrencia( $_GET['nome'], $_GET['cpf'], $_GET['data-nascimento'], $_GET['funcao'], $_GET['unidade']);
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