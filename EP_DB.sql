-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 13-Nov-2016 às 13:55
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
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKUsu_Alu_IND` (`ID_Usuario`),
  KEY `FKOrientacao_IND` (`Ori_ID_Usuario`),
  KEY `FKcursa_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Aluno`
--

INSERT INTO `Aluno` (`ID_Usuario`, `Ori_ID_Usuario`, `Codigo`) VALUES
(1, NULL, 1),
(4, NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Atividade_Possui`
--

CREATE TABLE IF NOT EXISTS `Atividade_Possui` (
  `ID_Cal` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Cal`,`ID_Projeto`),
  UNIQUE KEY `ID_Atividade_Possui_IND` (`ID_Cal`,`ID_Projeto`),
  KEY `FKAti_Pro_IND` (`ID_Projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Bens`
--

INSERT INTO `Bens` (`Localizacao`, `Valor`, `ID_bem`, `Data_de_Aquisicao`, `Tipo`, `ID_Unidade`) VALUES
('localizaÃ§Ã£ov', 4555, 1, '2016-11-02', 'tipo do bem', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Calendario`
--

CREATE TABLE IF NOT EXISTS `Calendario` (
  `ID_Cal` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Calendario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cal`),
  UNIQUE KEY `ID_IND` (`ID_Cal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Coordena`
--

CREATE TABLE IF NOT EXISTS `Coordena` (
  `ID_Projeto` bigint(20) NOT NULL,
  `Indice_Pequisador` char(1) NOT NULL,
  `Bolsa` char(1) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `FKCoo_Pro_IND` (`ID_Projeto`),
  KEY `FKCoo_Pro_1_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Cursos`
--

CREATE TABLE IF NOT EXISTS `Cursos` (
  `Codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `ID_Cursos_IND` (`Codigo`),
  KEY `FKComposicao_IND` (`ID_Unidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `Cursos`
--

INSERT INTO `Cursos` (`Codigo`, `Nome`, `ID_Unidade`) VALUES
(1, 'nome do curso', 1),
(2, 'curso de pos', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Disciplinas`
--

CREATE TABLE IF NOT EXISTS `Disciplinas` (
  `ID_Disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` char(255) NOT NULL,
  PRIMARY KEY (`ID_Disciplina`),
  UNIQUE KEY `ID_Disciplinas_IND` (`ID_Disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Doutorado`
--

CREATE TABLE IF NOT EXISTS `Doutorado` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKPos_Dou_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Exerce`
--

CREATE TABLE IF NOT EXISTS `Exerce` (
  `E_A_ID_Usuario` int(11) NOT NULL,
  `E_F_ID_Usuario` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Projeto`,`E_A_ID_Usuario`,`ID_Usuario`,`E_F_ID_Usuario`),
  UNIQUE KEY `ID_Exerce_IND` (`ID_Projeto`,`E_A_ID_Usuario`,`ID_Usuario`,`E_F_ID_Usuario`),
  KEY `FKExe_Pro_IND` (`ID_Usuario`),
  KEY `FKExe_Fun_IND` (`E_F_ID_Usuario`),
  KEY `FKExe_Alu_IND` (`E_A_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Financiador`
--

CREATE TABLE IF NOT EXISTS `Financiador` (
  `Tipo` char(255) NOT NULL,
  `nome` char(255) NOT NULL,
  `ID_Financiador` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_Financiador`),
  UNIQUE KEY `ID_Financiador_IND` (`ID_Financiador`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `Financiador`
--

INSERT INTO `Financiador` (`Tipo`, `nome`, `ID_Financiador`) VALUES
('privado', 'nome do financiador', 1),
('publico', 'nome do financiador publico', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Folha_de_Pagamento`
--

CREATE TABLE IF NOT EXISTS `Folha_de_Pagamento` (
  `R_F_ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`R_F_ID_Usuario`),
  UNIQUE KEY `FKRec_Fol_IND` (`R_F_ID_Usuario`)
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
(3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Graduacao`
--

CREATE TABLE IF NOT EXISTS `Graduacao` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKCur_Gra_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Graduacao`
--

INSERT INTO `Graduacao` (`Codigo`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Historico`
--

CREATE TABLE IF NOT EXISTS `Historico` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  `Notas` int(11) NOT NULL,
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
  `Codigo` bigint(20) NOT NULL,
  `Indice_Curso` char(1) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `I_A_ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKInd_Cur_IND` (`Codigo`),
  KEY `FKInd_Pro_IND` (`ID_Usuario`),
  KEY `FKInd_Alu_IND` (`I_A_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Mestrado_Academico`
--

CREATE TABLE IF NOT EXISTS `Mestrado_Academico` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKPos_Mes_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Mestrado_Profissional`
--

CREATE TABLE IF NOT EXISTS `Mestrado_Profissional` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKPos_Mes_1_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Ocorrencias`
--

CREATE TABLE IF NOT EXISTS `Ocorrencias` (
  `ID_Ocorrencia` int(11) NOT NULL,
  `Tipo_Ocorrencia` char(255) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Fun_ID_Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Ocorrencia`),
  UNIQUE KEY `ID_Ocorrencias_IND` (`ID_Ocorrencia`),
  KEY `FKprofessor_tem_IND` (`ID_Usuario`),
  KEY `FKfuncionario_tem_IND` (`Fun_ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Oferecimento`
--

CREATE TABLE IF NOT EXISTS `Oferecimento` (
  `Codigo` bigint(20) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`,`ID_Disciplina`),
  UNIQUE KEY `ID_Oferecimento_IND` (`Codigo`,`ID_Disciplina`),
  KEY `FKOfe_Dis_IND` (`ID_Disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Participa`
--

CREATE TABLE IF NOT EXISTS `Participa` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  `Bolsa` char(1) NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Projeto`),
  UNIQUE KEY `ID_Participa_IND` (`ID_Usuario`,`ID_Projeto`),
  KEY `FKPar_Pro_IND` (`ID_Projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pos_Graduacao`
--

CREATE TABLE IF NOT EXISTS `Pos_Graduacao` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKCur_Pos_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Pos_Graduacao`
--

INSERT INTO `Pos_Graduacao` (`Codigo`) VALUES
(2);

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
(2, 'carreira', 'nivel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto`
--

CREATE TABLE IF NOT EXISTS `Projeto` (
  `objetivo` char(255) NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Descricao` char(255) NOT NULL,
  `Data_Termino` date NOT NULL,
  `Atividade` char(255) NOT NULL,
  `Orcamento` int(20) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_Financiador` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `ID_Projeto_IND` (`ID_Projeto`),
  KEY `FKFinancia_IND` (`ID_Financiador`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `Projeto`
--

INSERT INTO `Projeto` (`objetivo`, `Data_Inicio`, `Descricao`, `Data_Termino`, `Atividade`, `Orcamento`, `ID_Projeto`, `ID_Financiador`) VALUES
('objetivo do projeto de pesquisa', '2016-11-01', 'descrição do projeto de pesquisa', '2016-11-19', 'atividade  do projeto de pesquisa', 2000, 1, 1),
('objetivo do projeto de extensao', '2016-11-01', 'descrção do projeto de extensao', '2016-11-05', 'atividade do projeto de extensao', 5000, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto_Extensao`
--

CREATE TABLE IF NOT EXISTS `Projeto_Extensao` (
  `ID_Projeto` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `FKPro_Pro_1_IND` (`ID_Projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Projeto_Extensao`
--

INSERT INTO `Projeto_Extensao` (`ID_Projeto`) VALUES
(2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto_Pesquisa`
--

CREATE TABLE IF NOT EXISTS `Projeto_Pesquisa` (
  `ID_Projeto` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `FKPro_Pro_IND` (`ID_Projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Projeto_Pesquisa`
--

INSERT INTO `Projeto_Pesquisa` (`ID_Projeto`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Recebe`
--

CREATE TABLE IF NOT EXISTS `Recebe` (
  `R_F_ID_Usuario` int(11) NOT NULL,
  `Salario` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`R_F_ID_Usuario`),
  UNIQUE KEY `FKRec_Fun_IND` (`R_F_ID_Usuario`),
  KEY `FKRec_Pro_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Unidade`
--

CREATE TABLE IF NOT EXISTS `Unidade` (
  `nome` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(255) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `ID_Unidade_IND` (`ID_Unidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(255) NOT NULL,
  `cpf` char(14) NOT NULL,
  `Sexo` char(255) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `ID_Usuario_IND` (`ID_Usuario`),
  KEY `FKCadastro_IND` (`ID_Unidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `Usuario`
--

INSERT INTO `Usuario` (`ID_Usuario`, `nome`, `cpf`, `Sexo`, `data_de_nascimento`, `ID_Unidade`) VALUES
(1, 'nome do aluno', '666.666.666-66', 'masc', '2016-11-01', 1),
(2, 'nome do professor', '666.666.666-66', 'masc', '2016-11-01', 1),
(3, 'nome do funcionario', '666.666.666-66', 'masc', '2016-11-01', 1),
(4, 'nome do aluno da pos', '666.666.666-66', 'masc', '2016-11-01', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Verba`
--

CREATE TABLE IF NOT EXISTS `Verba` (
  `Valor` bigint(20) NOT NULL,
  `Data` date NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  KEY `FKganha_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `Aluno`
--
ALTER TABLE `Aluno`
  ADD CONSTRAINT `FKcursa_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`),
  ADD CONSTRAINT `FKOrientacao_FK` FOREIGN KEY (`Ori_ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`),
  ADD CONSTRAINT `FKUsu_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Atividade_Possui`
--
ALTER TABLE `Atividade_Possui`
  ADD CONSTRAINT `FKAti_Cal` FOREIGN KEY (`ID_Cal`) REFERENCES `Calendario` (`ID_Cal`),
  ADD CONSTRAINT `FKAti_Pro_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto_Extensao` (`ID_Projeto`);

--
-- Limitadores para a tabela `Bens`
--
ALTER TABLE `Bens`
  ADD CONSTRAINT `FKPossui_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Coordena`
--
ALTER TABLE `Coordena`
  ADD CONSTRAINT `FKCoo_Pro_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto_Pesquisa` (`ID_Projeto`),
  ADD CONSTRAINT `FKCoo_Pro_1_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Cursos`
--
ALTER TABLE `Cursos`
  ADD CONSTRAINT `FKComposicao_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Doutorado`
--
ALTER TABLE `Doutorado`
  ADD CONSTRAINT `FKPos_Dou_FK` FOREIGN KEY (`Codigo`) REFERENCES `Pos_Graduacao` (`Codigo`);

--
-- Limitadores para a tabela `Exerce`
--
ALTER TABLE `Exerce`
  ADD CONSTRAINT `FKExe_Alu_FK` FOREIGN KEY (`E_A_ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKExe_Fun_FK` FOREIGN KEY (`E_F_ID_Usuario`) REFERENCES `Funcionario` (`ID_Usuario`),
  ADD CONSTRAINT `FKExe_Pro_1` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto_Extensao` (`ID_Projeto`),
  ADD CONSTRAINT `FKExe_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Folha_de_Pagamento`
--
ALTER TABLE `Folha_de_Pagamento`
  ADD CONSTRAINT `FKRec_Fol_FK` FOREIGN KEY (`R_F_ID_Usuario`) REFERENCES `Recebe` (`R_F_ID_Usuario`);

--
-- Limitadores para a tabela `Funcionario`
--
ALTER TABLE `Funcionario`
  ADD CONSTRAINT `FKUsu_Fun_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Graduacao`
--
ALTER TABLE `Graduacao`
  ADD CONSTRAINT `FKCur_Gra_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`);

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
  ADD CONSTRAINT `FKInd_Alu_FK` FOREIGN KEY (`I_A_ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKInd_Cur_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`),
  ADD CONSTRAINT `FKInd_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Mestrado_Academico`
--
ALTER TABLE `Mestrado_Academico`
  ADD CONSTRAINT `FKPos_Mes_FK` FOREIGN KEY (`Codigo`) REFERENCES `Pos_Graduacao` (`Codigo`);

--
-- Limitadores para a tabela `Mestrado_Profissional`
--
ALTER TABLE `Mestrado_Profissional`
  ADD CONSTRAINT `FKPos_Mes_1_FK` FOREIGN KEY (`Codigo`) REFERENCES `Pos_Graduacao` (`Codigo`);

--
-- Limitadores para a tabela `Ocorrencias`
--
ALTER TABLE `Ocorrencias`
  ADD CONSTRAINT `FKfuncionario_tem_FK` FOREIGN KEY (`Fun_ID_Usuario`) REFERENCES `Funcionario` (`ID_Usuario`),
  ADD CONSTRAINT `FKprofessor_tem_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Oferecimento`
--
ALTER TABLE `Oferecimento`
  ADD CONSTRAINT `FKOfe_Cur` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`),
  ADD CONSTRAINT `FKOfe_Dis_FK` FOREIGN KEY (`ID_Disciplina`) REFERENCES `Disciplinas` (`ID_Disciplina`);

--
-- Limitadores para a tabela `Participa`
--
ALTER TABLE `Participa`
  ADD CONSTRAINT `FKPar_Alu` FOREIGN KEY (`ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKPar_Pro_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto_Pesquisa` (`ID_Projeto`);

--
-- Limitadores para a tabela `Pos_Graduacao`
--
ALTER TABLE `Pos_Graduacao`
  ADD CONSTRAINT `FKCur_Pos_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`);

--
-- Limitadores para a tabela `Professor`
--
ALTER TABLE `Professor`
  ADD CONSTRAINT `FKUsu_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Projeto`
--
ALTER TABLE `Projeto`
  ADD CONSTRAINT `FKFinancia_FK` FOREIGN KEY (`ID_Financiador`) REFERENCES `Financiador` (`ID_Financiador`);

--
-- Limitadores para a tabela `Projeto_Extensao`
--
ALTER TABLE `Projeto_Extensao`
  ADD CONSTRAINT `FKPro_Pro_1_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto` (`ID_Projeto`);

--
-- Limitadores para a tabela `Projeto_Pesquisa`
--
ALTER TABLE `Projeto_Pesquisa`
  ADD CONSTRAINT `FKPro_Pro_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto` (`ID_Projeto`);

--
-- Limitadores para a tabela `Recebe`
--
ALTER TABLE `Recebe`
  ADD CONSTRAINT `FKRec_Fun_FK` FOREIGN KEY (`R_F_ID_Usuario`) REFERENCES `Funcionario` (`ID_Usuario`),
  ADD CONSTRAINT `FKRec_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `FKCadastro_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Verba`
--
ALTER TABLE `Verba`
  ADD CONSTRAINT `FKganha_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
