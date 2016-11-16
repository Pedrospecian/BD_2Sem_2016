<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php 
		if(isset($_POST['update'])){ ?>
			atualiza dados de projeto de extensao
		<?php }
		if(isset($_POST['delete'])){
			echo "deleta projeto de extensao";
		}?>
	</div>
</main>
<?php 
	include "footer.html"; 
?>