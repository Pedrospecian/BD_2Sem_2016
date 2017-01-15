-- mudanças pra auto increment
SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE  `usuario` CHANGE  `ID_Usuario`  `ID_Usuario` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `unidade` CHANGE  `ID_Unidade`  `ID_Unidade` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `projeto` CHANGE  `ID_Projeto`  `ID_Projeto` BIGINT( 20 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `ocorrencias` CHANGE  `ID_Ocorrencia`  `ID_Ocorrencia` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `financiador` CHANGE  `ID_Financiador`  `ID_Financiador` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `emprestimos` CHANGE  `Id_Emprestimo`  `Id_Emprestimo` BIGINT( 20 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `disciplinas` CHANGE  `ID_Disciplina`  `ID_Disciplina` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `cursos` CHANGE  `Codigo`  `Codigo` BIGINT( 20 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE  `bens` CHANGE  `ID_bem`  `ID_bem` INT( 11 ) NOT NULL AUTO_INCREMENT ;

SET FOREIGN_KEY_CHECKS = 1;