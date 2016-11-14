<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = insereProfessor( $_GET['nome'], $_GET['cpf'], $_GET['data-nascimento'], $_GET['carreira'], $_GET['nivel'], $_GET['unidade']);
	        if($inseriu == TRUE){
	            echo "Professor cadastrado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="rh.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>