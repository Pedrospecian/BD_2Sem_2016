<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $atualizou = atualizaFuncionario($_GET['idFuncionario-alt'], $_GET['nome-alt'], $_GET['cpf-alt'], $_GET['data-nascimento-alt'], $_GET['funcao-alt'], $_GET['unidade-alt']);
	        if($atualizou == TRUE){
	            echo "Funcionário atualizado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="rh.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>