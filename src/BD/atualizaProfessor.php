<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $atualizou = atualizaProfessor($_GET['idProfessor-alt'], $_GET['nome-alt'], $_GET['cpf-alt'], $_GET['data-nascimento-alt'], $_GET['carreira-alt'], $_GET['nivel-alt'], $_GET['unidade-alt']);
	        if($atualizou == TRUE){
	            echo "Professor atualizado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="rh.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>