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
        $sql="SELECT Usuario.ID_Usuario, Usuario.nome, Usuario.cpf, Usuario.data_de_nascimento, Usuario.ID_Unidade, Cursos.Codigo, Cursos.Nome
                FROM Usuario
                INNER JOIN Aluno ON Aluno.ID_Usuario = Usuario.ID_Usuario
                INNER JOIN Graduacao ON Aluno.Codigo = Graduacao.Codigo
                INNER JOIN Cursos ON Cursos.Codigo = Graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //listar todos os alunos da pós
    function consultaAlunosPos(){
        $bd= conectaBD();
        $sql="SELECT Usuario.ID_Usuario, Usuario.nome, Usuario.cpf, Usuario.data_de_nascimento, Usuario.ID_Unidade, Cursos.Codigo, Cursos.Nome
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
        FROM Ocorrencias
        WHERE ID_Usuario='".$id."'";
        $bd= conectaBD();
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //insere ocorrencia de professor
    function insereOcorrenciaProfessor($id, $tipo, $data){
        $bd= conectaBD();
        $sql=" INSERT INTO Ocorrencias (ID_Usuario, Tipo_Ocorrencia, Data) 
        VALUES ('".$id."','". $tipo."','". $data."');";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //insere ocorrencia de professor
    function insereOcorrenciaFuncionario($id, $tipo, $data){
        $bd= conectaBD();
        $sql=" INSERT INTO Ocorrencias (ID_Usuario, Tipo_Ocorrencia, Data) 
        VALUES ('".$id."','". $tipo."','". $data."');";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //atualiza ocorrencia
    function atualizaOcorrencia($id, $tipo, $data){
        $bd= conectaBD();
        $sql=" UPDATE Ocorrencias
        SET Tipo_Ocorrencia='".$tipo."', Data='".$data."' 
        WHERE ID_Ocorrencia='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //deleta ocorrencia
    function deletaOcorrencia($id){
        $bd= conectaBD();
        $sql="DELETE FROM Ocorrencias 
        WHERE ID_Ocorrencia='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //insere aluno
    function insereAluno($nome, $cpf, $dataNasc, $unidade, $curso){
        $bd= conectaBD();
        $sql=" INSERT INTO Usuario (Nome, CPF, data_de_nascimento, ID_Unidade) 
        VALUES ('".$nome."','". $cpf."','". $dataNasc."', '".$unidade."');";
        if ($bd->query($sql) === TRUE) {
             $sql_aluno= "INSERT INTO Aluno (ID_Usuario, Codigo) 
                VALUES ('".mysqli_insert_id($bd)."', '".$curso."');";
            $bd->query($sql_aluno);
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }
    //altera aluno
    function atualizaAluno($id, $nome, $cpf, $dataNasc, $unidade){
        $bd= conectaBD();
        $sql=" UPDATE Usuario 
        SET Nome='".$nome."', CPF='".$cpf."', data_de_nascimento='".$dataNasc."', ID_Unidade='".$unidade."'
        WHERE ID_Usuario='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //deleta aluno de graduacao
    function deletaAlunoGraduacao($id){
        $bd= conectaBD();
        $sql=" DELETE FROM Aluno 
        WHERE ID_Usuario='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $sql_aluno= "DELETE FROM Usuario
                WHERE ID_Usuario='".$id."';";
            $bd->query($sql_aluno);
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //deleta aluno de pos graduacao
    function deletaAlunoPos($id){
        $bd= conectaBD();
        $sql=" DELETE FROM Aluno 
        WHERE ID_Usuario='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $sql_aluno= "DELETE FROM Usuario
                WHERE ID_Usuario='".$id."';";
            $bd->query($sql_aluno);
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //insere professor
    function insereProfessor($nome, $cpf, $dataNasc, $carreira, $nivel, $unidade){
        $bd= conectaBD();
        $sql=" INSERT INTO Usuario (Nome, CPF, data_de_nascimento, ID_Unidade) 
        VALUES ('".$nome."','". $cpf."','". $dataNasc."', '".$unidade."');";
        if ($bd->query($sql) === TRUE) {
            $sql_professor= "INSERT INTO Professor (ID_Usuario, carreira, nivel) 
                VALUES ('".mysqli_insert_id($bd)."', '".$carreira."', '".$nivel."');";
            if($bd->query($sql_professor)===FALSE)return FALSE;

            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //altera professor
    function atualizaProfessor($id, $nome, $cpf, $dataNasc, $carreira, $nivel, $unidade){
        $bd= conectaBD();
        $sql=" UPDATE Usuario 
        SET Nome='".$nome."', CPF='".$cpf."', data_de_nascimento='".$dataNasc."', ID_Unidade='".$unidade."' 
        WHERE ID_Usuario='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $sql_professor= "UPDATE Professor
                SET carreira='".$carreira."', nivel='".$nivel."' 
                WHERE ID_Usuario='".$id."';";
            $bd->query($sql_professor);
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //deleta professor
    function deletaProfessor($id){
        $bd= conectaBD();
        $sql=" DELETE FROM Professor 
        WHERE ID_Usuario='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $sql_professor= "DELETE FROM Usuario
                WHERE ID_Usuario='".$id."';";
            $bd->query($sql_professor);
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //insere funcionario
    function insereFuncionario($nome, $cpf, $dataNasc, $funcao, $unidade){
        $bd= conectaBD();
        $sql=" INSERT INTO Usuario (Nome, CPF, data_de_nascimento, ID_Unidade) 
        VALUES ('".$nome."','". $cpf."','". $dataNasc."', '".$unidade."');";
        if ($bd->query($sql) === TRUE) {
            $sql_funcionario= "INSERT INTO Funcionario (ID_Usuario, Funcao) 
                VALUES ('".mysqli_insert_id($bd)."', '".$funcao."');";
            //$sql_funcionario= "INSERT INTO Funcionario (ID_Usuario) 
            //    VALUES ('".mysqli_insert_id($bd)."');";
            $bd->query($sql_funcionario);
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //altera funcionario
    function atualizaFuncionario($id, $nome, $cpf, $dataNasc, $funcao, $unidade){
        $bd= conectaBD();
        $sql=" UPDATE Usuario 
        SET Nome='".$nome."', CPF='".$cpf."', data_de_nascimento='".$dataNasc."', ID_Unidade='".$unidade."' 
        WHERE ID_Usuario='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $sql_professor= "UPDATE Funcionario
                SET Funcao='".$funcao."' 
                WHERE ID_Usuario='".$id."';";
            $bd->query($sql_professor);
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //deleta funcionario
    function deletaFuncionario($id){
        $bd= conectaBD();
        $sql=" DELETE FROM Funcionario 
        WHERE ID_Usuario='".$id."';";
        if ($bd->query($sql) === TRUE) {
            $sql_funcionario= "DELETE FROM Usuario
                WHERE ID_Usuario='".$id."';";
            $bd->query($sql_funcionario);
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //insere projeto pesquisa
    //retorna true se inseriu e false se deu erro
    function inserePesquisa($objetivo, $descricao, $orcamento, $atividade, $idFiananciador, $idAluno, $idProfessor, $bolsa){
        $bd= conectaBD();
        $sql=" INSERT INTO Projeto ( Objetivo, Descricao, Orcamento, Atividade, ID_Financiador) 
        VALUES ('".$objetivo."','". $descricao."','". $orcamento."','". $atividade."','". $idFiananciador."');";
        if ($bd->query($sql) === TRUE) {
            $idProjeto=mysqli_insert_id($bd);
            $sql_projetopesquisa= "INSERT INTO Projeto_Pesquisa (ID_Projeto) 
                VALUES ('".$idProjeto."');";
            $bd->query($sql_projetopesquisa);
            if($idAluno!=null){
                $sql='UPDATE Aluno SET Ori_ID_Usuario =  '.$idProfessor.' WHERE  ID_Usuario ='.$idAluno;
                $bd->query($sql);
                $sql= "INSERT INTO Participa (`ID_Usuario`, `ID_Projeto`, `Bolsa`) VALUES (".$idAluno.", ".$idProjeto.", ".$bolsa.")";
                var_dump($sql);
                $bd->query($sql);
            }
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
    function insereExtensao( $objetivo, $descricao, $orcamento, $atividades, $idFinanciador, $idAluno, $idProfessor, $bolsa){
        $bd= conectaBD();
        $sql= "INSERT INTO Projeto (objetivo, descricao, orcamento, atividade, ID_Financiador) 
             VALUES ('".$objetivo."','". $descricao."','". $orcamento."','". $atividades."',".$idFinanciador.")";
        if ($bd->query($sql) === TRUE) {
            $idProjeto=mysqli_insert_id($bd);
            $sql_projetoextensao= "INSERT INTO Projeto_Extensao (ID_Projeto) 
                VALUES ('".$idProjeto."');";
            $bd->query($sql_projetoextensao);
            if($idAluno!=null){
                $sql='UPDATE Aluno SET Ori_ID_Usuario =  '.$idProfessor.' WHERE  ID_Usuario ='.$idAluno;
                $bd->query($sql);
                $sql= "INSERT INTO Participa (`ID_Usuario`, `ID_Projeto`, `Bolsa`) VALUES (".$idAluno.", ".$idProjeto.", ".$bolsa.")";
                $bd->query($sql);
            }
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

    //atualiza bem
    function atualizaBem($idBem, $unidade, $localizacao, $valor, $data, $tipo){
        $bd= conectaBD();
        $sql=" UPDATE Bens 
            SET Localizacao='".$localizacao."', Valor='".$valor."', Data_de_Aquisicao='".$data."', Tipo='".$tipo."', ID_Unidade='".$unidade."'
            WHERE ID_bem='".$idBem."';";
        if ($bd->query($sql) === TRUE) {
            $bd->close();
            return TRUE;
        } else {
            echo "Error: " . $sql . "<br>" . $bd->error;
        }
        $bd->close();
        return FALSE;
    }

    //deleta bem
    function deletaBem($idBem){
        $bd= conectaBD();
        $sql=" DELETE FROM Bens 
            WHERE ID_bem='".$idBem."';";
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
