<?php 
    require_once "conecta.php";
    
    //retorna todos os alunos
	function consultaTodosAlunos(){
	    
	    $bd= conectaBD();
	    //var_dump($bd);
	    $sql="SELECT *
                FROM Usuario
                INNER JOIN Aluno 
                ON Aluno.ID_Usuario = Usuario.ID_Usuario
                ";
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
                INNER JOIN Usuario ON Professor.ID_Usuario = Usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //listar todos os funcionarios
    function consultaTodosFuncionarios(){
        $bd= conectaBD();
        $sql = "SELECT *
                FROM Funcionario
                INNER JOIN Usuario ON Funcionario.ID_Usuario = Usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
//listar todos os cursos da graduação
    function consultaCursosGraduacao(){
        $bd= conectaBD();
        $sql="SELECT *
            FROM Cursos
            INNER JOIN Graduacao 
            ON Cursos.Codigo = Graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

//listar todos os cursos da pós
    function consultaCursosPos(){
        $bd= conectaBD();
        $sql="SELECT *
            FROM Cursos
            INNER JOIN Pos_Graduacao 
            ON Cursos.Codigo = Pos_Graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //listar todos os alunos da graduação
    function consultaAlunosGraduacao(){
        $bd= conectaBD();
        $sql="SELECT Usuario.ID_Usuario, Usuario.nome, Usuario.cpf, Usuario.ID_Unidade, Cursos.Codigo, Cursos.Nome
                FROM Usuario
                INNER JOIN Aluno ON Aluno.ID_Usuario = Usuario.ID_Usuario
                INNER JOIN Graduacao ON Aluno.Codigo = Graduacao.Codigo
                INNER JOIN Cursos ON Cursos.Codigo = Graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
//listar todos os cursos da pós
    function consultaAlunosPos(){
        $bd= conectaBD();
        $sql="SELECT Usuario.ID_Usuario, Usuario.nome, Usuario.cpf, Usuario.ID_Unidade, Cursos.Codigo, Cursos.Nome
                FROM Usuario
                INNER JOIN Aluno ON Aluno.ID_Usuario = Usuario.ID_Usuario
                INNER JOIN Pos_Graduacao ON Aluno.Codigo = Pos_Graduacao.Codigo
                INNER JOIN Cursos ON Cursos.Codigo = Pos_Graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    

    function consultaVerbas(){        
        $bd= conectaBD();
        //var_dump($bd);
        $sql="SELECT *
                FROM Verba";
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
        $sql="SELECT Projeto_Extensao.ID_Projeto, objetivo, orcamento, atividade, nome
                FROM Projeto_Extensao
                INNER JOIN Projeto ON Projeto_Extensao.ID_Projeto = Projeto.ID_Projeto
                INNER JOIN Financiador ON Projeto.ID_Financiador = Financiador.ID_Financiador";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //lista projetos d pesquisa
    function consultaProjetoPesquisa(){
        $bd= conectaBD();
        $sql="SELECT Projeto_Pesquisa.ID_Projeto, objetivo, orcamento, atividade, nome
                FROM Projeto_Pesquisa
                INNER JOIN Projeto ON Projeto_Pesquisa.ID_Projeto = Projeto.ID_Projeto
                INNER JOIN Financiador ON Projeto.ID_Financiador = Financiador.ID_Financiador";
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

    //funcao para retornar valor total de todas as verbas
    function somaValorVerbas(){
        $bd= conectaBD();
        $sql="SELECT SUM( Valor ) AS total
                FROM Verba";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //funcao que retorna todos os bens de uma determinada unidade
    //recebe como parametor o nome da unidade
    function consultaBensUnidade($nomeUnidade){
        $bd= conectaBD();
        $sql="SELECT Bens.ID_Bem, Localizacao, Valor, Data_de_Aquisicao, Bens.Tipo AS tipoBem, Unidade.ID_Unidade, nome AS nomeUnidade, Unidade.tipo AS tipoUnidade
                FROM Bens
                INNER JOIN Unidade ON Bens.ID_Unidade = Unidade.ID_Unidade
                AND Unidade.nome = '".$nomeUnidade."'";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
        
    }
    
    //funcao para retornar valor total de todos os bens de uma determinada unidade
    //recebe como parametro o nome da unidade
    function somaValorBensUnidade($nomeUnidade){
        $bd= conectaBD();
        $sql="SELECT SUM( Valor ) AS total
                FROM Bens
                INNER JOIN Unidade ON Bens.ID_Unidade = Unidade.ID_Unidade
                AND nome = '".$nomeUnidade."'";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //funcao para consultar o historico de um dado aluno
    function consultaHistoricoAluno($idAluno){
        $sql="SELECT Aluno.ID_Usuario, Disciplinas.ID_Disciplina, Notas, Frequencia, Disciplinas.Nome
                FROM Aluno
                INNER JOIN Historico ON Historico.ID_Usuario = Aluno.ID_Usuario
                AND Aluno.ID_Usuario = '".$idAluno."'
                INNER JOIN Disciplinas ON Disciplinas.ID_Disciplina = Historico.ID_Disciplina";
        $bd= conectaBD();
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //funcao para consultar as ocorrencias de um dado professor ou funcionario
    function consultaOcorrencias($id){
        //falta ajustar a consulta para filtrar as ocorrencias do professor ou funcionario especificado
        $sql="SELECT *
        FROM Ocorrencias";
        $bd= conectaBD();
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;

    }

    //insere aluno de graduacao

    //insere aluno de pos-graduacao

    //altera aluno de graduacao
    function atualizaAlunoGraduacao($idAluno){
        $sql="";
    }

    //altera aluno de pos graduacao
    function atualizaAlunoPos($idAluno){
        $sql="";
    }

    //deleta aluno de graduacao
    function deletaAlunoGraduacao($idAluno){
        $sql="";
    }

    //deleta aluno de pos graduacao
    function deletaAlunoPos($idAluno){
        $sql="";
    }

    //insere projeto pesquisa
    //retorna true se inseriu e false se deu erro
    function inserePesquisa($objetivo, $descricao, $orcamento, $atividade, $idFiananciador){
        $bd= conectaBD();
        $sql=" INSERT INTO Projeto ( Objetivo, Descricao, Orcamento, Atividade, ID_Financiador) 
        VALUES ('".$objetivo."','". $descricao."','". $orcamento."','". $atividade."','". $idFiananciador."');";
        if ($bd->query($sql) === TRUE) {
             $sql_projetopesquisa= "INSERT INTO Projeto_Pesquisa (ID_Projeto) 
                VALUES ('1');";
            $bd->query($sql_projetopesquisa);
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
    function insereBem($idUnidade, $localizacao, $valor, $data_aquisicao, $tipo){
        $bd= conectaBD();
        $sql=" INSERT INTO  Bens (Localizacao, Valor, Data_de_Aquisicao, Tipo, ID_Unidade)
            VALUES ('". $localizacao."','". $valor."','". $data_aquisicao."','". $tipo."','".$idUnidade."');";
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
        $sql= "INSERT INTO Projeto (objetivo, descricao, orcamento, atividade, ID_Financiador) 
             VALUES ('".$objetivo."','". $descricao."','". $orcamento."','". $atividades."',".$idFinanciador.");";
        if ($bd->query($sql) === TRUE) {
            $sql_projetoextensao= "INSERT INTO Projeto_Extensao (ID_Projeto) 
                VALUES ('1');";
            $bd->query($sql_projetoextensao);
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
