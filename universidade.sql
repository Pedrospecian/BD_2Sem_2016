-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.24-log
-- Versão do PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `universidade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acervo_biblioteca`
--

CREATE TABLE IF NOT EXISTS `acervo_biblioteca` (
  `B_Item_Id` bigint(20) NOT NULL,
  `B_Item_Nome` char(255) NOT NULL,
  `B_Item_Tipo` char(255) NOT NULL,
  `ID_Bib` int(11) NOT NULL,
  PRIMARY KEY (`B_Item_Id`),
  UNIQUE KEY `ID_Acervo_Biblioteca_IND` (`B_Item_Id`),
  KEY `FKBiblioteca_Possui_IND` (`ID_Bib`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acervo_museu`
--

CREATE TABLE IF NOT EXISTS `acervo_museu` (
  `M_Item_Id` int(11) NOT NULL,
  `M_Item_Nome` char(1) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`M_Item_Id`),
  UNIQUE KEY `ID_Acervo_Museu_IND` (`M_Item_Id`),
  KEY `FKMuseu_Possui_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `ID_Usuario` int(11) NOT NULL,
  `Codigo` bigint(20) NOT NULL,
  `Ise_Codigo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKUsu_Alu_IND` (`ID_Usuario`),
  KEY `FKcursa_IND` (`Codigo`),
  KEY `FKIsencao_na_inscricao_IND` (`Ise_Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`ID_Usuario`, `Codigo`, `Ise_Codigo`) VALUES
(0, 7, 7),
(20, 7, 7),
(21, 8, NULL),
(22, 7, NULL),
(23, 8, 8),
(24, 7, 7),
(25, 8, 8),
(26, 7, NULL),
(27, 8, NULL),
(28, 7, NULL),
(29, 8, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividades_extensao`
--

CREATE TABLE IF NOT EXISTS `atividades_extensao` (
  `ID_Ati` int(11) NOT NULL AUTO_INCREMENT,
  `Localizacao` char(255) NOT NULL,
  `Data_Atividade` date NOT NULL,
  PRIMARY KEY (`ID_Ati`),
  UNIQUE KEY `ID_IND` (`ID_Ati`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atribuicoes`
--

CREATE TABLE IF NOT EXISTS `atribuicoes` (
  `Data_inicio` date DEFAULT NULL,
  `Id_Atribuicoes` int(11) NOT NULL,
  `Nome_Atribuicao` char(255) NOT NULL,
  `Data_fim` date DEFAULT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Atribuicoes`),
  UNIQUE KEY `ID_Atribuicoes_IND` (`Id_Atribuicoes`),
  KEY `FKProfessor_possui_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atribuicoes`
--

INSERT INTO `atribuicoes` (`Data_inicio`, `Id_Atribuicoes`, `Nome_Atribuicao`, `Data_fim`, `ID_Usuario`) VALUES
('2016-02-01', 1, 'Coordenador', '2016-11-30', 9),
('2012-02-01', 2, 'Reitor', '2016-11-30', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bens`
--

CREATE TABLE IF NOT EXISTS `bens` (
  `Localizacao` char(255) NOT NULL,
  `Valor` int(11) NOT NULL,
  `ID_bem` int(11) NOT NULL,
  `Data_de_Aquisicao` date NOT NULL,
  `Tipo` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_bem`),
  UNIQUE KEY `ID_Bens_IND` (`ID_bem`),
  KEY `FKPossui_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `biblioteca`
--

CREATE TABLE IF NOT EXISTS `biblioteca` (
  `ID_Bib` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Unidade` int(11) DEFAULT NULL,
  `B_Nome` char(255) NOT NULL,
  PRIMARY KEY (`ID_Bib`),
  UNIQUE KEY `ID_IND` (`ID_Bib`),
  UNIQUE KEY `FKEnsino_Possui3_ID` (`ID_Unidade`),
  UNIQUE KEY `FKEnsino_Possui3_IND` (`ID_Unidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `biblioteca`
--

INSERT INTO `biblioteca` (`ID_Bib`, `ID_Unidade`, `B_Nome`) VALUES
(1, 1, 'Biblioteca da EACH'),
(2, 6, 'Biblioteca do Faculdade de Direito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordena`
--

CREATE TABLE IF NOT EXISTS `coordena` (
  `ID_Projeto` bigint(20) NOT NULL,
  `Indice_Pequisador` int(11) NOT NULL,
  `Bolsa_Pesquisador` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `FKCoo_Pro_1_IND` (`ID_Projeto`),
  KEY `FKCoo_Pro_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `creditos`
--

CREATE TABLE IF NOT EXISTS `creditos` (
  `ID_Res` int(11) NOT NULL,
  `Nro_de_Creditos` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Res`),
  UNIQUE KEY `FKCre_Res_IND` (`ID_Res`),
  KEY `FKCre_Usu_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `Codigo` bigint(20) NOT NULL,
  `Nome` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `ID_Cursos_IND` (`Codigo`),
  KEY `FKComposicao_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`Codigo`, `Nome`, `ID_Unidade`) VALUES
(1, 'Sistemas de Informação', 1),
(3, 'Gestão de Políticas Públicas', 1),
(4, 'Administração', 6),
(6, 'Direito', 5),
(7, 'MBA em Marketing', 6),
(8, 'MBA em Gestão de Negócios', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE IF NOT EXISTS `disciplinas` (
  `ID_Disciplina` int(11) NOT NULL,
  `Nome` char(255) NOT NULL,
  PRIMARY KEY (`ID_Disciplina`),
  UNIQUE KEY `ID_Disciplinas_IND` (`ID_Disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`ID_Disciplina`, `Nome`) VALUES
(1, 'Banco de Dados'),
(2, 'Inteligência Artificial'),
(3, 'Microeconomia e Políticas Públicas'),
(4, 'Ética e Políticas Públicas'),
(5, 'Direito Constitucional'),
(6, 'Fundamentos de Administração');

-- --------------------------------------------------------

--
-- Estrutura da tabela `doutorado`
--

CREATE TABLE IF NOT EXISTS `doutorado` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKStr_Dou_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE IF NOT EXISTS `emprestimos` (
  `Data_Inicio` date NOT NULL,
  `Id_Emprestimo` bigint(20) NOT NULL,
  `Data_Devolucao` date NOT NULL,
  `B_Item_Id` bigint(20) NOT NULL,
  PRIMARY KEY (`Id_Emprestimo`),
  UNIQUE KEY `ID_Emprestimos_IND` (`Id_Emprestimo`),
  KEY `FKEmpresta_IND` (`B_Item_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ensino`
--

CREATE TABLE IF NOT EXISTS `ensino` (
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `FKUni_Ens_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ensino`
--

INSERT INTO `ensino` (`ID_Unidade`) VALUES
(1),
(5),
(6),
(21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `extensao_possui`
--

CREATE TABLE IF NOT EXISTS `extensao_possui` (
  `ID_Ati` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Projeto`,`ID_Ati`),
  UNIQUE KEY `ID_Extensao_Possui_IND` (`ID_Projeto`,`ID_Ati`),
  KEY `FKExt_Ati_IND` (`ID_Ati`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `financiador`
--

CREATE TABLE IF NOT EXISTS `financiador` (
  `Tipo` char(255) NOT NULL,
  `nome` char(255) NOT NULL,
  `ID_Financiador` int(11) NOT NULL,
  PRIMARY KEY (`ID_Financiador`),
  UNIQUE KEY `ID_Financiador_IND` (`ID_Financiador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `financiador`
--

INSERT INTO `financiador` (`Tipo`, `nome`, `ID_Financiador`) VALUES
('Público', 'A', 1),
('Privado', 'B', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `folha_de_pagamento`
--

CREATE TABLE IF NOT EXISTS `folha_de_pagamento` (
  `Salario` int(11) NOT NULL,
  `Data` date NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Data`),
  UNIQUE KEY `ID_Folha_de_Pagamento_IND` (`Data`),
  KEY `FKServidor_Recebe_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `ID_Usuario` int(11) NOT NULL,
  `Funcao` char(255) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKSer_Fun_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `graduacao`
--

CREATE TABLE IF NOT EXISTS `graduacao` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKCur_Gra_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `graduacao`
--

INSERT INTO `graduacao` (`Codigo`) VALUES
(1),
(3),
(4),
(6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE IF NOT EXISTS `historico` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  `Notas` int(11) NOT NULL,
  `Frequencia` int(11) NOT NULL,
  PRIMARY KEY (`ID_Disciplina`,`ID_Usuario`),
  UNIQUE KEY `ID_Historico_IND` (`ID_Disciplina`,`ID_Usuario`),
  KEY `FKHis_Alu_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospital`
--

CREATE TABLE IF NOT EXISTS `hospital` (
  `ID_Unidade` int(11) DEFAULT NULL,
  `H_Nome` char(1) NOT NULL,
  UNIQUE KEY `FKEnsino_Possui1_ID` (`ID_Unidade`),
  UNIQUE KEY `FKEnsino_Possui1_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `indice_de_desempenho`
--

CREATE TABLE IF NOT EXISTS `indice_de_desempenho` (
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
-- Estrutura da tabela `latu_sensu`
--

CREATE TABLE IF NOT EXISTS `latu_sensu` (
  `Codigo` bigint(20) NOT NULL,
  `Valor_Mensalidade` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKPos_Lat_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `latu_sensu`
--

INSERT INTO `latu_sensu` (`Codigo`, `Valor_Mensalidade`) VALUES
(7, 1000),
(8, 2000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mestrado_academico`
--

CREATE TABLE IF NOT EXISTS `mestrado_academico` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKStr_Mes_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mestrado_profissional`
--

CREATE TABLE IF NOT EXISTS `mestrado_profissional` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKStr_Mes_1_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `museu`
--

CREATE TABLE IF NOT EXISTS `museu` (
  `ID_Unidade` int(11) NOT NULL,
  `M_Nome` char(255) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `FKUni_Mus_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencias`
--

CREATE TABLE IF NOT EXISTS `ocorrencias` (
  `ID_Ocorrencia` int(11) NOT NULL,
  `Tipo_Ocorrencia` char(255) NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Data_Final` date NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Ocorrencia`),
  UNIQUE KEY `ID_Ocorrencias_IND` (`ID_Ocorrencia`),
  KEY `FKServidor_tem_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ocorrencias`
--

INSERT INTO `ocorrencias` (`ID_Ocorrencia`, `Tipo_Ocorrencia`, `Data_Inicio`, `Data_Final`, `ID_Usuario`) VALUES
(1, 'Licença', '2016-08-01', '2016-08-30', 5),
(2, 'Licença', '2016-05-01', '2016-05-30', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `oferecimento`
--

CREATE TABLE IF NOT EXISTS `oferecimento` (
  `Codigo` bigint(20) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  PRIMARY KEY (`ID_Disciplina`,`Codigo`),
  UNIQUE KEY `ID_Oferecimento_IND` (`ID_Disciplina`,`Codigo`),
  KEY `FKOfe_Cur_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `oferecimento`
--

INSERT INTO `oferecimento` (`Codigo`, `ID_Disciplina`) VALUES
(1, 1),
(1, 2),
(3, 3),
(3, 4),
(4, 6),
(6, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `participa`
--

CREATE TABLE IF NOT EXISTS `participa` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  `Bolsa` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`,`ID_Usuario`),
  UNIQUE KEY `ID_Participa_IND` (`ID_Projeto`,`ID_Usuario`),
  KEY `FKPar_Alu_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_graduacao`
--

CREATE TABLE IF NOT EXISTS `pos_graduacao` (
  `Codigo` bigint(20) NOT NULL,
  `Data_defesa_do_Trabalho_final` date NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKCur_Pos_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pos_graduacao`
--

INSERT INTO `pos_graduacao` (`Codigo`, `Data_defesa_do_Trabalho_final`) VALUES
(7, '2016-11-30'),
(8, '2016-11-30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE IF NOT EXISTS `professor` (
  `ID_Usuario` int(11) NOT NULL,
  `nivel` char(255) NOT NULL,
  `carreira` char(255) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKSer_Pro_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`ID_Usuario`, `nivel`, `carreira`) VALUES
(5, 'A', 'Titular'),
(6, 'B', 'Doutor'),
(7, 'C', 'Doutor'),
(8, 'A', 'Livre Docente'),
(9, 'A', 'Titular');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE IF NOT EXISTS `projeto` (
  `objetivo` char(255) NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Descricao` char(255) NOT NULL,
  `Data_Termino` date NOT NULL,
  `Orcamento` bigint(20) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  `ID_Financiador` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `ID_Projeto_IND` (`ID_Projeto`),
  KEY `FKFinancia_IND` (`ID_Financiador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`objetivo`, `Data_Inicio`, `Descricao`, `Data_Termino`, `Orcamento`, `ID_Projeto`, `ID_Financiador`) VALUES
('Urbanismo na Gestão Pública', '2016-03-01', 'Urbanismo na Gestão Pública', '2016-11-01', 2000, 2011, 1),
('Informática para alunos do Ensino Fundamental', '2016-03-01', 'Informática para alunos do Ensino Fundamental', '2016-11-01', 2000, 2012, 2),
('Pesquisa em Mineração de Dados', '2016-03-01', 'Pesquisa em Mineração de Dados', '2016-11-01', 3000, 2013, 1),
('Pesquisa em Direito Digital', '2016-03-01', 'Pesquisa em Direito Digital', '2016-11-01', 3500, 2014, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_extensao`
--

CREATE TABLE IF NOT EXISTS `projeto_extensao` (
  `ID_Projeto` bigint(20) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `FKPro_Pro_1_IND` (`ID_Projeto`),
  KEY `FKexerce_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto_extensao`
--

INSERT INTO `projeto_extensao` (`ID_Projeto`, `ID_Usuario`) VALUES
(2012, 5),
(2011, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_pesquisa`
--

CREATE TABLE IF NOT EXISTS `projeto_pesquisa` (
  `ID_Projeto` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `FKPro_Pro_IND` (`ID_Projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto_pesquisa`
--

INSERT INTO `projeto_pesquisa` (`ID_Projeto`) VALUES
(2013),
(2014);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reitoria`
--

CREATE TABLE IF NOT EXISTS `reitoria` (
  `Cnpj` varchar(20) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`Cnpj`),
  UNIQUE KEY `ID_Reitoria_IND` (`Cnpj`),
  KEY `FKAdmnistra_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `restaurante`
--

CREATE TABLE IF NOT EXISTS `restaurante` (
  `ID_Res` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Unidade` int(11) DEFAULT NULL,
  `R_Nome` char(255) NOT NULL,
  PRIMARY KEY (`ID_Res`),
  UNIQUE KEY `ID_IND` (`ID_Res`),
  UNIQUE KEY `FKEnsino_Possui2_ID` (`ID_Unidade`),
  UNIQUE KEY `FKEnsino_Possui2_IND` (`ID_Unidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `restaurante`
--

INSERT INTO `restaurante` (`ID_Res`, `ID_Unidade`, `R_Nome`) VALUES
(1, 1, 'Restaurante da EACH'),
(2, 5, 'Restaurante da Faculdade de Direito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servidor`
--

CREATE TABLE IF NOT EXISTS `servidor` (
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKUsu_Ser_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `servidor`
--

INSERT INTO `servidor` (`ID_Usuario`) VALUES
(5),
(6),
(7),
(8),
(9),
(10),
(12),
(18),
(19);

-- --------------------------------------------------------

--
-- Estrutura da tabela `strictu_sensu`
--

CREATE TABLE IF NOT EXISTS `strictu_sensu` (
  `Codigo` bigint(20) NOT NULL,
  `Data_final_qualifiacao` date NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKPos_Str_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade`
--

CREATE TABLE IF NOT EXISTS `unidade` (
  `Nome_Unidade` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  `Endereco` char(255) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `ID_Unidade_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `unidade`
--

INSERT INTO `unidade` (`Nome_Unidade`, `ID_Unidade`, `Endereco`) VALUES
('Escola de Artes, Ciências e Humanidades', 1, 'Rua Arlindo Béttio, 1000 Ermelino Matarazzo, SP'),
('Faculdade de Direito', 5, 'Largo São Francisco, 95\r\nSão Paulo, SP'),
('Faculdade de Economia, Administração e Contabilidade', 6, 'Av. Prof. Luciano Gualberto, 908 - Butantã, São Paulo - SP, 05508-010'),
('Reitoria', 21, 'R. da Reitoria, 374 - Butantã, São Paulo - SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
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
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `nome`, `cpf`, `Sexo`, `data_de_nascimento`, `ID_Unidade`) VALUES
(0, '1', '', '', '0000-00-00', 1),
(5, 'Márcio Costa', '183.427.466-40', 'Masculino', '1971-03-23', 1),
(6, 'Fernanda Almeida', '880.185.271-13', 'Feminino', '1971-10-20', 1),
(7, 'Paulo Antunes', '384.126.948-64', 'Masculino', '1971-11-23', 5),
(8, 'Laura Santos', '582.223.411-97', 'Feminino', '1972-07-10', 5),
(9, 'Cláudia Silva', '455.979.542-88', 'Feminino', '1973-02-05', 6),
(10, 'João Santos', '325.184.027-48', 'Masculino', '1973-05-01', 6),
(12, 'José Oliveira', '227.064.963-04', 'Masculino', '1973-09-20', 1),
(18, 'Fábio Lima', '027.728.832-05', 'Masculino', '1975-08-18', 21),
(19, 'Raquel Ferreira', '166.234.703-01', 'Feminino', '1976-12-09', 1),
(20, 'Mateus Barros', '140.342.783-66', 'Masculino', '1994-03-21', 1),
(21, 'Juliana Oliveira', '851.860.336-69', 'Feminino', '1994-05-26', 1),
(22, 'Vinícius Ferreira', '428.481.728-00', 'Masculino', '1994-11-17', 5),
(23, 'Patrícia Costa', '872.669.135-35', 'Feminino', '1995-03-16', 5),
(24, 'Roberta Almeida', '328.689.635-79', 'Feminino', '1995-04-20', 6),
(25, 'Fábio Santos', '867.449.174-04', 'Masculino', '1995-11-03', 6),
(26, 'Denise Silva', '789.822.516-34', 'Feminino', '1996-01-12', 21),
(27, 'Felipe Prado', '523.124.337-02', 'Masculino', '1996-01-31', 1),
(28, 'Natália Santos', '002.889.189-91', 'Feminino', '1996-09-04', 1),
(29, 'Daniel Ferreira', '188.122.978-54', 'Masculino', '1996-12-13', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `verba`
--

CREATE TABLE IF NOT EXISTS `verba` (
  `Valor` bigint(20) NOT NULL,
  `Data` date NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  KEY `FKganha_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `acervo_biblioteca`
--
ALTER TABLE `acervo_biblioteca`
  ADD CONSTRAINT `FKBiblioteca_Possui_FK` FOREIGN KEY (`ID_Bib`) REFERENCES `biblioteca` (`ID_Bib`);

--
-- Restrições para a tabela `acervo_museu`
--
ALTER TABLE `acervo_museu`
  ADD CONSTRAINT `FKMuseu_Possui_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `museu` (`ID_Unidade`);

--
-- Restrições para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `FKcursa_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`),
  ADD CONSTRAINT `FKIsencao_na_inscricao_FK` FOREIGN KEY (`Ise_Codigo`) REFERENCES `latu_sensu` (`Codigo`),
  ADD CONSTRAINT `FKUsu_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Restrições para a tabela `atribuicoes`
--
ALTER TABLE `atribuicoes`
  ADD CONSTRAINT `FKProfessor_possui_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `professor` (`ID_Usuario`);

--
-- Restrições para a tabela `bens`
--
ALTER TABLE `bens`
  ADD CONSTRAINT `FKPossui_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Restrições para a tabela `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD CONSTRAINT `FKEnsino_Possui3_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `ensino` (`ID_Unidade`);

--
-- Restrições para a tabela `coordena`
--
ALTER TABLE `coordena`
  ADD CONSTRAINT `FKCoo_Pro_1_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto_pesquisa` (`ID_Projeto`),
  ADD CONSTRAINT `FKCoo_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `professor` (`ID_Usuario`);

--
-- Restrições para a tabela `creditos`
--
ALTER TABLE `creditos`
  ADD CONSTRAINT `FKCre_Res_FK` FOREIGN KEY (`ID_Res`) REFERENCES `restaurante` (`ID_Res`),
  ADD CONSTRAINT `FKCre_Usu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Restrições para a tabela `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `FKComposicao_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `ensino` (`ID_Unidade`);

--
-- Restrições para a tabela `doutorado`
--
ALTER TABLE `doutorado`
  ADD CONSTRAINT `FKStr_Dou_FK` FOREIGN KEY (`Codigo`) REFERENCES `strictu_sensu` (`Codigo`);

--
-- Restrições para a tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `FKEmpresta_FK` FOREIGN KEY (`B_Item_Id`) REFERENCES `acervo_biblioteca` (`B_Item_Id`);

--
-- Restrições para a tabela `ensino`
--
ALTER TABLE `ensino`
  ADD CONSTRAINT `FKUni_Ens_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Restrições para a tabela `extensao_possui`
--
ALTER TABLE `extensao_possui`
  ADD CONSTRAINT `FKExt_Ati_FK` FOREIGN KEY (`ID_Ati`) REFERENCES `atividades_extensao` (`ID_Ati`),
  ADD CONSTRAINT `FKExt_Pro` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto_extensao` (`ID_Projeto`);

--
-- Restrições para a tabela `folha_de_pagamento`
--
ALTER TABLE `folha_de_pagamento`
  ADD CONSTRAINT `FKServidor_Recebe_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Restrições para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FKSer_Fun_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Restrições para a tabela `graduacao`
--
ALTER TABLE `graduacao`
  ADD CONSTRAINT `FKCur_Gra_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`);

--
-- Restrições para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `FKHis_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKHis_Dis` FOREIGN KEY (`ID_Disciplina`) REFERENCES `disciplinas` (`ID_Disciplina`);

--
-- Restrições para a tabela `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `FKEnsino_Possui1_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `ensino` (`ID_Unidade`);

--
-- Restrições para a tabela `indice_de_desempenho`
--
ALTER TABLE `indice_de_desempenho`
  ADD CONSTRAINT `FKInd_Alu_FK` FOREIGN KEY (`I_A_ID_Usuario`) REFERENCES `aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKInd_Cur_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`),
  ADD CONSTRAINT `FKInd_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `professor` (`ID_Usuario`);

--
-- Restrições para a tabela `latu_sensu`
--
ALTER TABLE `latu_sensu`
  ADD CONSTRAINT `FKPos_Lat_FK` FOREIGN KEY (`Codigo`) REFERENCES `pos_graduacao` (`Codigo`);

--
-- Restrições para a tabela `mestrado_academico`
--
ALTER TABLE `mestrado_academico`
  ADD CONSTRAINT `FKStr_Mes_FK` FOREIGN KEY (`Codigo`) REFERENCES `strictu_sensu` (`Codigo`);

--
-- Restrições para a tabela `mestrado_profissional`
--
ALTER TABLE `mestrado_profissional`
  ADD CONSTRAINT `FKStr_Mes_1_FK` FOREIGN KEY (`Codigo`) REFERENCES `strictu_sensu` (`Codigo`);

--
-- Restrições para a tabela `museu`
--
ALTER TABLE `museu`
  ADD CONSTRAINT `FKUni_Mus_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Restrições para a tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD CONSTRAINT `FKServidor_tem_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Restrições para a tabela `oferecimento`
--
ALTER TABLE `oferecimento`
  ADD CONSTRAINT `FKOfe_Cur_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`),
  ADD CONSTRAINT `FKOfe_Dis` FOREIGN KEY (`ID_Disciplina`) REFERENCES `disciplinas` (`ID_Disciplina`);

--
-- Restrições para a tabela `participa`
--
ALTER TABLE `participa`
  ADD CONSTRAINT `FKPar_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKPar_Pro` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto` (`ID_Projeto`);

--
-- Restrições para a tabela `pos_graduacao`
--
ALTER TABLE `pos_graduacao`
  ADD CONSTRAINT `FKCur_Pos_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`);

--
-- Restrições para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `FKSer_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Restrições para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `FKFinancia_FK` FOREIGN KEY (`ID_Financiador`) REFERENCES `financiador` (`ID_Financiador`);

--
-- Restrições para a tabela `projeto_extensao`
--
ALTER TABLE `projeto_extensao`
  ADD CONSTRAINT `FKPro_Pro_1_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto` (`ID_Projeto`),
  ADD CONSTRAINT `FKexerce_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Restrições para a tabela `projeto_pesquisa`
--
ALTER TABLE `projeto_pesquisa`
  ADD CONSTRAINT `FKPro_Pro_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto` (`ID_Projeto`);

--
-- Restrições para a tabela `reitoria`
--
ALTER TABLE `reitoria`
  ADD CONSTRAINT `FKAdmnistra_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Restrições para a tabela `restaurante`
--
ALTER TABLE `restaurante`
  ADD CONSTRAINT `FKEnsino_Possui2_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `ensino` (`ID_Unidade`);

--
-- Restrições para a tabela `servidor`
--
ALTER TABLE `servidor`
  ADD CONSTRAINT `FKUsu_Ser_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Restrições para a tabela `strictu_sensu`
--
ALTER TABLE `strictu_sensu`
  ADD CONSTRAINT `FKPos_Str_FK` FOREIGN KEY (`Codigo`) REFERENCES `pos_graduacao` (`Codigo`);

--
-- Restrições para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FKCadastro_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Restrições para a tabela `verba`
--
ALTER TABLE `verba`
  ADD CONSTRAINT `FKganha_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
