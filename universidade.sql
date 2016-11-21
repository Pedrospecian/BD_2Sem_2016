-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 21-Nov-2016 às 21:17
-- Versão do servidor: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universidade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acervo_biblioteca`
--

CREATE TABLE `acervo_biblioteca` (
  `B_Item_Id` bigint(20) NOT NULL,
  `B_Item_Nome` char(255) NOT NULL,
  `B_Item_Tipo` char(255) NOT NULL,
  `ID_Bib` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acervo_museu`
--

CREATE TABLE `acervo_museu` (
  `M_Item_Id` int(11) NOT NULL,
  `M_Item_Nome` char(1) NOT NULL,
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `ID_Usuario` int(11) NOT NULL,
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`ID_Usuario`, `Codigo`) VALUES
(20, 1),
(21, 2),
(22, 3),
(23, 4),
(24, 5),
(25, 6),
(26, 7),
(27, 8),
(28, 9),
(29, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividades_extensao`
--

CREATE TABLE `atividades_extensao` (
  `ID_Ati` int(11) NOT NULL,
  `Localizacao` char(255) NOT NULL,
  `Data_Atividade` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bens`
--

CREATE TABLE `bens` (
  `Localizacao` char(255) NOT NULL,
  `Valor` int(11) NOT NULL,
  `ID_bem` int(11) NOT NULL,
  `Data_de_Aquisicao` date NOT NULL,
  `Tipo` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `biblioteca`
--

CREATE TABLE `biblioteca` (
  `ID_Bib` int(11) NOT NULL,
  `ID_Unidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordena`
--

CREATE TABLE `coordena` (
  `ID_Projeto` bigint(20) NOT NULL,
  `Indice_Pequisador` int(11) NOT NULL,
  `Bolsa_Pesquisador` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `creditos`
--

CREATE TABLE `creditos` (
  `ID_Res` int(11) NOT NULL,
  `Nro_de_Creditos` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `Codigo` bigint(20) NOT NULL,
  `Nome` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`Codigo`, `Nome`) VALUES
(1, 'Gestão Ambiental'),
(2, 'Gestão de Políticas Públicas'),
(3, 'Sistemas de Informação'),
(4, 'Obstetrícia'),
(5, 'Oceanografia'),
(6, 'Geografia'),
(7, 'História'),
(8, 'Ciências Sociais'),
(9, 'Direito'),
(10, 'Engenharia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `ID_Disciplina` int(11) NOT NULL,
  `Nome` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doutorado`
--

CREATE TABLE `doutorado` (
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `Data_Inicio` date NOT NULL,
  `Id_Emprestimo` bigint(20) NOT NULL,
  `Data_Devolucao` date NOT NULL,
  `B_Item_Id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ensino`
--

CREATE TABLE `ensino` (
  `ID_Unidade` int(11) NOT NULL,
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `extensao_possui`
--

CREATE TABLE `extensao_possui` (
  `ID_Ati` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `financiador`
--

CREATE TABLE `financiador` (
  `Tipo` char(255) NOT NULL,
  `nome` char(255) NOT NULL,
  `ID_Financiador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `financiador`
--

INSERT INTO `financiador` (`Tipo`, `nome`, `ID_Financiador`) VALUES
('privado', 'nome do privado', 1),
('publico', 'nome do publico', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `folha_de_pagamento`
--

CREATE TABLE `folha_de_pagamento` (
  `ID_Usuario` int(11) NOT NULL,
  `Salario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `ID_Usuario` int(11) NOT NULL,
  `Funcao` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`ID_Usuario`, `Funcao`) VALUES
(10, 'Auxiliar Administrativo Pós-Graduação'),
(12, 'Auxiliar Administrativo Pós-Graduação'),
(18, 'Auxiliar Administrativo Graduação'),
(19, 'Auxiliar Administrativo Graduação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `graduacao`
--

CREATE TABLE `graduacao` (
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  `Notas` int(11) NOT NULL,
  `Frequencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospital`
--

CREATE TABLE `hospital` (
  `ID_Unidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `indice_de_desempenho`
--

CREATE TABLE `indice_de_desempenho` (
  `Codigo` bigint(20) NOT NULL,
  `Indice_Curso` char(1) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `I_A_ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mestrado_academico`
--

CREATE TABLE `mestrado_academico` (
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mestrado_profissional`
--

CREATE TABLE `mestrado_profissional` (
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `museu`
--

CREATE TABLE `museu` (
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `ID_Ocorrencia` int(11) NOT NULL,
  `Tipo_Ocorrencia` char(255) NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Data_Final` date NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `oferecimento`
--

CREATE TABLE `oferecimento` (
  `Codigo` bigint(20) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `participa`
--

CREATE TABLE `participa` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  `Bolsa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_graduacao`
--

CREATE TABLE `pos_graduacao` (
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `ID_Usuario` int(11) NOT NULL,
  `carreira` char(255) NOT NULL,
  `nivel` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`ID_Usuario`, `carreira`, `nivel`) VALUES
(5, 'Titular', 'A'),
(6, 'Doutor', 'B'),
(7, 'Doutor', 'C'),
(8, 'Livre Docente', 'A'),
(9, 'Titular', 'B');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `objetivo` char(255) NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Descricao` char(255) NOT NULL,
  `Data_Termino` date NOT NULL,
  `Orcamento` bigint(20) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  `ID_Financiador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`objetivo`, `Data_Inicio`, `Descricao`, `Data_Termino`, `Orcamento`, `ID_Projeto`, `ID_Financiador`) VALUES
('Urbanismo na Gestão Pública', '2016-03-01', 'Urbanismo na Gestão Pública', '2016-11-01', 2000, 2011, 1),
('Eco design no desenvolvimento sustentável', '2016-03-01', 'Eco design no desenvolvimento sustentável', '2016-11-01', 2000, 2012, 2),
('Os efeitos da constituição de 1988', '2016-03-01', 'Os efeitos da constituição de 1988', '2016-11-01', 3000, 2013, 1),
('Pesquisa em Direito Digital', '2016-03-01', 'Pesquisa em Direito Digital', '2016-11-01', 3500, 2014, 2),
('Pesquisa em mineração de dados', '2016-03-01', 'Pesquisa em mineração de dados', '2016-11-01', 4000, 2015, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_extensao`
--

CREATE TABLE `projeto_extensao` (
  `ID_Projeto` bigint(20) NOT NULL,
  `ID_Usuario` int(11) NOT NULL
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

CREATE TABLE `projeto_pesquisa` (
  `ID_Projeto` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto_pesquisa`
--

INSERT INTO `projeto_pesquisa` (`ID_Projeto`) VALUES
(2013),
(2014),
(2015);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reitoria`
--

CREATE TABLE `reitoria` (
  `Cnpj` varchar(20) NOT NULL,
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `reitoria`
--

INSERT INTO `reitoria` (`Cnpj`, `ID_Unidade`) VALUES
('55920598000129', 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `restaurante`
--

CREATE TABLE `restaurante` (
  `ID_Res` int(11) NOT NULL,
  `ID_Unidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servidor`
--

CREATE TABLE `servidor` (
  `ID_Usuario` int(11) NOT NULL
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
-- Estrutura da tabela `unidade`
--

CREATE TABLE `unidade` (
  `Nome_Unidade` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  `Endereco` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `unidade`
--

INSERT INTO `unidade` (`Nome_Unidade`, `ID_Unidade`, `Endereco`) VALUES
('Escola de Artes, Ciências e Humanidades', 1, 'Rua Arlindo Béttio, 1000 Ermelino Matarazzo, SP'),
('Escola de Comunicações e Artes', 2, 'Av. Prof. Lúcio Martins Rodrigues, 443 Cidade Universitária, SP'),
('Faculdade de Arquitetura e Urbanismo', 4, 'Rua do Lago, 876\r\nCidade Universitária, SP'),
('Faculdade de Direito', 5, 'Largo São Francisco, 95\r\nSão Paulo, SP'),
('Faculdade de Filosofia, Letras e Ciências Humanas', 6, 'Rua do Lago, 717\r\nCidade Universitária, SP'),
('Faculdade de Medicina', 7, 'Av. Dr. Arnaldo, 455\r\nSão Paulo, SP'),
('Instituto Oceanográfico', 10, 'Praça do Oceanográfico, 191\r\nCidade Universitária, SP'),
('Reitoria', 21, 'R. da Reitoria, 374 - Butantã, São Paulo - SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `nome` char(255) NOT NULL,
  `cpf` char(14) NOT NULL,
  `Sexo` char(255) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `nome`, `cpf`, `Sexo`, `data_de_nascimento`, `ID_Unidade`) VALUES
(5, 'Márcio Costa', '183.427.466-40', 'Masculino', '1971-03-23', 1),
(6, 'Fernanda Almeida', '880.185.271-13', 'Feminino', '1971-10-20', 2),
(7, 'Paulo Antunes', '384.126.948-64', 'Masculino', '1971-11-23', 4),
(8, 'Laura Santos', '582.223.411-97', 'Feminino', '1972-07-10', 5),
(9, 'Cláudia Silva', '455.979.542-88', 'Feminino', '1973-02-05', 6),
(10, 'João Santos', '325.184.027-48', 'Masculino', '1973-05-01', 7),
(12, 'José Oliveira', '227.064.963-04', 'Masculino', '1973-09-20', 1),
(18, 'Fábio Lima', '027.728.832-05', 'Masculino', '1975-08-18', 10),
(19, 'Raquel Ferreira', '166.234.703-01', 'Feminino', '1976-12-09', 1),
(20, 'Mateus Barros', '140.342.783-66', 'Masculino', '1994-03-21', 1),
(21, 'Juliana Oliveira', '851.860.336-69', 'Feminino', '1994-05-26', 2),
(22, 'Vinícius Ferreira', '428.481.728-00', 'Masculino', '1994-11-17', 4),
(23, 'Patrícia Costa', '872.669.135-35', 'Feminino', '1995-03-16', 5),
(24, 'Roberta Almeida', '328.689.635-79', 'Feminino', '1995-04-20', 6),
(25, 'Fábio Santos', '867.449.174-04', 'Masculino', '1995-11-03', 7),
(26, 'Denise Silva', '789.822.516-34', 'Feminino', '1996-01-12', 10),
(27, 'Felipe Prado', '523.124.337-02', 'Masculino', '1996-01-31', 1),
(28, 'Natália Santos', '002.889.189-91', 'Feminino', '1996-09-04', 2),
(29, 'Daniel Ferreira', '188.122.978-54', 'Masculino', '1996-12-13', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `verba`
--

CREATE TABLE `verba` (
  `Valor` bigint(20) NOT NULL,
  `Data` date NOT NULL,
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acervo_biblioteca`
--
ALTER TABLE `acervo_biblioteca`
  ADD PRIMARY KEY (`B_Item_Id`),
  ADD UNIQUE KEY `ID_Acervo_Biblioteca_IND` (`B_Item_Id`),
  ADD KEY `FKBiblioteca_Possui_IND` (`ID_Bib`);

--
-- Indexes for table `acervo_museu`
--
ALTER TABLE `acervo_museu`
  ADD PRIMARY KEY (`M_Item_Id`),
  ADD UNIQUE KEY `ID_Acervo_Museu_IND` (`M_Item_Id`),
  ADD KEY `FKMuseu_Possui_IND` (`ID_Unidade`);

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `FKUsu_Alu_IND` (`ID_Usuario`),
  ADD KEY `FKcursa_IND` (`Codigo`);

--
-- Indexes for table `atividades_extensao`
--
ALTER TABLE `atividades_extensao`
  ADD PRIMARY KEY (`ID_Ati`),
  ADD UNIQUE KEY `ID_IND` (`ID_Ati`);

--
-- Indexes for table `bens`
--
ALTER TABLE `bens`
  ADD PRIMARY KEY (`ID_bem`),
  ADD UNIQUE KEY `ID_Bens_IND` (`ID_bem`),
  ADD KEY `FKPossui_IND` (`ID_Unidade`);

--
-- Indexes for table `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD PRIMARY KEY (`ID_Bib`),
  ADD UNIQUE KEY `ID_IND` (`ID_Bib`),
  ADD UNIQUE KEY `FKEnsino_Possui3_ID` (`ID_Unidade`),
  ADD UNIQUE KEY `FKEnsino_Possui3_IND` (`ID_Unidade`);

--
-- Indexes for table `coordena`
--
ALTER TABLE `coordena`
  ADD PRIMARY KEY (`ID_Projeto`),
  ADD UNIQUE KEY `FKCoo_Pro_1_IND` (`ID_Projeto`),
  ADD KEY `FKCoo_Pro_IND` (`ID_Usuario`);

--
-- Indexes for table `creditos`
--
ALTER TABLE `creditos`
  ADD PRIMARY KEY (`ID_Res`),
  ADD UNIQUE KEY `FKCre_Res_IND` (`ID_Res`),
  ADD KEY `FKCre_Usu_IND` (`ID_Usuario`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `ID_Cursos_IND` (`Codigo`);

--
-- Indexes for table `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`ID_Disciplina`),
  ADD UNIQUE KEY `ID_Disciplinas_IND` (`ID_Disciplina`);

--
-- Indexes for table `doutorado`
--
ALTER TABLE `doutorado`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKPos_Dou_IND` (`Codigo`);

--
-- Indexes for table `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`Id_Emprestimo`),
  ADD UNIQUE KEY `ID_Emprestimos_IND` (`Id_Emprestimo`),
  ADD KEY `FKEmpresta_IND` (`B_Item_Id`);

--
-- Indexes for table `ensino`
--
ALTER TABLE `ensino`
  ADD PRIMARY KEY (`ID_Unidade`),
  ADD UNIQUE KEY `FKUni_Ens_IND` (`ID_Unidade`),
  ADD KEY `FKComposicao_IND` (`Codigo`);

--
-- Indexes for table `extensao_possui`
--
ALTER TABLE `extensao_possui`
  ADD PRIMARY KEY (`ID_Projeto`,`ID_Ati`),
  ADD UNIQUE KEY `ID_Extensao_Possui_IND` (`ID_Projeto`,`ID_Ati`),
  ADD KEY `FKExt_Ati_IND` (`ID_Ati`);

--
-- Indexes for table `financiador`
--
ALTER TABLE `financiador`
  ADD PRIMARY KEY (`ID_Financiador`),
  ADD UNIQUE KEY `ID_Financiador_IND` (`ID_Financiador`);

--
-- Indexes for table `folha_de_pagamento`
--
ALTER TABLE `folha_de_pagamento`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `FKServidor_Recebe_IND` (`ID_Usuario`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `FKSer_Fun_IND` (`ID_Usuario`);

--
-- Indexes for table `graduacao`
--
ALTER TABLE `graduacao`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKCur_Gra_IND` (`Codigo`);

--
-- Indexes for table `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`ID_Disciplina`,`ID_Usuario`),
  ADD UNIQUE KEY `ID_Historico_IND` (`ID_Disciplina`,`ID_Usuario`),
  ADD KEY `FKHis_Alu_IND` (`ID_Usuario`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD UNIQUE KEY `FKEnsino_Possui1_ID` (`ID_Unidade`),
  ADD UNIQUE KEY `FKEnsino_Possui1_IND` (`ID_Unidade`);

--
-- Indexes for table `indice_de_desempenho`
--
ALTER TABLE `indice_de_desempenho`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKInd_Cur_IND` (`Codigo`),
  ADD KEY `FKInd_Pro_IND` (`ID_Usuario`),
  ADD KEY `FKInd_Alu_IND` (`I_A_ID_Usuario`);

--
-- Indexes for table `mestrado_academico`
--
ALTER TABLE `mestrado_academico`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKPos_Mes_IND` (`Codigo`);

--
-- Indexes for table `mestrado_profissional`
--
ALTER TABLE `mestrado_profissional`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKPos_Mes_1_IND` (`Codigo`);

--
-- Indexes for table `museu`
--
ALTER TABLE `museu`
  ADD PRIMARY KEY (`ID_Unidade`),
  ADD UNIQUE KEY `FKUni_Mus_IND` (`ID_Unidade`);

--
-- Indexes for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD PRIMARY KEY (`ID_Ocorrencia`),
  ADD UNIQUE KEY `ID_Ocorrencias_IND` (`ID_Ocorrencia`),
  ADD KEY `FKServidor_tem_IND` (`ID_Usuario`);

--
-- Indexes for table `oferecimento`
--
ALTER TABLE `oferecimento`
  ADD PRIMARY KEY (`ID_Disciplina`,`Codigo`),
  ADD UNIQUE KEY `ID_Oferecimento_IND` (`ID_Disciplina`,`Codigo`),
  ADD KEY `FKOfe_Cur_IND` (`Codigo`);

--
-- Indexes for table `participa`
--
ALTER TABLE `participa`
  ADD PRIMARY KEY (`ID_Projeto`,`ID_Usuario`),
  ADD UNIQUE KEY `ID_Participa_IND` (`ID_Projeto`,`ID_Usuario`),
  ADD KEY `FKPar_Alu_IND` (`ID_Usuario`);

--
-- Indexes for table `pos_graduacao`
--
ALTER TABLE `pos_graduacao`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKCur_Pos_IND` (`Codigo`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `FKSer_Pro_IND` (`ID_Usuario`);

--
-- Indexes for table `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`ID_Projeto`),
  ADD UNIQUE KEY `ID_Projeto_IND` (`ID_Projeto`),
  ADD KEY `FKFinancia_IND` (`ID_Financiador`);

--
-- Indexes for table `projeto_extensao`
--
ALTER TABLE `projeto_extensao`
  ADD PRIMARY KEY (`ID_Projeto`),
  ADD UNIQUE KEY `FKPro_Pro_1_IND` (`ID_Projeto`),
  ADD KEY `FKexerce_IND` (`ID_Usuario`);

--
-- Indexes for table `projeto_pesquisa`
--
ALTER TABLE `projeto_pesquisa`
  ADD PRIMARY KEY (`ID_Projeto`),
  ADD UNIQUE KEY `FKPro_Pro_IND` (`ID_Projeto`);

--
-- Indexes for table `reitoria`
--
ALTER TABLE `reitoria`
  ADD PRIMARY KEY (`Cnpj`),
  ADD UNIQUE KEY `ID_Reitoria_IND` (`Cnpj`),
  ADD KEY `FKAdmnistra_IND` (`ID_Unidade`);

--
-- Indexes for table `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`ID_Res`),
  ADD UNIQUE KEY `ID_IND` (`ID_Res`),
  ADD UNIQUE KEY `FKEnsino_Possui2_ID` (`ID_Unidade`),
  ADD UNIQUE KEY `FKEnsino_Possui2_IND` (`ID_Unidade`);

--
-- Indexes for table `servidor`
--
ALTER TABLE `servidor`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `FKUsu_Ser_IND` (`ID_Usuario`);

--
-- Indexes for table `unidade`
--
ALTER TABLE `unidade`
  ADD PRIMARY KEY (`ID_Unidade`),
  ADD UNIQUE KEY `ID_Unidade_IND` (`ID_Unidade`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `ID_Usuario_IND` (`ID_Usuario`),
  ADD KEY `FKCadastro_IND` (`ID_Unidade`);

--
-- Indexes for table `verba`
--
ALTER TABLE `verba`
  ADD KEY `FKganha_IND` (`ID_Unidade`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atividades_extensao`
--
ALTER TABLE `atividades_extensao`
  MODIFY `ID_Ati` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biblioteca`
--
ALTER TABLE `biblioteca`
  MODIFY `ID_Bib` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `Codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `ID_Disciplina` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `Id_Emprestimo` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `financiador`
--
ALTER TABLE `financiador`
  MODIFY `ID_Financiador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  MODIFY `ID_Ocorrencia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projeto`
--
ALTER TABLE `projeto`
  MODIFY `ID_Projeto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2016;
--
-- AUTO_INCREMENT for table `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `ID_Res` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unidade`
--
ALTER TABLE `unidade`
  MODIFY `ID_Unidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `acervo_biblioteca`
--
ALTER TABLE `acervo_biblioteca`
  ADD CONSTRAINT `FKBiblioteca_Possui_FK` FOREIGN KEY (`ID_Bib`) REFERENCES `biblioteca` (`ID_Bib`);

--
-- Limitadores para a tabela `acervo_museu`
--
ALTER TABLE `acervo_museu`
  ADD CONSTRAINT `FKMuseu_Possui_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `museu` (`ID_Unidade`);

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `FKUsu_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`),
  ADD CONSTRAINT `FKcursa_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`);

--
-- Limitadores para a tabela `bens`
--
ALTER TABLE `bens`
  ADD CONSTRAINT `FKPossui_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD CONSTRAINT `FKEnsino_Possui3_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `ensino` (`ID_Unidade`);

--
-- Limitadores para a tabela `coordena`
--
ALTER TABLE `coordena`
  ADD CONSTRAINT `FKCoo_Pro_1_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto_pesquisa` (`ID_Projeto`),
  ADD CONSTRAINT `FKCoo_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `creditos`
--
ALTER TABLE `creditos`
  ADD CONSTRAINT `FKCre_Res_FK` FOREIGN KEY (`ID_Res`) REFERENCES `restaurante` (`ID_Res`),
  ADD CONSTRAINT `FKCre_Usu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `doutorado`
--
ALTER TABLE `doutorado`
  ADD CONSTRAINT `FKPos_Dou_FK` FOREIGN KEY (`Codigo`) REFERENCES `pos_graduacao` (`Codigo`);

--
-- Limitadores para a tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `FKEmpresta_FK` FOREIGN KEY (`B_Item_Id`) REFERENCES `acervo_biblioteca` (`B_Item_Id`);

--
-- Limitadores para a tabela `ensino`
--
ALTER TABLE `ensino`
  ADD CONSTRAINT `FKComposicao_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`),
  ADD CONSTRAINT `FKUni_Ens_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `extensao_possui`
--
ALTER TABLE `extensao_possui`
  ADD CONSTRAINT `FKExt_Ati_FK` FOREIGN KEY (`ID_Ati`) REFERENCES `atividades_extensao` (`ID_Ati`),
  ADD CONSTRAINT `FKExt_Pro` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto_extensao` (`ID_Projeto`);

--
-- Limitadores para a tabela `folha_de_pagamento`
--
ALTER TABLE `folha_de_pagamento`
  ADD CONSTRAINT `FKServidor_Recebe_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FKSer_Fun_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `graduacao`
--
ALTER TABLE `graduacao`
  ADD CONSTRAINT `FKCur_Gra_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`);

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `FKHis_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKHis_Dis` FOREIGN KEY (`ID_Disciplina`) REFERENCES `disciplinas` (`ID_Disciplina`);

--
-- Limitadores para a tabela `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `FKEnsino_Possui1_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `ensino` (`ID_Unidade`);

--
-- Limitadores para a tabela `indice_de_desempenho`
--
ALTER TABLE `indice_de_desempenho`
  ADD CONSTRAINT `FKInd_Alu_FK` FOREIGN KEY (`I_A_ID_Usuario`) REFERENCES `aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKInd_Cur_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`),
  ADD CONSTRAINT `FKInd_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `mestrado_academico`
--
ALTER TABLE `mestrado_academico`
  ADD CONSTRAINT `FKPos_Mes_FK` FOREIGN KEY (`Codigo`) REFERENCES `pos_graduacao` (`Codigo`);

--
-- Limitadores para a tabela `mestrado_profissional`
--
ALTER TABLE `mestrado_profissional`
  ADD CONSTRAINT `FKPos_Mes_1_FK` FOREIGN KEY (`Codigo`) REFERENCES `pos_graduacao` (`Codigo`);

--
-- Limitadores para a tabela `museu`
--
ALTER TABLE `museu`
  ADD CONSTRAINT `FKUni_Mus_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD CONSTRAINT `FKServidor_tem_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `oferecimento`
--
ALTER TABLE `oferecimento`
  ADD CONSTRAINT `FKOfe_Cur_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`),
  ADD CONSTRAINT `FKOfe_Dis` FOREIGN KEY (`ID_Disciplina`) REFERENCES `disciplinas` (`ID_Disciplina`);

--
-- Limitadores para a tabela `participa`
--
ALTER TABLE `participa`
  ADD CONSTRAINT `FKPar_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKPar_Pro` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto` (`ID_Projeto`);

--
-- Limitadores para a tabela `pos_graduacao`
--
ALTER TABLE `pos_graduacao`
  ADD CONSTRAINT `FKCur_Pos_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `FKSer_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `FKFinancia_FK` FOREIGN KEY (`ID_Financiador`) REFERENCES `financiador` (`ID_Financiador`);

--
-- Limitadores para a tabela `projeto_extensao`
--
ALTER TABLE `projeto_extensao`
  ADD CONSTRAINT `FKPro_Pro_1_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto` (`ID_Projeto`),
  ADD CONSTRAINT `FKexerce_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `projeto_pesquisa`
--
ALTER TABLE `projeto_pesquisa`
  ADD CONSTRAINT `FKPro_Pro_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto` (`ID_Projeto`);

--
-- Limitadores para a tabela `reitoria`
--
ALTER TABLE `reitoria`
  ADD CONSTRAINT `FKAdmnistra_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `restaurante`
--
ALTER TABLE `restaurante`
  ADD CONSTRAINT `FKEnsino_Possui2_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `ensino` (`ID_Unidade`);

--
-- Limitadores para a tabela `servidor`
--
ALTER TABLE `servidor`
  ADD CONSTRAINT `FKUsu_Ser_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FKCadastro_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `verba`
--
ALTER TABLE `verba`
  ADD CONSTRAINT `FKganha_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
