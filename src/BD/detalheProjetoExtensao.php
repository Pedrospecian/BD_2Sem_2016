<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php 
		if(isset($_POST['update'])){ ?>
			atualiza dados de projeto de pesquisa
		<?php }
		if(isset($_POST['delete'])){
			echo "deleta projeto de pesquisa";
		}?>
	</div>
</main>
<?php 
	include "footer.html"; 
?>