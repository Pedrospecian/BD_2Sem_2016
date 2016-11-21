-- mudanças pra auto increment

ALTER TABLE  `Usuario` CHANGE  `ID_Usuario`  `ID_Usuario` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `Unidade` CHANGE  `ID_Unidade`  `ID_Unidade` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `Projeto` CHANGE  `ID_Projeto`  `ID_Projeto` BIGINT( 20 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `Ocorrencias` CHANGE  `ID_Ocorrencia`  `ID_Ocorrencia` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `Financiador` CHANGE  `ID_Financiador`  `ID_Financiador` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `Emprestimos` CHANGE  `Id_Emprestimo`  `Id_Emprestimo` BIGINT( 20 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `Disciplinas` CHANGE  `ID_Disciplina`  `ID_Disciplina` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `Cursos` CHANGE  `Codigo`  `Codigo` BIGINT( 20 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `Bens` CHANGE  `ID_bem`  `ID_bem` INT( 11 ) NOT NULL AUTO_INCREMENT ;

