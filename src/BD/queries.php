<?php 
    require_once "conecta.php";
    
    //retorna todos os alunos
	function consultaTodosAlunos(){
	    
	    $bd= conectaBD();
	    //var_dump($bd);
	    $sql="SELECT *
                FROM Usuario
                INNER JOIN Aluno 
                ON Aluno.ID_Usuario = Usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        //var_dump($resultado);
        //while ($dados = mysqli_fetch_array($resultado)) {
        //    var_dump($dados);
        //}
        //var_dump($result);
        $bd->close();
        return $resultado;
	}
//listar todos os professores
    function consultaTodosProfessores(){
        $bd= conectaBD();
        $sql = "SELECT *
                FROM Professor
                INNER JOIN Usuario ON Professor.ID_Usu = Usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //listar todos os funcionarios
    function consultaTodosFuncionarios(){
        $bd= conectaBD();
        $sql = "SELECT *
                FROM Funcionario
                INNER JOIN Usuario ON Funcionario.ID_Usu = Usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
//listar todos os alunos da graduação
    function consultaCursosGraduacao(){
        $bd= conectaBD();
        $sql="SELECT *
            FROM Cursos
            INNER JOIN Graduacao 
            ON Cursos.ID_Cur = Graduacao.ID_Cur";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

//listar todos os alunos da pós
    function consultaCursosPos(){
        $bd= conectaBD();
        $sql="SELECT *
            FROM Cursos
            INNER JOIN Pos_Graduacao 
            ON Cursos.ID_Cur = Pos_Graduacao.ID_Cur";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

//lista financiadores (id e tipo e nome)
    function consultaFinanciadores(){
        $bd= conectaBD();
        $sql="SELECT *
                FROM Financiador";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //lista financeiadores (id e tipo e nome)
    function consultaUnidades(){
        $bd= conectaBD();
        $sql="SELECT *
                FROM Unidade";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //lista projetos de extensao
    function consultaProjetoExtensao(){
        $bd= conectaBD();
        $sql="SELECT ID_Projeto_extensao, objetivo, orcamento, atividades, nome
            FROM Projeto_Extensao
            INNER JOIN Financiador 
            ON Projeto_Extensao.ID_Financiador = Financiador.ID_Financiador";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //lista projetos d pesquisa
    function consultaProjetoPesquisa(){
        $bd= conectaBD();
        $sql="SELECT ID_Projeto_Pesquisa, objetivo, orcamento, atividade, nome
            FROM Projeto_Pesquisa
            INNER JOIN Financiador 
            ON Projeto_Pesquisa.ID_Fin = Financiador.ID_Financiador";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //lista todas as informacoes dos bens
    function consultaBens(){
        $bd= conectaBD();
        $sql="SELECT * 
                FROM  Bens ";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //funcao para retornar valor total de todos os bens
    function somaValorBens(){
        $bd= conectaBD();
        $sql="SELECT SUM( Valor ) AS total
                FROM Bens";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //funcao que retorna todos os bens de uma determinada unidade
    //recebe como parametor o nome da unidade
    function consultaBensUnidade($nomeUnidade){
        $bd= conectaBD();
        $sql="SELECT Bens.ID_Ben, Identificador, Localizacao, Valor, Data_de_Aquisicao, Bens.tipo tipoBem, Unidade.ID_Unidade,
                nome AS nomeUnidade, Unidade.tipo AS tipoUnidade
                FROM Bens
                INNER JOIN Possui ON Bens.ID_Ben = Possui.ID_Ben
                INNER JOIN Unidade ON Possui.ID_Unidade = Unidade.ID_Unidade
                AND nome = '".$nomeUnidade."'";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
        
    }
    
    //funcao para retornar valor total de todos os bens de uma determinada unidade
    //recebe como parametro o nome da unidade
    function somaValorBensUnidade($nomeUnidade){
        $bd= conectaBD();
        $sql="SELECT SUM(Valor) AS total
                FROM Bens
                INNER JOIN Possui ON Bens.ID_Ben = Possui.ID_Ben
                INNER JOIN Unidade ON Possui.ID_Unidade = Unidade.ID_Unidade
                AND nome = '".$nomeUnidade."'";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //funcao para consultar o historico de um dado aluno
    function consultaHistoricoAluno($idAluno){
        $sql="SELECT Aluno.ID_Aluno, Disciplinas.ID_Dis, Notas, Frequencia, Disciplinas.Codigo, Disciplinas.nome
                FROM Aluno
                INNER JOIN Historico ON Historico.ID_Alu = Aluno.ID_Aluno
                AND ID_Aluno = '".$idAluno."'
                INNER JOIN Disciplinas ON Disciplinas.ID_dis = Historico.ID_Dis";
        $bd= conectaBD();
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //funcao para consultar as ocorrencias de um dado professor ou funcionario
    function consultaOcorrencias($id){
        //falta implementar a consulta
    }

    //insere projeto pesquisa
    //retorna true se inseriu e false se deu erro
    function inserePesquisa($objetivo, $descricao, $orcamento, $atividade, $idFiananciador){
        $bd= conectaBD();
        $sql=" INSERT INTO Projeto_Pesquisa ( Objetivo, Descricao, Orcamento, Atividade, ID_Fin) 
        VALUES ('".$objetivo."','". $descricao."','". $orcamento."','". $atividade."','". $idFiananciador."');";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //insere bem
    //retorna true se inseriu e false se deu erro
    function insereBem($identificador, $localizacao, $valor, $data_aquisicao, $tipo){
        $bd= conectaBD();
        $sql=" INSERT INTO Bens ( Identificador, Localizacao, Valor, Data_de_Aquisicao, Tipo) 
        VALUES ('".$identificador."','". $localizacao."','". $valor."','". $data_aquisicao."','". $tipo."');";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }
    
     //insere projeto extensao
    //retorna true se inseriu e false se deu erro
    function insereExtensao( $objetivo, $descricao, $orcamento, $atividades, $idFinanciador){
            $bd= conectaBD();
        $sql= "INSERT INTO Projeto_Extensao (objetivo, descricao, orcamento, atividades, ID_Financiador) 
             VALUES ('".$objetivo."','". $descricao."','". $orcamento."','". $atividades."',".$idFinanciador.");";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }
    
    //Liste o nome de todos os professores que tiveram, entre suas atribuições, cargos relacionados a funções 
    //gratificadas e/ou cargos comissionados. Nessa listagem, informe o nome do professor, as datas referentes ao 
    //período de ocupação desse cargos e os setores administrativos relacionados aos cargos.

	
?>
