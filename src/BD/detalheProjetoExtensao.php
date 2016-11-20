<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php 
		var_dump($_GET);
		if(isset($_GET['update'])){ ?>
			atualiza dados de projeto de extensao
		<?php }
			if(isset($_GET['delete'])){
				echo "deleta projeto de extensao";
				deletaExtensao($_GET['idProjeto']);
			}
			if($_GET['localizacao']){
				insereAtividade($_GET['idProjeto'], $_GET['data'], $_GET['localizacao']);
			}
		
		?>
	</div>
	
	
</main>
<?php 
	include "footer.html"; 
?>