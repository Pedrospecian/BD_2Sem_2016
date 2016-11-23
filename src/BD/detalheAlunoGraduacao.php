<?php 
	include "header.html"; 
	include "queries.php";
?>
<main>
	<div class="container">
		<?php if(isset($_POST['detalhes'])){ ?>
		<h2>Aluno de Graduação: <?php echo $_POST['nomeAluno'];?></h2>
		<h2>Curso: <?php echo mysqli_fetch_array(consultaNomeCursoPorAluno($_POST['idAluno']))['Nome']; ?></h2>
	    <h3>Projetos de extensão do aluno</h3>
	    <table class="table">
			<thead>
			    <tr>
	    		    <th>Descrição</th>
	    		    <!--<th>Atividade</th>-->
	    		    <th>Orçamento</th>
	    		    <th>Data Início</th>
	    		    <th>Data Término</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaProjetoExtensaoAluno($_POST['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			//var_dump($dados);
		    			echo "<tr>";
		    			echo "<td>".$dados["Descricao"]."</td>";
		    			//echo "<td>".$dados["Atividade"]."</td>";
		    			echo "<td>".$dados["Orcamento"]."</td>";
		    			echo "<td>".$dados["Data_Inicio"]."</td>";
		    			echo "<td>".$dados["Data_Termino"]."</td>";
		    			echo "</tr>";
		    		}
		    	?>
		    	
			</tbody>
		</table>

	    <h3>Projetos de pesquisa do aluno</h3>
	    <table class="table">
			<thead>
			    <tr>
	    		    <th>Descrição</th>
	    		    <!--<th>Atividade</th>-->
	    		    <th>Orçamento</th>
	    		    <th>Data Início</th>
	    		    <th>Data Término</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaProjetoPesquisaAluno($_POST['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			//var_dump($dados);
		    			echo "<tr>";
		    			echo "<td>".$dados["Descricao"]."</td>";
		    			//echo "<td>".$dados["Atividade"]."</td>";
		    			echo "<td>".$dados["Orcamento"]."</td>";
		    			echo "<td>".$dados["Data_Inicio"]."</td>";
		    			echo "<td>".$dados["Data_Termino"]."</td>";
		    			echo "</tr>";
		    		}
		    	?>
		    	
			</tbody>
		</table>

	    <h3>Disciplinas cursadas pelo aluno</h3>
	    <table class="table">
			<thead>
			    <tr>
	    		    <th>Código disciplina</th>
	    		    <th>Nome disciplina</th>
	    		    <th>Nota do aluno</th>
	    		    <th>Frequencia do aluno</th>
			   	</tr>
	    	</thead>
		    <tbody>
		        
		    	<?php
		    		$alunos = consultaHistoricoAluno($_POST['idAluno']);
		    		while ($dados = mysqli_fetch_array($alunos)) {
		    			echo "<tr>";
		    			echo "<td>".$dados['ID_Disciplina']."</td>";
		    			echo "<td>".$dados['Nome']."</td>";
		    			echo "<td>".$dados['Notas']."</td>";
		    			echo "<td>".$dados['Frequencia']."</td>";
		    			echo "</tr>";
		    		}
		    	?>
		    	
			</tbody>
		</table>
		<?php }
		if(isset($_POST['update'])) { var_dump($_POST) ?>
			<form action="atualizaAluno.php" method="GET" class="form-horizontal">
				<input type="hidden" name="idAluno-alt" value="<?php echo $_POST['idAluno']; ?>"/>
				<div class="row">
					<div class="form-group">
						<label for="nome-alt" class="control-label col-sm-2 text-right">Nome</label>
						<div class="col-sm-5">
							<input class="form-control" type="text" name="nome-alt" value="<?php echo $_POST['nomeAluno']; ?>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="cpf-alt" class="control-label col-sm-2 text-right">CPF</label>
						<div class="col-sm-5"><input class="form-control" type="text" name="cpf-alt" value="<?php echo $_POST['cpfAluno']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="data-nascimento-alt" class="control-label col-sm-2 text-right">Data de Nascimento</label>
						<div class="col-sm-5"><input class="form-control" type="date" name="data-nascimento-alt" value="<?php echo $_POST['dataNasc']; ?>"/></div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="unidade-alt" class="control-label col-sm-2 text-right">Unidade</label>
						<div class="col-sm-5">
							<select class="form-control" name="unidade-alt">
								<option value="">--</option>
								<?php
									$unidades = consultaUnidades();
									while ($dados = mysqli_fetch_array($unidades)) {
										if($dados['ID_Unidade']==$_POST['unidade']) {
	                                       	echo "<option selected value=".$dados['ID_Unidade'].">".$dados['Nome_Unidade']."</option>";
										}else {
											echo "<option value=".$dados['ID_Unidade'].">".$dados['Nome_Unidade']."</option>";
										}
							        }
								?>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-default col-sm-offset-2" type="submit" name="AtualizarAluno">Atualizar Aluno</button>
				</div>
			</form>
		<?php }
		if(isset($_POST['delete'])) {
			var_dump($_POST);
			$deletou = deletaAlunoGraduacao($_POST['idAluno']);
		    if($deletou == TRUE){
		        echo "Aluno excluído com sucesso!";
		        echo "<br>";
		    	echo "<a href='graduacao.php'>Voltar</a>";
		    }
		}
		?>
	</div>
</main>
<?php 
	include "footer.html"; 
?>