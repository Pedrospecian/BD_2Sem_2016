<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = insereExtensao( $_GET['objetivo'], $_GET['descricao'], $_GET['orcamento'], $_GET['idFinanciador'], $_GET['idAluno'], $_GET['professor'], $_GET['bolsa'], $_GET['data-inicio'], $_GET['data-fim']);
	        if($inseriu == TRUE){
	            echo "Projeto de extensão cadastrado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="projetos.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>