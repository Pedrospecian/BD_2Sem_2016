<?php 
    require_once "conecta.php";
    
    //retorna todos os alunos
	function consultaTodosAlunos(){
	    
	    $bd= conectaBD();
	    //var_dump($bd);
	    $sql="SELECT *
                FROM usuario
                INNER JOIN aluno 
                ON aluno.ID_Usuario = usuario.ID_Usuario
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
	
	//lista todos os servidores
	function consultaServidores(){
        $bd= conectaBD();
        $sql="SELECT usuario.ID_Usuario, nome
                FROM servidor
                INNER JOIN usuario ON servidor.ID_Usuario = usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
	}
	
//listar todos os professores
    function consultaTodosProfessores(){
        $bd= conectaBD();
        $sql = "SELECT *
                FROM professor
                INNER JOIN usuario ON professor.ID_Usuario = usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

//listar todos os professores
    function consultaProfessoresSemOcorrencia(){
        $bd= conectaBD();
        $sql = "SELECT *
                FROM professor
                INNER JOIN usuario ON professor.ID_Usuario = usuario.ID_Usuario
                LEFT JOIN ocorrencias ON professor.ID_Usuario = ocorrencias.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

//listar todas as atribuicoes de professores
    function consultaAtribuicoesProfessores(){
        $bd= conectaBD();
        $sql = "SELECT *
                FROM professor
                INNER JOIN usuario ON professor.ID_Usuario = usuario.ID_Usuario
                LEFT JOIN atribuicoes on professor.ID_Usuario = atribuicoes.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //listar todos os funcionarios
    function consultaTodosFuncionarios(){
        $bd= conectaBD();
        $sql = "SELECT *
                FROM funcionario
                INNER JOIN usuario ON funcionario.ID_Usuario = usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //lista todos os servidores
    function consultaFolhaPagamento(){
        $bd= conectaBD();
        $sql="SELECT Salario, Data
                FROM folha_de_pagamento";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    function consultaNomeCursoPorAluno($id) {
        $bd= conectaBD();
        $sql="SELECT *
            FROM Cursos
            WHERE Codigo IN (SELECT Codigo FROM Aluno WHERE ID_Usuario='".$id."')";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
//listar todos os cursos da graduação
    function consultaCursosGraduacao(){
        $bd= conectaBD();
        $sql="SELECT *
            FROM cursos
            INNER JOIN graduacao 
            ON cursos.Codigo = graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

//listar todos os cursos da pós
    function consultaCursosPos(){
        $bd= conectaBD();
        $sql="SELECT *
            FROM cursos
            INNER JOIN pos_graduacao 
            ON cursos.Codigo = pos_graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
//listar todos os cursos da pós
    function consultaCursosLatuSensu(){
        $bd= conectaBD();
        $sql="SELECT *, (SELECT COUNT(*) FROM aluno WHERE Ise_Codigo IS NOT NULL AND Codigo=pos_graduacao.Codigo) as Qte_Isentos 
            FROM cursos
            INNER JOIN pos_graduacao ON cursos.Codigo = Pos_Graduacao.Codigo
            INNER JOIN latu_sensu ON cursos.Codigo = Latu_Sensu.Codigo
            LEFT JOIN aluno ON latu_sensu.Codigo = aluno.Codigo

            GROUP BY Cursos.Codigo
            ORDER BY Latu_Sensu.Valor_Mensalidade
           ";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //listar todos os alunos da graduação
    function consultaAlunosGraduacao(){
        $bd= conectaBD();
        $sql="SELECT usuario.ID_Usuario, usuario.nome, usuario.cpf, usuario.data_de_nascimento, usuario.ID_Unidade, Cursos.Codigo, Cursos.Nome
                FROM Usuario
                INNER JOIN Aluno ON aluno.ID_Usuario = usuario.ID_Usuario
                INNER JOIN Graduacao ON aluno.Codigo = Graduacao.Codigo
                INNER JOIN Cursos ON Cursos.Codigo = Graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //listar todos os alunos da pós
    function consultaAlunosPos(){
        $bd= conectaBD();
        $sql="SELECT usuario.ID_Usuario, usuario.nome, usuario.cpf, usuario.data_de_nascimento, usuario.ID_Unidade, Cursos.Codigo, Cursos.Nome
                FROM usuario
                INNER JOIN aluno ON aluno.ID_Usuario = usuario.ID_Usuario
                INNER JOIN pos_graduacao ON aluno.Codigo = pos_graduacao.Codigo
                INNER JOIN cursos ON cursos.Codigo = pos_graduacao.Codigo";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    

    function consultaVerbas(){        
        $bd= conectaBD();
        //var_dump($bd);
        $sql="SELECT *
                FROM verba";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //lista financiadores (id e tipo e nome)
    function consultaFinanciadores(){
        $bd= conectaBD();
        $sql="SELECT *
                FROM financiador";
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
        $sql="SELECT projeto_extensao.ID_Projeto, objetivo, orcamento, financiador.nome as financiadorNome, usuario.nome as usuarioNome, descricao, bolsa, participa.ID_Usuario, financiador.id_Financiador, Data_Inicio, Data_Termino
                FROM projeto_extensao
                INNER JOIN projeto ON projeto_extensao.ID_Projeto = projeto.ID_Projeto
                INNER JOIN financiador ON projeto.ID_Financiador = financiador.ID_Financiador
                INNER JOIN participa ON participa.ID_Projeto = projeto.ID_Projeto
                INNER JOIN usuario ON participa.ID_Usuario = usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //lista projetos d pesquisa
    function consultaProjetoPesquisa(){
        $bd= conectaBD();
        $sql="SELECT projeto_pesquisa.ID_Projeto, objetivo, orcamento, financiador.nome as nomeFinanciador, usuario.nome as nomeUsuario, descricao, bolsa, participa.ID_Usuario, financiador.id_Financiador, Data_Inicio, Data_Termino
                FROM projeto_pesquisa
                INNER JOIN projeto ON projeto_pesquisa.ID_Projeto = projeto.ID_Projeto
                INNER JOIN financiador ON projeto.ID_Financiador = financiador.ID_Financiador
                INNER JOIN participa ON participa.ID_Projeto = projeto.ID_Projeto
                INNER JOIN usuario ON participa.ID_Usuario = usuario.ID_Usuario";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    function consultaCoordenadorProjeto($idProjeto){
        $bd= conectaBD();
        $sql="SELECT usuario.nome, usuario.ID_Usuario, Indice_Pequisador
                FROM coordena
                INNER JOIN usuario ON coordena.ID_Usuario = usuario.ID_Usuario
                WHERE coordena.ID_Projeto =".$idProjeto;
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
        
    }
    
    //consulta projeto de pesquisa de um aluno
    function consultaProjetoPesquisaAluno($idAluno){
        $bd= conectaBD();
        $sql = "SELECT Data_Inicio, Descricao, Data_Termino, Orcamento, projeto.ID_Projeto
                    FROM projeto
                    INNER JOIN projeto_pesquisa ON projeto.ID_Projeto = projeto_pesquisa.ID_Projeto
                    INNER JOIN participa ON participa.ID_Projeto = projeto_pesquisa.ID_Projeto
                    WHERE ID_Usuario =".$idAluno;
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    function consultaProjetoExtensaoAluno($idAluno){
        $bd= conectaBD();
        $sql = "SELECT Data_Inicio, Descricao, Data_Termino, Orcamento, projeto.ID_Projeto
                    FROM projeto
                    INNER JOIN projeto_extensao ON projeto.ID_Projeto = projeto_extensao.ID_Projeto
                    INNER JOIN participa ON participa.ID_Projeto = projeto_extensao.ID_Projeto
                    WHERE participa.ID_Usuario =".$idAluno;
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    function consultaAtividades($idProjeto){
        $bd= conectaBD();
        $sql="SELECT Extensao_Possui.ID_Ati, localizacao, Data_Atividade , ID_Projeto
                FROM Extensao_Possui
                INNER JOIN Atividades_Extensao ON Atividades_Extensao.ID_Ati = Extensao_Possui.ID_Ati
                WHERE Extensao_Possui.ID_Projeto =".$idProjeto;
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    //lista todas as informacoes dos bens
    function consultaBens(){
        $bd= conectaBD();
        $sql="SELECT * 
                FROM  Bens, Unidade
                WHERE Bens.ID_Unidade = Unidade.ID_Unidade";
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
        $sql="SELECT Bens.ID_Bem AS id, Localizacao, Valor, Data_de_Aquisicao, Bens.Tipo AS tipoBem, Unidade.ID_Unidade, Nome_Unidade AS nomeUnidade
                FROM Bens
                INNER JOIN Unidade ON Bens.ID_Unidade = Unidade.ID_Unidade
                AND Nome_Unidade LIKE '%".$nomeUnidade."%'";
                //var_dump($sql);
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
        
    }
    
    //funcao para retornar valor total de todos os bens de uma determinada unidade
    //recebe como parametro o nome da unidade
    function somaValorBensUnidade($nomeUnidade){
        $bd= conectaBD();
        $sql="SELECT SUM( Valor ) AS total
                FROM bens
                INNER JOIN Unidade ON Bens.ID_Unidade = Unidade.ID_Unidade
                AND Nome_Unidade = '".$nomeUnidade."'";
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //funcao para consultar o historico de um dado aluno
    function consultaHistoricoAluno($idAluno){
        $sql="SELECT aluno.ID_Usuario, Disciplinas.ID_Disciplina, Notas, Frequencia, Disciplinas.Nome
                FROM aluno
                INNER JOIN Historico ON Historico.ID_Usuario = aluno.ID_Usuario
                AND aluno.ID_Usuario = '".$idAluno."'
                INNER JOIN Disciplinas ON Disciplinas.ID_Disciplina = Historico.ID_Disciplina";
        $bd= conectaBD();
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //funcao para consultar as ocorrencias de um dado professor ou funcionario
    function consultaOcorrencias($id){
        $sql="SELECT *
        FROM Ocorrencias
        WHERE ID_Usuario='".$id."'";
        $bd= conectaBD();
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    function consultaOcorrenciaProfessores(){
         //falta ajustar a consulta para filtrar as ocorrencias do professor ou funcionario especificado
        $sql="SELECT ID_Ocorrencia, Tipo_Ocorrencia, usuario.ID_Usuario, nome, cpf, Data_Inicio, Data_Final
                FROM Ocorrencias
                INNER JOIN Professor
                INNER JOIN Usuario ON usuario.ID_Usuario = Professor.ID_Usuario
                WHERE Ocorrencias.ID_Usuario = Professor.ID_Usuario;";
        $bd= conectaBD();
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }
    
    function consultaOcorrenciaFuncionarios(){
         //falta ajustar a consulta para filtrar as ocorrencias do professor ou funcionario especificado
        $sql="SELECT ID_Ocorrencia, Tipo_Ocorrencia, usuario.ID_Usuario, nome, cpf, Data_Inicio, Data_Final
                FROM Ocorrencias
                INNER JOIN Funcionario
                INNER JOIN Usuario ON usuario.ID_Usuario = Funcionario.ID_Usuario
                WHERE Ocorrencias.ID_Usuario = Funcionario.ID_Usuario;";
        $bd= conectaBD();
        $resultado = $bd->query($sql);
        $bd->close();
        return $resultado;
    }

    //insere ocorrencia de professor
    function insereOcorrenciaProfessor($id, $tipo, $data){
        $bd= conectaBD();
        $sql=" INSERT INTO Ocorrencias (ID_Usuario, Tipo_Ocorrencia, Data_Inicio, Data_Final) 
        VALUES ('".$id."','". $tipo."','". $data."', '".$data."');";
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
    function insereOcorrenciaFuncionario($id, $tipo, $data_inicio, $data_final){
        $bd= conectaBD();
        $sql=" INSERT INTO Ocorrencias (ID_Usuario, Tipo_Ocorrencia, Data_Inicio, Data_Final) 
        VALUES ('".$id."','". $tipo."','". $data_inicio."', '".$data_final."');";
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
    function atualizaOcorrencia($id, $tipo, $data_inicio, $data_final){
        $bd= conectaBD();
        $sql=" UPDATE Ocorrencias
        SET Tipo_Ocorrencia='".$tipo."', Data_Inicio='".$data_inicio."', Data_Final='".$data_final."' 
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
            $sql_servidor= "INSERT INTO Servidor (ID_Usuario) 
                VALUES ('".mysqli_insert_id($bd)."');";
                $sql_folhapagamento= "INSERT INTO Folha_de_pagamento (ID_Usuario, Data, salario) 
                VALUES ('".mysqli_insert_id($bd)."', '2016-11-10', '870');";
            if($bd->query($sql_professor)===FALSE && $bd->query($sql_servidor)===FALSE && $bd->query($sql_folhapagamento)===FALSE){
                echo "Error: " . $sql . "<br>" . $bd->error;
                return FALSE;
            }

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
        $sql="INSERT INTO Usuario(nome, cpf, Sexo , data_de_nascimento, ID_Unidade) 
        VALUES ('".$nome."','".$cpf."', 'm', '".$dataNasc."', '".$unidade."');";
        if ($bd->query($sql) === TRUE) {
            $ident=mysqli_insert_id($bd);
            $sql_funcionario= "INSERT INTO Funcionario (ID_Usuario, Funcao) 
                VALUES ('".$ident."', '".$funcao."');";
            $sql_servidor= "INSERT INTO Servidor (ID_Usuario) 
                VALUES ('".$ident."');";
            $sql_folhapagamento= "INSERT INTO folha_de_pagamento (Data, salario) 
                VALUES ('2016-12-10', '870');";
                //var_dump($bd->query($sql_funcionario));
            if($bd->query($sql_funcionario)===FALSE && $bd->query($sql_servidor)===FALSE && $bd->query($sql_folhapagamento)===FALSE){
                echo "Error: " . $sql . "<br>" . $bd->error;
                return FALSE;
            }
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
    function inserePesquisa($objetivo, $descricao, $orcamento, $idFiananciador, $idAluno, $idProfessor, $bolsa, $dataInicio, $dataFim){
        $bd= conectaBD();
        $sql = "INSERT INTO Projeto (objetivo, Data_Inicio, Descricao, Data_Termino, Orcamento, ID_Financiador)
        VALUES ('".$objetivo."',' ".$dataInicio."', '". $descricao."',' ".$dataFim."', ". $orcamento.", ". $idFiananciador.")";
        if ($bd->query($sql) === TRUE) {
            $idProjeto=mysqli_insert_id($bd);
            $sql_projetopesquisa= "INSERT INTO Projeto_Pesquisa (ID_Projeto) 
                VALUES ('".$idProjeto."');";
            $bd->query($sql_projetopesquisa);
            if($idAluno!=null){
                $sql="INSERT INTO  Coordena (ID_Projeto ,Indice_Pequisador ,Bolsa_Pesquisador,ID_Usuario)
                    VALUES ('".$idProjeto."',  0,  ".$bolsa.",  ".$idProfessor.");";
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

    //insere projeto extensao
    //retorna true se inseriu e false se deu erro
    function insereExtensao( $objetivo, $descricao, $orcamento, $idFinanciador, $idAluno, $idServidor, $bolsa, $dataInicio, $dataFim){
        $bd= conectaBD();
        $sql = "INSERT INTO Projeto (objetivo, Data_Inicio, Descricao, Data_Termino, Orcamento, ID_Financiador)
        VALUES ('".$objetivo."',' ".$dataInicio."', '". $descricao."',' ".$dataFim."', ". $orcamento.", ". $idFinanciador.")";
        if ($bd->query($sql) === TRUE) {
            $idProjeto=mysqli_insert_id($bd);
            $sql_projetoextensao= "INSERT INTO Projeto_Extensao (ID_Projeto, ID_Usuario) 
                VALUES ('".$idProjeto."', ".$idServidor.");";
            $bd->query($sql_projetoextensao);
            if($idAluno!=null){
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
    
    function insereAtividade($idProjeto, $data, $localizacao){
         $bd= conectaBD();
        $sql="INSERT INTO Atividades_Extensao (Localizacao, Data_Atividade) VALUES ('".$localizacao."', '".$data."')";
        if($bd->query($sql)){
            $idAtividade=mysqli_insert_id($bd);
            $sql="INSERT INTO Extensao_Possui (`ID_Ati`, `ID_Projeto`) VALUES (".$idAtividade.", ".$idProjeto.")";
            $bd->query($sql);
        }
        $bd->close();
        return TRUE;
        
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
    
    function deletaPesquisa($idProjeto){
        $bd= conectaBD();
        $sql= "DELETE FROM Participa WHERE ID_Projeto =".$idProjeto;
        $bd->query($sql);
        $sql= "DELETE FROM Coordena WHERE ID_Projeto=".$idProjeto;
        $bd->query($sql);
        $sql= "DELETE FROM Projeto_Pesquisa WHERE ID_Projeto =".$idProjeto;
        $bd->query($sql);
        $sql= "DELETE FROM Projeto WHERE ID_Projeto =".$idProjeto;
        $bd->query($sql);
        $bd->close();
    }
    
    function deletaExtensao($idProjeto){
        $bd= conectaBD();
        $sql= "SELECT ID_Ati FROM Extensao_Possui WHERE ID_Projeto =".$idProjeto;
        $atividades= $bd->query($sql);
        while($dados = mysqli_fetch_array($atividades)){
            deletarAtividade($dados['ID_Ati']);
        }
        $sql= "DELETE FROM Extensao_Possui WHERE ID_Projeto=".$idProjeto;
        $bd->query($sql);
        $sql= "DELETE FROM Participa WHERE ID_Projeto =".$idProjeto;
        $bd->query($sql);
        $sql= "DELETE FROM Projeto_Extensao WHERE ID_Projeto =".$idProjeto;
        $bd->query($sql);
        $sql= "DELETE FROM Projeto WHERE ID_Projeto =".$idProjeto;
        $bd->query($sql);
        $bd->close();
    }
    
    function deletarAtividade($idAtividade){
        $bd= conectaBD();
        $sql="DELETE FROM Atividades_Extensao WHERE ID_Ati=".$idAtividade;
        $bd->query($sql);
        $bd->close();
    }
    
    function alteraPesquisa($objetivo, $descricao, $orcamento, $idFiananciador, $idAluno, $idProfessor, $bolsa, $dataInicio, $dataFim, $idProjeto, $indicePesquisador){
        $bd= conectaBD();
        $sql = "UPDATE Projeto SET objetivo='".$objetivo."', Data_Inicio='".$dataInicio."', Descricao='". $descricao."', Data_Termino=' ".$dataFim."', Orcamento=". $orcamento.", ID_Financiador=". $idFiananciador."
            WHERE ID_Projeto=".$idProjeto;
        if ($bd->query($sql) === TRUE) {
            if($idAluno!=null){
                $sql="UPDATE Coordena SET Indice_Pequisador=".$indicePesquisador." ,Bolsa_Pesquisador=".$bolsa.",ID_Usuario=".$idProfessor."
                    WHERE ID_Projeto=".$idProjeto;
                $bd->query($sql);
                $sql= "UPDATE Participa (ID_Usuario=(".$idAluno.", Bolsa=".$bolsa.")
                    WHERE ID_Projeto=".$idProjeto;
                $bd->query($sql);
            }
            $bd->close();
            return TRUE;
        }
    }
    
    function alteraExtensao( $objetivo, $descricao, $orcamento, $idFinanciador, $idAluno, $idServidor, $bolsa, $dataInicio, $dataFim, $idProjeto){
        $bd= conectaBD();
        $sql = "UPDATE Projeto SET objetivo='".$objetivo."', Data_Inicio='".$dataInicio."', Descricao='". $descricao."', Data_Termino=' ".$dataFim."', Orcamento=". $orcamento.", ID_Financiador=". $idFiananciador."
            WHERE ID_Projeto=".$idProjeto;

        if ($bd->query($sql) === TRUE) {
            $idProjeto=mysqli_insert_id($bd);
            $sql= "UPDATE Projeto_Extensao SET ID_Usuario= ".$idServidor."
                WHERE ID_Projeto=".$idProjeto;
            $bd->query($sql);
            if($idAluno!=null){
                $sql= "UPDATE Participa (ID_Usuario=(".$idAluno.", Bolsa=".$bolsa.")
                    WHERE ID_Projeto=".$idProjeto;
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
    
    function alteraAtividade($idAtividade, $localizacao, $data){
        $bd= conectaBD();
        $sql="UPDATE  Atividades_Extensao SET Localizacao =  '".$localizacao."', Data_Atividade =  '".$data."' WHERE  ID_Ati=".$idAtividade;
        $bd->query($sql);
        $bd->close();
    }
    
    function deletaAtividade($idAtividade){
        $bd= conectaBD();
        $sql="DELETE FROM Extensao_Possui WHERE ID_Ati =".$idAtividade;
        $bd->query($sql);
        $sql="DELETE FROM Atividades_Extensao WHERE ID_Ati= ".$idAtividade;
        $bd->query($sql);
        $bd->close();
    }
    
    
    
    
    //Liste o nome de todos os professores que tiveram, entre suas atribuições, cargos relacionados a funções 
    //gratificadas e/ou cargos comissionados. Nessa listagem, informe o nome do professor, as datas referentes ao 
    //período de ocupação desse cargos e os setores administrativos relacionados aos cargos.

	
?>
