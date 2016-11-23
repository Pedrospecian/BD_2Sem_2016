<?php 
	include "header.html"; 
	include "queries.php"
?>
<main>
	<div class="container">
	    <?php
	        $inseriu = insereFuncionario( $_GET['nome'], $_GET['cpf'], $_GET['data-nascimento'], $_GET['funcao'], $_GET['unidade']);
	        if($inseriu == TRUE){
	            echo "Funcionário cadastrado com sucesso!";
	        }
	    ?>
	    <br>
	    <a href="rh.php">Voltar</a>

	</div>
</main>
<?php 
	include "footer.html"; 
?>