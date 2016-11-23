<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
	        $atualizou = atualizaAluno($_GET['idAluno-alt'], $_GET['nome-alt'], $_GET['cpf-alt'], $_GET['data-nascimento-alt'], $_GET['unidade-alt']);
	        if($atualizou == TRUE){
	            echo "Aluno atualizado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="index.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>