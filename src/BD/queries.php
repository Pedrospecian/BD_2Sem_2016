<?php 
    require_once "conecta.php";
    
    
    consultaTodosAlunos();
    
	function consultaTodosAlunos(){
	    
	    $bd= conectaBD();
	    var_dump($bd);
	    $sql="SELECT *
                FROM Usuario
                INNER JOIN Aluno 
                ON Aluno.ID_Usu = Usuario.ID_Usu";
        $resultado = $bd->query($sql);
        var_dump($resultado);
        while ($dados = mysqli_fetch_array($resultado)) {
            var_dump($dados);
        }
        var_dump($result);
        return $resultado;
	}
//listar todos os professores
    function consultaTodosProfessores(){
        $bd= conectaBD();
        $sql = "SELECT nome, carreira, nivel
                FROM Professor
                INNER JOIN Usuario ON Professor.ID_Usu = Usuario.ID_Usu";
        $resultado = $bd->query($sql);
        return $resultado;
    }
    
//listar todos os alunos da graduação

//listar todos os alunos da pós
	
?>
