<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<h2 class="title">Sistema Financeiro</h2>
		<p>
			Nessa tela é possível gerenciar todo o dinheiro que entra e sai da 
			faculdade, abrangendo folha de pagamento, compras feitas pela universidade
			e verbas recebidas.
		</p>
		<h3>Folha de Pagamento</h3>
		<table class="table">
			<thead>
				<tr>
		        	<th>Identificador</th>
		        	<th>Valor</th>
		        	<th>Data de aquisição</th>
		        	<th>Tipo</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$bens = consultaFolhaPagamento();
		    		while ($dados = mysqli_fetch_array($bens)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_Usuario']."</td>";
		    			echo "<td>".$dados['Salario']."</td>";
		    			echo "<td>".$dados['Data']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
			</tbody>
		</table>


	    <h3>Compras Feitas pela Universidade</h3>
	    <table class="table">
			<thead>
				<tr>
		        	<th>Identificador</th>
		        	<th>Valor</th>
		        	<th>Data de aquisição</th>
		        	<th>Tipo</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$bens = consultaBens();
		    		while ($dados = mysqli_fetch_array($bens)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_bem']."</td>";
		    			echo "<td>".$dados['Valor']."</td>";
		    			echo "<td>".$dados['Data_de_Aquisicao']."</td>";
		    			echo "<td>".$dados['Tipo']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
			</tbody>
		</table>

	    <h3>Verbas Recebidas</h3>
	    <p>
			A universidade já recebeu um total de <?php echo mysqli_fetch_array(somaValorVerbas())['total'] ?> reais em verbas.
		</p>
	    <table class="table">
			<thead>
				<tr>
		        	<th>Valor</th>
		        	<th>Data</th>
		        	<th>Unidade</th>
		     	</tr>
    		</thead>
		    <tbody>
		    	<?php
		    		$verbas = consultaVerbas();
		    		while ($dados = mysqli_fetch_array($verbas)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['Valor']."</td>";
		    			echo "<td>".$dados['Data']."</td>";
		    			echo "<td>".$dados['ID_Unidade']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
			</tbody>
		</table>		
	</div>
</main>
<?php 
	include "footer.html"; 
?>