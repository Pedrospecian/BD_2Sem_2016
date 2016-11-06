-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 06-Nov-2016 às 02:02
-- Versão do servidor: 5.5.50-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `universidade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Aluno`
--

CREATE TABLE IF NOT EXISTS `Aluno` (
  `ID_Aluno` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int(11) NOT NULL,
  `ID_Pro` int(11) NOT NULL,
  PRIMARY KEY (`ID_Aluno`),
  UNIQUE KEY `FKUsu_Alu_ID` (`ID_Usuario`),
  UNIQUE KEY `ID_IND` (`ID_Aluno`),
  UNIQUE KEY `FKUsu_Alu_IND` (`ID_Usuario`),
  KEY `FKR_1_IND` (`ID_Pro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Aluno`
--

INSERT INTO `Aluno` (`ID_Aluno`, `ID_Usuario`, `ID_Pro`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Bens`
--

CREATE TABLE IF NOT EXISTS `Bens` (
  `ID_Ben` int(11) NOT NULL AUTO_INCREMENT,
  `Identificador` char(1) NOT NULL,
  `Localizacao` char(1) NOT NULL,
  `Valor` char(1) NOT NULL,
  `Data_de_Aquisicao` char(1) NOT NULL,
  `Tipo` char(1) NOT NULL,
  PRIMARY KEY (`ID_Ben`),
  UNIQUE KEY `ID_IND` (`ID_Ben`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Calendario`
--

CREATE TABLE IF NOT EXISTS `Calendario` (
  `ID_Calendario` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_Calendario`),
  UNIQUE KEY `ID_IND` (`ID_Calendario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Coordena`
--

CREATE TABLE IF NOT EXISTS `Coordena` (
  `ID_Professor` int(11) NOT NULL,
  `Indice` char(1) NOT NULL,
  `Bolsa` char(1) NOT NULL,
  `C_P_ID_Pro` int(11) NOT NULL,
  PRIMARY KEY (`ID_Professor`),
  UNIQUE KEY `FKCoo_Pro_1_IND` (`ID_Professor`),
  KEY `FKCoo_Pro_IND` (`C_P_ID_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Cursos`
--

CREATE TABLE IF NOT EXISTS `Cursos` (
  `ID_Curso` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` char(1) NOT NULL,
  `Nome` char(1) NOT NULL,
  `ID_Uni` int(11) NOT NULL,
  `ID_Dis` int(11) NOT NULL,
  PRIMARY KEY (`ID_Curso`),
  UNIQUE KEY `ID_IND` (`ID_Curso`),
  KEY `FKR_12_IND` (`ID_Uni`),
  KEY `FKOferecimento_IND` (`ID_Dis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Disciplinas`
--

CREATE TABLE IF NOT EXISTS `Disciplinas` (
  `ID_Dis` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` char(1) NOT NULL,
  `Nome` char(1) NOT NULL,
  PRIMARY KEY (`ID_Dis`),
  UNIQUE KEY `ID_IND` (`ID_Dis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Doutorado`
--

CREATE TABLE IF NOT EXISTS `Doutorado` (
  `ID_Pos` int(11) NOT NULL,
  PRIMARY KEY (`ID_Pos`),
  UNIQUE KEY `FKPos_Dou_IND` (`ID_Pos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Financiador`
--

CREATE TABLE IF NOT EXISTS `Financiador` (
  `ID_Financiador` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(1) NOT NULL,
  `Nome` char(255) NOT NULL,
  PRIMARY KEY (`ID_Financiador`),
  UNIQUE KEY `ID_IND` (`ID_Financiador`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Financiador`
--

INSERT INTO `Financiador` (`ID_Financiador`, `Tipo`, `Nome`) VALUES
(1, 'b', 'FAPESP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Folha_de_Pagamento`
--

CREATE TABLE IF NOT EXISTS `Folha_de_Pagamento` (
  `ID_Folha_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_Folha_pagamento`),
  UNIQUE KEY `ID_IND` (`ID_Folha_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Funcionario`
--

CREATE TABLE IF NOT EXISTS `Funcionario` (
  `ID_Fun` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Usu` int(11) NOT NULL,
  `funcao` char(1) NOT NULL,
  `ID_Oco` int(11) NOT NULL,
  PRIMARY KEY (`ID_Fun`),
  UNIQUE KEY `FKUsu_Fun_ID` (`ID_Usu`),
  UNIQUE KEY `ID_IND` (`ID_Fun`),
  UNIQUE KEY `FKUsu_Fun_IND` (`ID_Usu`),
  KEY `FKR_10_IND` (`ID_Oco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Graduacao`
--

CREATE TABLE IF NOT EXISTS `Graduacao` (
  `ID_Curso` int(11) NOT NULL,
  PRIMARY KEY (`ID_Curso`),
  UNIQUE KEY `FKCur_Gra_IND` (`ID_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Historico`
--

CREATE TABLE IF NOT EXISTS `Historico` (
  `ID_Alu` int(11) NOT NULL,
  `ID_Dis` int(11) NOT NULL,
  `Notas` char(1) NOT NULL,
  `Frequencia` char(1) NOT NULL,
  PRIMARY KEY (`ID_Alu`,`ID_Dis`),
  UNIQUE KEY `ID_Historico_IND` (`ID_Alu`,`ID_Dis`),
  KEY `FKHis_Dis_IND` (`ID_Dis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Indice_de_Desempenho`
--

CREATE TABLE IF NOT EXISTS `Indice_de_Desempenho` (
  `ID_Cur` int(11) NOT NULL,
  `ID_Pro` int(11) NOT NULL,
  `ID_Alu` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cur`),
  UNIQUE KEY `FKInd_Cur_IND` (`ID_Cur`),
  KEY `FKInd_Pro_IND` (`ID_Pro`),
  KEY `FKInd_Alu_IND` (`ID_Alu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Mestrado_Academico`
--

CREATE TABLE IF NOT EXISTS `Mestrado_Academico` (
  `ID_Pos` int(11) NOT NULL,
  PRIMARY KEY (`ID_Pos`),
  UNIQUE KEY `FKPos_Mes_IND` (`ID_Pos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Mestrado_Profissional`
--

CREATE TABLE IF NOT EXISTS `Mestrado_Profissional` (
  `ID_Pos` int(11) NOT NULL,
  PRIMARY KEY (`ID_Pos`),
  UNIQUE KEY `FKPos_Mes_1_IND` (`ID_Pos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Ocorrencias`
--

CREATE TABLE IF NOT EXISTS `Ocorrencias` (
  `ID_Oco` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Ocorrencia` char(1) NOT NULL,
  PRIMARY KEY (`ID_Oco`),
  UNIQUE KEY `ID_IND` (`ID_Oco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Possui`
--

CREATE TABLE IF NOT EXISTS `Possui` (
  `ID_Ben` int(11) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Ben`,`ID_Unidade`),
  UNIQUE KEY `ID_Possui_IND` (`ID_Ben`,`ID_Unidade`),
  KEY `FKPos_Uni_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pos_Graduacao`
--

CREATE TABLE IF NOT EXISTS `Pos_Graduacao` (
  `ID_Pos` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Cur` int(11) NOT NULL,
  PRIMARY KEY (`ID_Pos`),
  UNIQUE KEY `FKCur_Pos_ID` (`ID_Cur`),
  UNIQUE KEY `ID_IND` (`ID_Pos`),
  UNIQUE KEY `FKCur_Pos_IND` (`ID_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Professor`
--

CREATE TABLE IF NOT EXISTS `Professor` (
  `ID_Professor` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Usu` int(11) NOT NULL,
  `carreira` char(1) NOT NULL,
  `nivel` char(1) NOT NULL,
  `ID_Oco` int(11) NOT NULL,
  `ID_Alu` int(11) NOT NULL,
  PRIMARY KEY (`ID_Professor`),
  UNIQUE KEY `FKUsu_Pro_ID` (`ID_Usu`),
  UNIQUE KEY `ID_IND` (`ID_Professor`),
  UNIQUE KEY `FKUsu_Pro_IND` (`ID_Usu`),
  KEY `FKR_9_IND` (`ID_Oco`),
  KEY `FKOrientacao_IND` (`ID_Alu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto_Extensao`
--

CREATE TABLE IF NOT EXISTS `Projeto_Extensao` (
  `ID_Projeto_extensao` int(11) NOT NULL AUTO_INCREMENT,
  `objetivo` char(255) NOT NULL,
  `descricao` char(255) NOT NULL,
  `orcamento` char(255) NOT NULL,
  `atividades` char(255) NOT NULL,
  `ID_Financiador` char(1) NOT NULL,
  PRIMARY KEY (`ID_Projeto_extensao`),
  UNIQUE KEY `ID_IND` (`ID_Projeto_extensao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto_Pesquisa`
--

CREATE TABLE IF NOT EXISTS `Projeto_Pesquisa` (
  `ID_Projeto_pesquisa` int(11) NOT NULL AUTO_INCREMENT,
  `Objetivo` char(1) NOT NULL,
  `Descricao` char(1) NOT NULL,
  `Orcamento` char(1) NOT NULL,
  `Atividade` char(1) NOT NULL,
  `ID_Fin` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto_pesquisa`),
  UNIQUE KEY `ID_IND` (`ID_Projeto_pesquisa`),
  KEY `FKR_6_IND` (`ID_Fin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `Projeto_Pesquisa`
--

INSERT INTO `Projeto_Pesquisa` (`ID_Projeto_pesquisa`, `Objetivo`, `Descricao`, `Orcamento`, `Atividade`, `ID_Fin`) VALUES
(2, 'a', 'a', 'a', 'a', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `R_5`
--

CREATE TABLE IF NOT EXISTS `R_5` (
  `ID_Cal` int(11) NOT NULL,
  `ID_Fin` int(11) NOT NULL,
  `ID_Pro` int(11) NOT NULL,
  PRIMARY KEY (`ID_Fin`,`ID_Pro`,`ID_Cal`),
  UNIQUE KEY `ID_R_5_IND` (`ID_Fin`,`ID_Pro`,`ID_Cal`),
  KEY `FKR_5_Pro_IND` (`ID_Pro`),
  KEY `FKR_5_Cal_IND` (`ID_Cal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `R_7`
--

CREATE TABLE IF NOT EXISTS `R_7` (
  `ID_Alu` int(11) NOT NULL,
  `ID_Fun` int(11) NOT NULL,
  `R_P_ID_Pro` int(11) NOT NULL,
  `ID_Pro` int(11) NOT NULL,
  PRIMARY KEY (`ID_Pro`,`ID_Alu`,`R_P_ID_Pro`,`ID_Fun`),
  UNIQUE KEY `ID_R_7_IND` (`ID_Pro`,`ID_Alu`,`R_P_ID_Pro`,`ID_Fun`),
  KEY `FKR_7_Pro_IND` (`R_P_ID_Pro`),
  KEY `FKR_7_Fun_IND` (`ID_Fun`),
  KEY `FKR_7_Alu_IND` (`ID_Alu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `R_14`
--

CREATE TABLE IF NOT EXISTS `R_14` (
  `ID_Fol` int(11) NOT NULL,
  `ID_Fun` int(11) NOT NULL,
  `ID_Pro` int(11) NOT NULL,
  `salario` char(1) NOT NULL,
  PRIMARY KEY (`ID_Fol`,`ID_Fun`,`ID_Pro`),
  UNIQUE KEY `ID_R_14_IND` (`ID_Fol`,`ID_Fun`,`ID_Pro`),
  KEY `FKR_1_Pro_IND` (`ID_Pro`),
  KEY `FKR_1_Fun_IND` (`ID_Fun`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Unidade`
--

CREATE TABLE IF NOT EXISTS `Unidade` (
  `ID_Unidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(1) NOT NULL,
  `tipo` char(1) NOT NULL,
  `ID_Usu` int(11) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `ID_IND` (`ID_Unidade`),
  KEY `FKR_IND` (`ID_Usu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(255) NOT NULL,
  `cpf` char(14) NOT NULL,
  `Sexo` char(10) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `ID_IND` (`ID_Usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Usuario`
--

INSERT INTO `Usuario` (`ID_Usuario`, `nome`, `cpf`, `Sexo`, `data_de_nascimento`) VALUES
(1, 'lucas covre delboni', '666.666.666-66', 'M', '0000-00-00');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `Aluno`
--
ALTER TABLE `Aluno`
  ADD CONSTRAINT `FKR_1_FK` FOREIGN KEY (`ID_Pro`) REFERENCES `Projeto_Pesquisa` (`ID_Projeto_pesquisa`),
  ADD CONSTRAINT `FKUsu_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Coordena`
--
ALTER TABLE `Coordena`
  ADD CONSTRAINT `FKCoo_Pro_FK` FOREIGN KEY (`C_P_ID_Pro`) REFERENCES `Projeto_Pesquisa` (`ID_Projeto_pesquisa`),
  ADD CONSTRAINT `FKCoo_Pro_1_FK` FOREIGN KEY (`ID_Professor`) REFERENCES `Professor` (`ID_Professor`);

--
-- Limitadores para a tabela `Cursos`
--
ALTER TABLE `Cursos`
  ADD CONSTRAINT `FKOferecimento_FK` FOREIGN KEY (`ID_Dis`) REFERENCES `Disciplinas` (`ID_Dis`),
  ADD CONSTRAINT `FKR_12_FK` FOREIGN KEY (`ID_Uni`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Doutorado`
--
ALTER TABLE `Doutorado`
  ADD CONSTRAINT `FKPos_Dou_FK` FOREIGN KEY (`ID_Pos`) REFERENCES `Pos_Graduacao` (`ID_Pos`);

--
-- Limitadores para a tabela `Funcionario`
--
ALTER TABLE `Funcionario`
  ADD CONSTRAINT `FKR_10_FK` FOREIGN KEY (`ID_Oco`) REFERENCES `Ocorrencias` (`ID_Oco`),
  ADD CONSTRAINT `FKUsu_Fun_FK` FOREIGN KEY (`ID_Usu`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Graduacao`
--
ALTER TABLE `Graduacao`
  ADD CONSTRAINT `FKCur_Gra_FK` FOREIGN KEY (`ID_Curso`) REFERENCES `Cursos` (`ID_Curso`);

--
-- Limitadores para a tabela `Historico`
--
ALTER TABLE `Historico`
  ADD CONSTRAINT `FKHis_Alu` FOREIGN KEY (`ID_Alu`) REFERENCES `Aluno` (`ID_Aluno`),
  ADD CONSTRAINT `FKHis_Dis_FK` FOREIGN KEY (`ID_Dis`) REFERENCES `Disciplinas` (`ID_Dis`);

--
-- Limitadores para a tabela `Indice_de_Desempenho`
--
ALTER TABLE `Indice_de_Desempenho`
  ADD CONSTRAINT `FKInd_Alu_FK` FOREIGN KEY (`ID_Alu`) REFERENCES `Aluno` (`ID_Aluno`),
  ADD CONSTRAINT `FKInd_Cur_FK` FOREIGN KEY (`ID_Cur`) REFERENCES `Cursos` (`ID_Curso`),
  ADD CONSTRAINT `FKInd_Pro_FK` FOREIGN KEY (`ID_Pro`) REFERENCES `Professor` (`ID_Professor`);

--
-- Limitadores para a tabela `Mestrado_Academico`
--
ALTER TABLE `Mestrado_Academico`
  ADD CONSTRAINT `FKPos_Mes_FK` FOREIGN KEY (`ID_Pos`) REFERENCES `Pos_Graduacao` (`ID_Pos`);

--
-- Limitadores para a tabela `Mestrado_Profissional`
--
ALTER TABLE `Mestrado_Profissional`
  ADD CONSTRAINT `FKPos_Mes_1_FK` FOREIGN KEY (`ID_Pos`) REFERENCES `Pos_Graduacao` (`ID_Pos`);

--
-- Limitadores para a tabela `Possui`
--
ALTER TABLE `Possui`
  ADD CONSTRAINT `FKPos_Ben` FOREIGN KEY (`ID_Ben`) REFERENCES `Bens` (`ID_Ben`),
  ADD CONSTRAINT `FKPos_Uni_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Pos_Graduacao`
--
ALTER TABLE `Pos_Graduacao`
  ADD CONSTRAINT `FKCur_Pos_FK` FOREIGN KEY (`ID_Cur`) REFERENCES `Cursos` (`ID_Curso`);

--
-- Limitadores para a tabela `Professor`
--
ALTER TABLE `Professor`
  ADD CONSTRAINT `FKOrientacao_FK` FOREIGN KEY (`ID_Alu`) REFERENCES `Aluno` (`ID_Aluno`),
  ADD CONSTRAINT `FKR_9_FK` FOREIGN KEY (`ID_Oco`) REFERENCES `Ocorrencias` (`ID_Oco`),
  ADD CONSTRAINT `FKUsu_Pro_FK` FOREIGN KEY (`ID_Usu`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Projeto_Pesquisa`
--
ALTER TABLE `Projeto_Pesquisa`
  ADD CONSTRAINT `FKR_6_FK` FOREIGN KEY (`ID_Fin`) REFERENCES `Financiador` (`ID_Financiador`);

--
-- Limitadores para a tabela `R_5`
--
ALTER TABLE `R_5`
  ADD CONSTRAINT `FKR_5_Cal_FK` FOREIGN KEY (`ID_Cal`) REFERENCES `Calendario` (`ID_Calendario`),
  ADD CONSTRAINT `FKR_5_Fin` FOREIGN KEY (`ID_Fin`) REFERENCES `Financiador` (`ID_Financiador`),
  ADD CONSTRAINT `FKR_5_Pro_FK` FOREIGN KEY (`ID_Pro`) REFERENCES `Projeto_Extensao` (`ID_Projeto_extensao`);

--
-- Limitadores para a tabela `R_7`
--
ALTER TABLE `R_7`
  ADD CONSTRAINT `FKR_7_Alu_FK` FOREIGN KEY (`ID_Alu`) REFERENCES `Aluno` (`ID_Aluno`),
  ADD CONSTRAINT `FKR_7_Fun_FK` FOREIGN KEY (`ID_Fun`) REFERENCES `Funcionario` (`ID_Fun`),
  ADD CONSTRAINT `FKR_7_Pro_1` FOREIGN KEY (`ID_Pro`) REFERENCES `Projeto_Extensao` (`ID_Projeto_extensao`),
  ADD CONSTRAINT `FKR_7_Pro_FK` FOREIGN KEY (`R_P_ID_Pro`) REFERENCES `Professor` (`ID_Professor`);

--
-- Limitadores para a tabela `R_14`
--
ALTER TABLE `R_14`
  ADD CONSTRAINT `FKR_1_Fol` FOREIGN KEY (`ID_Fol`) REFERENCES `Folha_de_Pagamento` (`ID_Folha_pagamento`),
  ADD CONSTRAINT `FKR_1_Fun_FK` FOREIGN KEY (`ID_Fun`) REFERENCES `Funcionario` (`ID_Fun`),
  ADD CONSTRAINT `FKR_1_Pro_FK` FOREIGN KEY (`ID_Pro`) REFERENCES `Professor` (`ID_Professor`);

--
-- Limitadores para a tabela `Unidade`
--
ALTER TABLE `Unidade`
  ADD CONSTRAINT `FKR_FK` FOREIGN KEY (`ID_Usu`) REFERENCES `Usuario` (`ID_Usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
