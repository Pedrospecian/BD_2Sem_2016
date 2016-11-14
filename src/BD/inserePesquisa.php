<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
            var_dump($_GET);
	        $inseriu = inserePesquisa( $_GET['objetivo'], $_GET['descricao'], $_GET['orcamento'], $_GET['atividade'], $_GET['idFinanciador'], $_GET['idAluno']);
	        if($inseriu == TRUE){
	            echo "Projeto de Pesquisa inserido com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="projetos.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>