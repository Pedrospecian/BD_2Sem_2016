<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php 
		var_dump($_GET);
		if(isset($_GET['update'])){ ?>
			
		<?php }
			if(isset($_GET['delete'])){
			    echo "deletar atividade";
			    deletaAtividade($_GET['id']);
			}
		
		?>
	</div>

	
</main>
<?php 
	include "footer.html"; 
?>