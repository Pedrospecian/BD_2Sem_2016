-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 12-Nov-2016 às 21:08
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
  `ID_Usuario` int(11) NOT NULL,
  `Ori_ID_Usuario` int(11) DEFAULT NULL,
  `ID_Cur` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKUsu_Alu_IND` (`ID_Usuario`),
  KEY `FKOrientacao_IND` (`Ori_ID_Usuario`),
  KEY `FKcursa_IND` (`ID_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Aluno`
--

INSERT INTO `Aluno` (`ID_Usuario`, `Ori_ID_Usuario`, `ID_Cur`) VALUES
(1, NULL, 1),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Bens`
--

CREATE TABLE IF NOT EXISTS `Bens` (
  `Localizacao` char(255) NOT NULL,
  `Valor` int(11) NOT NULL,
  `ID_bem` int(11) NOT NULL AUTO_INCREMENT,
  `Data_de_Aquisicao` date NOT NULL,
  `Tipo` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_bem`),
  UNIQUE KEY `ID_Bens_IND` (`ID_bem`),
  KEY `FKPossui_IND` (`ID_Unidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `Bens`
--

INSERT INTO `Bens` (`Localizacao`, `Valor`, `ID_bem`, `Data_de_Aquisicao`, `Tipo`, `ID_Unidade`) VALUES
('nome', 13, 1, '2016-11-04', 'tipo na tela', 1),
('localizaÃ§Ã£o', 133, 3, '0000-00-00', 'tipo na tela 3', 1),
('teste data', 1333, 4, '2016-11-19', 'tipo na tela 4', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Calendario`
--

CREATE TABLE IF NOT EXISTS `Calendario` (
  `ID_ProjetoExtensao` int(11) NOT NULL,
  `ID_Calendario` int(11) NOT NULL,
  PRIMARY KEY (`ID_ProjetoExtensao`),
  UNIQUE KEY `FKPro_Cal_IND` (`ID_ProjetoExtensao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Coordena`
--

CREATE TABLE IF NOT EXISTS `Coordena` (
  `ID_ProjetoPesquisa` int(11) NOT NULL,
  `Indice_Pequisador` char(1) NOT NULL,
  `Bolsa` char(1) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_ProjetoPesquisa`),
  UNIQUE KEY `FKCoo_Pro_IND` (`ID_ProjetoPesquisa`),
  KEY `FKCoo_Pro_1_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Cursos`
--

CREATE TABLE IF NOT EXISTS `Cursos` (
  `ID_Cur` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` bigint(20) NOT NULL,
  `Nome` char(255) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cur`),
  UNIQUE KEY `SID_Cursos_ID` (`Codigo`),
  UNIQUE KEY `ID_IND` (`ID_Cur`),
  UNIQUE KEY `SID_Cursos_IND` (`Codigo`),
  KEY `FKOferecimento_IND` (`ID_Disciplina`),
  KEY `FKComposicao_IND` (`ID_Unidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `Cursos`
--

INSERT INTO `Cursos` (`ID_Cur`, `Codigo`, `Nome`, `ID_Disciplina`, `ID_Unidade`) VALUES
(1, 200, 'nome do curso', 1, 1),
(2, 22, 'nome da pos', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Disciplinas`
--

CREATE TABLE IF NOT EXISTS `Disciplinas` (
  `Codigo` char(1) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  `Nome` char(1) NOT NULL,
  PRIMARY KEY (`ID_Disciplina`),
  UNIQUE KEY `ID_Disciplinas_IND` (`ID_Disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Disciplinas`
--

INSERT INTO `Disciplinas` (`Codigo`, `ID_Disciplina`, `Nome`) VALUES
('c', 1, 'n');

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
-- Estrutura da tabela `Exerce`
--

CREATE TABLE IF NOT EXISTS `Exerce` (
  `E_A_ID_Usuario` int(11) NOT NULL,
  `E_F_ID_Usuario` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_ProjetoExtensao` int(11) NOT NULL,
  PRIMARY KEY (`ID_ProjetoExtensao`,`E_A_ID_Usuario`,`ID_Usuario`,`E_F_ID_Usuario`),
  UNIQUE KEY `ID_Exerce_IND` (`ID_ProjetoExtensao`,`E_A_ID_Usuario`,`ID_Usuario`,`E_F_ID_Usuario`),
  KEY `FKExe_Pro_IND` (`ID_Usuario`),
  KEY `FKExe_Fun_IND` (`E_F_ID_Usuario`),
  KEY `FKExe_Alu_IND` (`E_A_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Financia`
--

CREATE TABLE IF NOT EXISTS `Financia` (
  `ID_Financiador` int(11) NOT NULL,
  `ID_ProjetoExtensao` int(11) NOT NULL,
  `ID_ProjetoPesquisa` int(11) NOT NULL,
  PRIMARY KEY (`ID_Financiador`),
  UNIQUE KEY `FKFin_Fin_IND` (`ID_Financiador`),
  KEY `FKFin_Pro_1_IND` (`ID_ProjetoExtensao`),
  KEY `FKFin_Pro_IND` (`ID_ProjetoPesquisa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Financiador`
--

CREATE TABLE IF NOT EXISTS `Financiador` (
  `Tipo` char(255) NOT NULL,
  `nome` char(255) NOT NULL,
  `ID_Financiador` int(11) NOT NULL,
  PRIMARY KEY (`ID_Financiador`),
  UNIQUE KEY `ID_Financiador_IND` (`ID_Financiador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Financiador`
--

INSERT INTO `Financiador` (`Tipo`, `nome`, `ID_Financiador`) VALUES
('tipo do financiador', 'nome do finnanciador', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Folha_de_Pagamento`
--

CREATE TABLE IF NOT EXISTS `Folha_de_Pagamento` (
  `ID_FolhaDePagamento` int(11) NOT NULL,
  PRIMARY KEY (`ID_FolhaDePagamento`),
  UNIQUE KEY `ID_Folha_de_Pagamento_IND` (`ID_FolhaDePagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Funcionario`
--

CREATE TABLE IF NOT EXISTS `Funcionario` (
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKUsu_Fun_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Funcionario`
--

INSERT INTO `Funcionario` (`ID_Usuario`) VALUES
(2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Graduacao`
--

CREATE TABLE IF NOT EXISTS `Graduacao` (
  `ID_Cur` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cur`),
  UNIQUE KEY `FKCur_Gra_IND` (`ID_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Graduacao`
--

INSERT INTO `Graduacao` (`ID_Cur`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Historico`
--

CREATE TABLE IF NOT EXISTS `Historico` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  `Notas` char(1) NOT NULL,
  `Frequencia` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Disciplina`),
  UNIQUE KEY `ID_Historico_IND` (`ID_Usuario`,`ID_Disciplina`),
  KEY `FKHis_Dis_IND` (`ID_Disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Indice_de_Desempenho`
--

CREATE TABLE IF NOT EXISTS `Indice_de_Desempenho` (
  `ID_Ind` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Cur` int(11) NOT NULL,
  `Indice_Curso` char(1) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `I_A_ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Ind`),
  UNIQUE KEY `FKInd_Cur_ID` (`ID_Cur`),
  UNIQUE KEY `ID_IND` (`ID_Ind`),
  UNIQUE KEY `FKInd_Cur_IND` (`ID_Cur`),
  KEY `FKInd_Pro_IND` (`ID_Usuario`),
  KEY `FKInd_Alu_IND` (`I_A_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `ID_Ocorrencia` int(11) NOT NULL,
  `Tipo_Ocorrencia` char(255) NOT NULL,
  PRIMARY KEY (`ID_Ocorrencia`),
  UNIQUE KEY `ID_Ocorrencias_IND` (`ID_Ocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Ocorrencias`
--

INSERT INTO `Ocorrencias` (`ID_Ocorrencia`, `Tipo_Ocorrencia`) VALUES
(1, 'tipo da ocorrencia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Participa`
--

CREATE TABLE IF NOT EXISTS `Participa` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_ProjetoPesquisa` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_ProjetoPesquisa`),
  UNIQUE KEY `ID_Participa_IND` (`ID_Usuario`,`ID_ProjetoPesquisa`),
  KEY `FKPar_Pro_IND` (`ID_ProjetoPesquisa`)
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Pos_Graduacao`
--

INSERT INTO `Pos_Graduacao` (`ID_Pos`, `ID_Cur`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Professor`
--

CREATE TABLE IF NOT EXISTS `Professor` (
  `ID_Usuario` int(11) NOT NULL,
  `carreira` char(255) NOT NULL,
  `nivel` char(255) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKUsu_Pro_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Professor`
--

INSERT INTO `Professor` (`ID_Usuario`, `carreira`, `nivel`) VALUES
(3, 'carreira do professor', 'nivel do professor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto_Extensao`
--

CREATE TABLE IF NOT EXISTS `Projeto_Extensao` (
  `Data_Inicio` date NOT NULL,
  `Descricao` char(255) NOT NULL,
  `Atividade` char(255) NOT NULL,
  `Orcamento` bigint(20) NOT NULL,
  `ID_ProjetoExtensao` int(11) NOT NULL,
  `Data_Termino` date NOT NULL,
  PRIMARY KEY (`ID_ProjetoExtensao`),
  UNIQUE KEY `ID_Projeto_Extensao_IND` (`ID_ProjetoExtensao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto_Pesquisa`
--

CREATE TABLE IF NOT EXISTS `Projeto_Pesquisa` (
  `Objetivo` char(255) NOT NULL,
  `ID_ProjetoPesquisa` int(11) NOT NULL,
  `Descricao` char(255) NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Data_Termino` date NOT NULL,
  `Orcamento` bigint(20) NOT NULL,
  `Atividade` char(255) NOT NULL,
  PRIMARY KEY (`ID_ProjetoPesquisa`),
  UNIQUE KEY `ID_Projeto_Pesquisa_IND` (`ID_ProjetoPesquisa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Projeto_Pesquisa`
--

INSERT INTO `Projeto_Pesquisa` (`Objetivo`, `ID_ProjetoPesquisa`, `Descricao`, `Data_Inicio`, `Data_Termino`, `Orcamento`, `Atividade`) VALUES
('objetivo do projeto de pesquisa', 1, 'descrição projeto de pesquisa', '2016-11-01', '2016-11-02', 1000, 'atividade do projeto de pesquisa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Recebe`
--

CREATE TABLE IF NOT EXISTS `Recebe` (
  `R_F_ID_Usuario` int(11) NOT NULL,
  `ID_FolhaDePagamento` int(11) NOT NULL,
  `Salario` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`R_F_ID_Usuario`),
  UNIQUE KEY `FKRec_Fol_ID` (`ID_FolhaDePagamento`),
  UNIQUE KEY `FKRec_Fun_IND` (`R_F_ID_Usuario`),
  UNIQUE KEY `FKRec_Fol_IND` (`ID_FolhaDePagamento`),
  KEY `FKRec_Pro_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Tem`
--

CREATE TABLE IF NOT EXISTS `Tem` (
  `ID_Ocorrencia` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `T_F_ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Ocorrencia`),
  UNIQUE KEY `FKTem_Oco_IND` (`ID_Ocorrencia`),
  KEY `FKTem_Pro_IND` (`ID_Usuario`),
  KEY `FKTem_Fun_IND` (`T_F_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Unidade`
--

CREATE TABLE IF NOT EXISTS `Unidade` (
  `nome` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  `tipo` char(255) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `ID_Unidade_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Unidade`
--

INSERT INTO `Unidade` (`nome`, `ID_Unidade`, `tipo`) VALUES
('nome da unidade', 1, 'tipo da unidade');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `nome` char(255) NOT NULL,
  `cpf` char(14) NOT NULL,
  `Sexo` char(255) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `ID_Usuario_IND` (`ID_Usuario`),
  KEY `FKCadastro_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Usuario`
--

INSERT INTO `Usuario` (`ID_Usuario`, `nome`, `cpf`, `Sexo`, `data_de_nascimento`, `ID_Unidade`) VALUES
(1, 'nome do usuario', '666.666.666-66', 'sexo do usuario', '2016-11-01', 1),
(2, 'nome do funcionario', '666.666.666-66', 'sexo do funcionario', '2016-11-01', 1),
(3, 'nome do professor', '666.666.666-66', 'sexo do professor', '2016-11-01', 1),
(4, 'nome aluno pos', '666.666.666-66', 'sexo d', '2016-11-01', 1);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `Aluno`
--
ALTER TABLE `Aluno`
  ADD CONSTRAINT `FKcursa_FK` FOREIGN KEY (`ID_Cur`) REFERENCES `Cursos` (`ID_Cur`),
  ADD CONSTRAINT `FKOrientacao_FK` FOREIGN KEY (`Ori_ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`),
  ADD CONSTRAINT `FKUsu_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Bens`
--
ALTER TABLE `Bens`
  ADD CONSTRAINT `FKPossui_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Calendario`
--
ALTER TABLE `Calendario`
  ADD CONSTRAINT `FKPro_Cal_FK` FOREIGN KEY (`ID_ProjetoExtensao`) REFERENCES `Projeto_Extensao` (`ID_ProjetoExtensao`);

--
-- Limitadores para a tabela `Coordena`
--
ALTER TABLE `Coordena`
  ADD CONSTRAINT `FKCoo_Pro_FK` FOREIGN KEY (`ID_ProjetoPesquisa`) REFERENCES `Projeto_Pesquisa` (`ID_ProjetoPesquisa`),
  ADD CONSTRAINT `FKCoo_Pro_1_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Cursos`
--
ALTER TABLE `Cursos`
  ADD CONSTRAINT `FKComposicao_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`),
  ADD CONSTRAINT `FKOferecimento_FK` FOREIGN KEY (`ID_Disciplina`) REFERENCES `Disciplinas` (`ID_Disciplina`);

--
-- Limitadores para a tabela `Doutorado`
--
ALTER TABLE `Doutorado`
  ADD CONSTRAINT `FKPos_Dou_FK` FOREIGN KEY (`ID_Pos`) REFERENCES `Pos_Graduacao` (`ID_Pos`);

--
-- Limitadores para a tabela `Exerce`
--
ALTER TABLE `Exerce`
  ADD CONSTRAINT `FKExe_Alu_FK` FOREIGN KEY (`E_A_ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKExe_Fun_FK` FOREIGN KEY (`E_F_ID_Usuario`) REFERENCES `Funcionario` (`ID_Usuario`),
  ADD CONSTRAINT `FKExe_Pro_1` FOREIGN KEY (`ID_ProjetoExtensao`) REFERENCES `Projeto_Extensao` (`ID_ProjetoExtensao`),
  ADD CONSTRAINT `FKExe_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Financia`
--
ALTER TABLE `Financia`
  ADD CONSTRAINT `FKFin_Fin_FK` FOREIGN KEY (`ID_Financiador`) REFERENCES `Financiador` (`ID_Financiador`),
  ADD CONSTRAINT `FKFin_Pro_1_FK` FOREIGN KEY (`ID_ProjetoExtensao`) REFERENCES `Projeto_Extensao` (`ID_ProjetoExtensao`),
  ADD CONSTRAINT `FKFin_Pro_FK` FOREIGN KEY (`ID_ProjetoPesquisa`) REFERENCES `Projeto_Pesquisa` (`ID_ProjetoPesquisa`);

--
-- Limitadores para a tabela `Funcionario`
--
ALTER TABLE `Funcionario`
  ADD CONSTRAINT `FKUsu_Fun_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Graduacao`
--
ALTER TABLE `Graduacao`
  ADD CONSTRAINT `FKCur_Gra_FK` FOREIGN KEY (`ID_Cur`) REFERENCES `Cursos` (`ID_Cur`);

--
-- Limitadores para a tabela `Historico`
--
ALTER TABLE `Historico`
  ADD CONSTRAINT `FKHis_Alu` FOREIGN KEY (`ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKHis_Dis_FK` FOREIGN KEY (`ID_Disciplina`) REFERENCES `Disciplinas` (`ID_Disciplina`);

--
-- Limitadores para a tabela `Indice_de_Desempenho`
--
ALTER TABLE `Indice_de_Desempenho`
  ADD CONSTRAINT `FKInd_Cur_FK` FOREIGN KEY (`ID_Cur`) REFERENCES `Cursos` (`ID_Cur`),
  ADD CONSTRAINT `FKInd_Alu_FK` FOREIGN KEY (`I_A_ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKInd_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

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
-- Limitadores para a tabela `Participa`
--
ALTER TABLE `Participa`
  ADD CONSTRAINT `FKPar_Alu` FOREIGN KEY (`ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKPar_Pro_FK` FOREIGN KEY (`ID_ProjetoPesquisa`) REFERENCES `Projeto_Pesquisa` (`ID_ProjetoPesquisa`);

--
-- Limitadores para a tabela `Pos_Graduacao`
--
ALTER TABLE `Pos_Graduacao`
  ADD CONSTRAINT `FKCur_Pos_FK` FOREIGN KEY (`ID_Cur`) REFERENCES `Cursos` (`ID_Cur`);

--
-- Limitadores para a tabela `Professor`
--
ALTER TABLE `Professor`
  ADD CONSTRAINT `FKUsu_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Recebe`
--
ALTER TABLE `Recebe`
  ADD CONSTRAINT `FKRec_Fol_FK` FOREIGN KEY (`ID_FolhaDePagamento`) REFERENCES `Folha_de_Pagamento` (`ID_FolhaDePagamento`),
  ADD CONSTRAINT `FKRec_Fun_FK` FOREIGN KEY (`R_F_ID_Usuario`) REFERENCES `Funcionario` (`ID_Usuario`),
  ADD CONSTRAINT `FKRec_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Tem`
--
ALTER TABLE `Tem`
  ADD CONSTRAINT `FKTem_Fun_FK` FOREIGN KEY (`T_F_ID_Usuario`) REFERENCES `Funcionario` (`ID_Usuario`),
  ADD CONSTRAINT `FKTem_Oco_FK` FOREIGN KEY (`ID_Ocorrencia`) REFERENCES `Ocorrencias` (`ID_Ocorrencia`),
  ADD CONSTRAINT `FKTem_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `FKCadastro_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
