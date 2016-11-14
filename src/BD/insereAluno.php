<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = insereAluno( $_GET['nome'], $_GET['cpf'], $_GET['data-nascimento'], $_GET['unidade'], $_GET['curso']);
	        if($inseriu == TRUE){
	            echo "Aluno cadastrado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="index.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>