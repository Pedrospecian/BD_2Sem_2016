-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 15-Jan-2017 às 19:46
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
  `ID_Bib` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acervo_biblioteca`
--

INSERT INTO `acervo_biblioteca` (`B_Item_Id`, `B_Item_Nome`, `ID_Bib`) VALUES
(1, 'Introducao a Teoria da Computacao - SIPSER, M.', 1),
(2, 'Introducao a microeconomia e Introducao a macroeconomia - Joseph E. Stigiglitz e Carl E. Walsh', 3),
(3, 'Do espírito das Leis - Montesquieu', 2),
(4, 'Sistemas de Bancos de Dados - ELMASRI, R.; NAVATHE, S.B.', 1),
(5, 'A república - Platão', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acervo_museu`
--

CREATE TABLE `acervo_museu` (
  `M_Item_Id` int(11) NOT NULL,
  `M_Item_Nome` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acervo_museu`
--

INSERT INTO `acervo_museu` (`M_Item_Id`, `M_Item_Nome`, `ID_Unidade`) VALUES
(1, 'Taca Cerimonial', 9),
(2, 'Tablete com escrita cuneiforme', 9),
(3, 'Vaso Ceramica', 9),
(4, 'Cesto Guarani', 9),
(5, 'Colar de contas de vidro', 9);

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
(21, 1),
(22, 1),
(28, 1),
(30, 1),
(33, 1),
(26, 3),
(27, 3),
(31, 3),
(32, 4),
(34, 4),
(29, 6),
(35, 6),
(20, 7),
(24, 7),
(23, 8),
(25, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividades_extensao`
--

CREATE TABLE `atividades_extensao` (
  `Localizacao` char(255) NOT NULL,
  `Data_Atividade` date NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atividades_extensao`
--

INSERT INTO `atividades_extensao` (`Localizacao`, `Data_Atividade`, `ID_Projeto`) VALUES
('	\r\nRua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', '2016-02-02', 2011),
('	\r\nRua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', '2016-02-02', 2012),
('	\r\nRua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', '2016-03-02', 2011),
('	\r\nRua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', '2016-03-02', 2012);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atribuicoes`
--

CREATE TABLE `atribuicoes` (
  `Data_inicio` date DEFAULT NULL,
  `Id_Atribuicoes` int(11) NOT NULL,
  `Cargo` char(255) NOT NULL,
  `Data_fim` date DEFAULT NULL,
  `Setor` char(255) NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atribuicoes`
--

INSERT INTO `atribuicoes` (`Data_inicio`, `Id_Atribuicoes`, `Cargo`, `Data_fim`, `Setor`, `ID_Usuario`) VALUES
('2016-02-01', 1, 'Coordenador', '2016-11-30', 'Sistemas de Informacao', 9),
('2012-02-01', 2, 'Reitor', '2016-11-30', 'Reitoria', 5),
('2016-02-01', 3, 'Diretor', '2016-11-30', 'Escola de Artes, Ciencias e Humanidades', 6),
('2016-02-01', 4, 'Coordenador', '2016-11-30', 'Direito', 7),
('2016-02-01', 5, 'Coordenador', '2016-11-30', 'MBA em Marketing', 8);

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
  `Quantidade` int(11) NOT NULL,
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `bens`
--

INSERT INTO `bens` (`Localizacao`, `Valor`, `ID_bem`, `Data_de_Aquisicao`, `Tipo`, `Quantidade`, `ID_Unidade`) VALUES
('Rua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', 20000, 1, '1995-09-15', 'Carro', 5, 1),
('Av. Dr. Arnaldo, 455\r\nSão Paulo, SP', 50, 2, '2000-01-20', 'Cadeira', 500, 2),
('Largo Sao Francisco, 95\r\nSao Paulo, SP', 800, 3, '2000-01-20', 'Projetor', 100, 5),
('Av. Prof. Luciano Gualberto, 908 - Butanta, Sao Paulo - SP', 50, 4, '2000-01-20', 'Cadeira', 500, 6),
('R. da Reitoria, 374 - Butanta, Sao Paulo - SP', 3000, 5, '2005-01-12', 'Computador', 50, 21),
('Rua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', 3000, 6, '2005-01-05', 'Computador', 150, 1),
('Av. Prof. Luciano Gualberto, 908 - Butanta, Sao Paulo - SP', 3000, 7, '2000-01-20', 'Computador', 50, 6),
('Largo Sao Francisco, 95\r\nSao Paulo, SP', 3000, 8, '1995-09-15', 'Computador', 100, 5),
('Av. Prof. Luciano Gualberto, 908 - Butanta, Sao Paulo - SP', 50, 9, '2000-01-20', 'Mesa', 200, 6),
('R. da Reitoria, 374 - Butanta, Sao Paulo - SP', 20000, 10, '1995-09-15', 'Cadeira', 200, 21),
('Rua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', 800, 11, '2000-01-20', 'Projetor', 70, 1),
('Rua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', 50, 12, '2000-01-20', 'Cadeira', 300, 1),
('Rua Arlindo Bettio, 1000 Ermelino Matarazzo, SP', 50, 13, '2000-01-20', 'Mesa', 150, 1),
('Av. Dr. Arnaldo, 455\r\nSão Paulo, SP', 3000, 14, '2013-01-10', 'Computador', 90, 2),
('Av. Dr. Arnaldo, 455\r\nSão Paulo, SP', 50, 15, '2013-01-10', 'Mesa', 100, 2),
('Av. Dr. Arnaldo, 455\r\nSão Paulo, SP', 500, 16, '2013-01-10', 'Projetor', 65, 2),
('Av. Dr. Arnaldo, 455\r\nSão Paulo, SP', 20000, 17, '2013-01-10', 'Carro', 6, 2),
('Largo Sao Francisco, 95\r\nSao Paulo, SP', 50, 18, '2000-01-20', 'Mesa', 80, 5),
('Largo Sao Francisco, 95\r\nSao Paulo, SP', 30, 19, '2000-01-20', 'Cadeira', 120, 5),
('Largo Sao Francisco, 95\r\nSao Paulo, SP', 20000, 20, '2000-01-20', 'Carro', 4, 5),
('Av. Prof. Luciano Gualberto, 908 - Butanta, Sao Paulo - SP', 20000, 21, '1995-09-15', 'Carro', 4, 6),
('R. da Reitoria, 374 - Butanta, Sao Paulo - SP', 50, 22, '1995-09-15', 'Mesa', 75, 21),
('R. da Reitoria, 374 - Butanta, Sao Paulo - SP', 20000, 23, '1995-09-15', 'Carro', 4, 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `biblioteca`
--

CREATE TABLE `biblioteca` (
  `ID_Bib` int(11) NOT NULL,
  `ID_Unidade` int(11) DEFAULT NULL,
  `B_Nome` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `biblioteca`
--

INSERT INTO `biblioteca` (`ID_Bib`, `ID_Unidade`, `B_Nome`) VALUES
(1, 1, 'Biblioteca da EACH'),
(2, 5, 'Biblioteca do Faculdade de Direito'),
(3, 6, 'Biblioteca da FEA'),
(5, 2, 'Biblioteca da Faculdade de Medicina');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordena`
--

CREATE TABLE `coordena` (
  `ID_Projeto` bigint(20) NOT NULL,
  `Indice_Pesquisador` int(11) NOT NULL,
  `Bolsa_Pesquisador` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `coordena`
--

INSERT INTO `coordena` (`ID_Projeto`, `Indice_Pesquisador`, `Bolsa_Pesquisador`, `ID_Usuario`) VALUES
(2013, 10, 5000, 9),
(2014, 5, 3000, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `creditos`
--

CREATE TABLE `creditos` (
  `ID_Res` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Nro_de_Creditos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `creditos`
--

INSERT INTO `creditos` (`ID_Res`, `ID_Usuario`, `Nro_de_Creditos`) VALUES
(1, 12, 2),
(1, 21, 1),
(1, 22, 3),
(2, 29, 3),
(2, 35, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `Codigo` bigint(20) NOT NULL,
  `Nome` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`Codigo`, `Nome`, `ID_Unidade`) VALUES
(1, 'Sistemas de Informacao', 1),
(2, 'Medicina', 2),
(3, 'Gestao de Politicas Publicas', 1),
(4, 'Administracao', 6),
(6, 'Direito', 5),
(7, 'MBA em Marketing', 6),
(8, 'MBA em Gestao de Negocios', 6),
(9, 'MBA em Controladoria e Financas', 6),
(10, 'Mestrado Profissional em Empreendedorismo', 6),
(11, 'Mestrado em Direito', 5),
(12, 'Mestrado em Sistemas de Informacão', 1),
(13, 'Mestrado em Gestão de Políticas Públicas', 1),
(14, 'Doutorado em Direito', 5),
(15, 'Doutorado em Administração', 6),
(16, 'Doutorado em Gestão de Políticas Públicas', 1),
(17, 'Doutorado em Medicina', 2),
(18, 'Doutorado em Sistemas de Informação', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `ID_Disciplina` int(11) NOT NULL,
  `Nome` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`ID_Disciplina`, `Nome`) VALUES
(1, 'Banco de Dados'),
(2, 'Inteligencia Artificial'),
(3, 'Microeconomia e Polí­ticas Publicas'),
(4, 'Etica e Politicas Publicas'),
(5, 'Direito Constitucional'),
(6, 'Fundamentos de Administracao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `doutorado`
--

CREATE TABLE `doutorado` (
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `doutorado`
--

INSERT INTO `doutorado` (`Codigo`) VALUES
(14),
(15),
(16),
(17),
(18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresta`
--

CREATE TABLE `empresta` (
  `Data_Inicio` date NOT NULL,
  `Id_Emprestimo` int(11) NOT NULL,
  `Data_Devolucao` date NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `B_Item_Id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresta`
--

INSERT INTO `empresta` (`Data_Inicio`, `Id_Emprestimo`, `Data_Devolucao`, `ID_Usuario`, `B_Item_Id`) VALUES
('2016-03-01', 1, '2016-03-23', 38, 3),
('2016-07-23', 2, '2016-08-03', 33, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ensino`
--

CREATE TABLE `ensino` (
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ensino`
--

INSERT INTO `ensino` (`ID_Unidade`) VALUES
(1),
(2),
(5),
(6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `exerce`
--

CREATE TABLE `exerce` (
  `ID_Projeto` bigint(20) NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `exerce`
--

INSERT INTO `exerce` (`ID_Projeto`, `ID_Usuario`) VALUES
(2011, 6),
(2012, 7),
(2011, 10),
(2012, 18);

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
('Público', 'A', 1),
('Privado', 'B', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `folha_de_pagamento`
--

CREATE TABLE `folha_de_pagamento` (
  `Salario` int(11) NOT NULL,
  `Id_Pagamento` int(11) NOT NULL,
  `Data` date NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `folha_de_pagamento`
--

INSERT INTO `folha_de_pagamento` (`Salario`, `Id_Pagamento`, `Data`, `ID_Usuario`) VALUES
(10000, 1, '2016-02-02', 5),
(6000, 2, '2016-02-02', 6),
(6000, 3, '2016-02-02', 7),
(8000, 4, '2016-02-02', 8),
(10000, 5, '2016-02-02', 9),
(10000, 6, '2016-02-02', 5),
(6000, 7, '2016-03-02', 6),
(6000, 8, '2016-03-02', 7),
(8000, 9, '2016-03-02', 8),
(10000, 10, '2016-03-02', 9),
(10000, 11, '2016-04-02', 5),
(6000, 12, '2016-04-02', 6),
(6000, 13, '2016-04-02', 7),
(8000, 14, '2016-04-02', 8),
(10000, 15, '2016-04-02', 9),
(1500, 16, '2016-02-02', 10),
(1500, 17, '2016-02-02', 12),
(1500, 18, '2016-02-02', 18),
(3000, 19, '2016-02-02', 19),
(1500, 20, '2016-03-02', 10),
(1500, 21, '2016-03-02', 12),
(1500, 22, '2016-03-02', 18),
(3000, 23, '2016-03-02', 19);

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
(10, 'Auxiliar Administrativo'),
(12, 'Auxiliar de Limpeza'),
(18, 'Auxiliar Administrativo'),
(19, 'Seguranca');

-- --------------------------------------------------------

--
-- Estrutura da tabela `graduacao`
--

CREATE TABLE `graduacao` (
  `Codigo` bigint(20) NOT NULL
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

CREATE TABLE `historico` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  `Notas` int(11) NOT NULL,
  `Frequencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`ID_Usuario`, `ID_Disciplina`, `Notas`, `Frequencia`) VALUES
(21, 1, 5, 70),
(22, 1, 9, 85),
(28, 1, 9, 95),
(30, 1, 8, 85),
(33, 1, 3, 60),
(21, 2, 7, 75),
(22, 2, 6, 75),
(28, 2, 8, 100),
(30, 2, 5, 70),
(33, 2, 4, 70),
(26, 3, 8, 75),
(27, 3, 4, 65),
(31, 3, 3, 40),
(26, 4, 6, 70),
(27, 4, 3, 50),
(31, 4, 7, 80),
(29, 5, 7, 90),
(35, 5, 5, 60),
(32, 6, 4, 60),
(34, 6, 7, 85);

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospital`
--

CREATE TABLE `hospital` (
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `hospital`
--

INSERT INTO `hospital` (`ID_Unidade`) VALUES
(10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `isencao_na_inscricao`
--

CREATE TABLE `isencao_na_inscricao` (
  `Codigo` bigint(20) NOT NULL,
  `ID_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `isencao_na_inscricao`
--

INSERT INTO `isencao_na_inscricao` (`Codigo`, `ID_Usuario`) VALUES
(7, 20),
(7, 24),
(8, 23),
(8, 25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `latu_sensu`
--

CREATE TABLE `latu_sensu` (
  `Codigo` bigint(20) NOT NULL,
  `Valor_Mensalidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `latu_sensu`
--

INSERT INTO `latu_sensu` (`Codigo`, `Valor_Mensalidade`) VALUES
(7, 1000),
(8, 2000),
(9, 3000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mestrado_academico`
--

CREATE TABLE `mestrado_academico` (
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mestrado_academico`
--

INSERT INTO `mestrado_academico` (`Codigo`) VALUES
(11),
(12),
(13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mestrado_profissional`
--

CREATE TABLE `mestrado_profissional` (
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mestrado_profissional`
--

INSERT INTO `mestrado_profissional` (`Codigo`) VALUES
(10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `museu`
--

CREATE TABLE `museu` (
  `ID_Unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `museu`
--

INSERT INTO `museu` (`ID_Unidade`) VALUES
(7),
(8),
(9);

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

--
-- Extraindo dados da tabela `ocorrencias`
--

INSERT INTO `ocorrencias` (`ID_Ocorrencia`, `Tipo_Ocorrencia`, `Data_Inicio`, `Data_Final`, `ID_Usuario`) VALUES
(1, 'Licenca', '2016-08-01', '2016-08-30', 5),
(2, 'Licenca', '2016-05-01', '2016-05-30', 6),
(3, 'Ferias', '2015-06-03', '2015-06-03', 19),
(4, 'Ferias', '2015-12-02', '2015-01-02', 12),
(5, 'Ferias', '2015-12-02', '2015-01-02', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `oferecimento`
--

CREATE TABLE `oferecimento` (
  `Codigo` bigint(20) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `oferecimento`
--

INSERT INTO `oferecimento` (`Codigo`, `ID_Disciplina`) VALUES
(1, 1),
(1, 2),
(3, 3),
(3, 4),
(6, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `participa`
--

CREATE TABLE `participa` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  `Bolsa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `participa`
--

INSERT INTO `participa` (`ID_Usuario`, `ID_Projeto`, `Bolsa`) VALUES
(31, 2011, 400),
(21, 2012, 400),
(30, 2013, 600),
(29, 2014, 400),
(35, 2014, 400);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pos_graduacao`
--

CREATE TABLE `pos_graduacao` (
  `Codigo` bigint(20) NOT NULL,
  `Data_defesa_do_Trabalho_final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pos_graduacao`
--

INSERT INTO `pos_graduacao` (`Codigo`, `Data_defesa_do_Trabalho_final`) VALUES
(7, '2016-11-30'),
(8, '2016-11-30'),
(9, '2016-11-30'),
(10, '2016-11-30'),
(11, '2016-11-30'),
(12, '2016-11-30'),
(13, '2016-11-30'),
(14, '2016-11-30'),
(15, '2016-11-30'),
(16, '2016-11-30'),
(17, '2016-11-30'),
(18, '2016-11-30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `ID_Usuario` int(11) NOT NULL,
  `nivel` char(255) NOT NULL,
  `carreira` char(255) NOT NULL,
  `Codigo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`ID_Usuario`, `nivel`, `carreira`, `Codigo`) VALUES
(5, 'A', 'Titular', 8),
(6, 'B', 'Doutor', 3),
(7, 'C', 'Doutor', 6),
(8, 'A', 'Livre Docente', 7),
(9, 'A', 'Titular', 1);

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
('Urbanismo na Gestao Publica', '2016-03-01', 'Urbanismo na Gestao Publica', '2016-11-01', 2000, 2011, 1),
('Informatica para alunos do Ensino Fundamental', '2016-03-01', 'Informatica para alunos do Ensino Fundamental', '2016-11-01', 2000, 2012, 2),
('Pesquisa em Mineracao de Dados', '2016-03-01', 'Pesquisa em Mineracao de Dados', '2016-11-01', 3000, 2013, 1),
('Pesquisa em Direito Digital', '2016-03-01', 'Pesquisa em Direito Digital', '2016-11-01', 3500, 2014, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_extensao`
--

CREATE TABLE `projeto_extensao` (
  `ID_Projeto` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto_extensao`
--

INSERT INTO `projeto_extensao` (`ID_Projeto`) VALUES
(2011),
(2012);

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
(2014);

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
('26723506000112', 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `restaurante`
--

CREATE TABLE `restaurante` (
  `ID_Res` int(11) NOT NULL,
  `ID_Unidade` int(11) DEFAULT NULL,
  `R_Nome` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estrutura da tabela `strictu_sensu`
--

CREATE TABLE `strictu_sensu` (
  `Codigo` bigint(20) NOT NULL,
  `Data_final_qualificacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `strictu_sensu`
--

INSERT INTO `strictu_sensu` (`Codigo`, `Data_final_qualificacao`) VALUES
(10, '2016-11-30'),
(11, '2016-11-30'),
(12, '2016-11-30'),
(13, '2016-11-30'),
(14, '2015-11-30'),
(15, '2015-11-30'),
(16, '2015-11-30'),
(17, '2015-11-30'),
(18, '2015-11-30');

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
('Escola de Artes, Ciencias e Humanidades', 1, 'Rua Arlindo Bettio, 1000 Ermelino Matarazzo, SP'),
('Faculdade de Medicina', 2, 'Av. Dr. Arnaldo, 455\r\nSão Paulo, SP'),
('Faculdade de Direito', 5, 'Largo Sao Francisco, 95\r\nSao Paulo, SP'),
('Faculdade de Economia, Administracao e Contabilidade', 6, 'Av. Prof. Luciano Gualberto, 908 - Butanta, Sao Paulo - SP'),
('Museu de Anatomia Humana', 7, 'Av. Prof. Lineu Prestes, 2415, Butantã, \r\nSão Paulo, SP\r\n'),
('Museu de Arte Contemporânea', 8, 'Avenida Pedro Álvares Cabral, 1301\r\n'),
('Museu de Arqueologia e Etnologia', 9, 'Av. Prof. Almeida Prado, 1466 - São Paulo - SP'),
('Hospital Universitário', 10, 'Av. Professor Lineu Prestes, 2565 – Butantã - São Paulo - SP'),
('Reitoria', 21, 'R. da Reitoria, 374 - Butanta, Sao Paulo - SP');

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
(5, 'Marcio Costa', '183.427.466-40', 'Masculino', '1971-03-23', 21),
(6, 'Fernanda Almeida', '880.185.271-13', 'Feminino', '1971-10-20', 1),
(7, 'Paulo Antunes', '384.126.948-64', 'Masculino', '1971-11-23', 5),
(8, 'Laura Santos', '582.223.411-97', 'Feminino', '1972-07-10', 6),
(9, 'Claudia Silva', '455.979.542-88', 'Feminino', '1973-02-05', 1),
(10, 'Joao Santos', '325.184.027-48', 'Masculino', '1973-05-01', 6),
(12, 'Jose Oliveira', '227.064.963-04', 'Masculino', '1973-09-20', 1),
(18, 'Fabio Lima', '027.728.832-05', 'Masculino', '1975-08-18', 21),
(19, 'Raquel Ferreira', '166.234.703-01', 'Feminino', '1976-12-09', 1),
(20, 'Mateus Barros', '140.342.783-66', 'Masculino', '1994-03-21', 6),
(21, 'Juliana Oliveira', '851.860.336-69', 'Feminino', '1994-05-26', 1),
(22, 'Vinicius Ferreira', '428.481.728-00', 'Masculino', '1994-11-17', 1),
(23, 'Patri­cia Costa', '872.669.135-35', 'Feminino', '1995-03-16', 6),
(24, 'Roberta Almeida', '328.689.635-79', 'Feminino', '1995-04-20', 6),
(25, 'Fabio Santos', '867.449.174-04', 'Masculino', '1995-11-03', 6),
(26, 'Denise Silva', '789.822.516-34', 'Feminino', '1996-01-12', 1),
(27, 'Felipe Prado', '523.124.337-02', 'Masculino', '1996-01-31', 1),
(28, 'Natalia Santos', '002.889.189-91', 'Feminino', '1996-09-04', 1),
(29, 'Daniel Ferreira', '188.122.978-54', 'Masculino', '1996-12-13', 5),
(30, 'Joao Oliveira', '662.118.796-36', 'Masculino', '1994-05-20', 1),
(31, 'Renata Sanchez', '842.319.617-86', 'Feminino', '1994-07-20', 1),
(32, 'Carlos Silva', '389.178.887-80', 'Masculino', '1994-04-07', 6),
(33, 'Patricia Carvalho', '871.636.259-44', 'Feminino', '1991-04-15', 1),
(34, 'Luis Silveira', '878.624.370-55', 'Masculino', '1991-12-20', 6),
(35, 'Julia Silva', '064.311.508-05', 'Feminino', '1994-07-20', 5),
(36, 'Daniel Silva', '829.057.644-73', 'Masculino', '1993-07-05', 21),
(37, 'Ana Clara', '463.407.505-91', 'Feminino', '1995-04-25', 5),
(38, 'Pedro Almeida', '314.199.712-80', 'Masculino', '1995-12-27', 1),
(39, 'Laura Moreira', '715.611.560-00', 'Feminino', '1991-03-28', 6);

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
-- Extraindo dados da tabela `verba`
--

INSERT INTO `verba` (`Valor`, `Data`, `ID_Unidade`) VALUES
(10000000, '2016-01-01', 1),
(14000000, '2016-01-01', 2),
(12000000, '2016-01-01', 5),
(15000000, '2016-01-01', 6),
(1000000000, '2016-01-01', 21);

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
  ADD KEY `FKExtensao_Possui_IND` (`ID_Projeto`);

--
-- Indexes for table `atribuicoes`
--
ALTER TABLE `atribuicoes`
  ADD PRIMARY KEY (`Id_Atribuicoes`),
  ADD UNIQUE KEY `ID_Atribuicoes_IND` (`Id_Atribuicoes`),
  ADD KEY `FKProfessor_possui_IND` (`ID_Usuario`);

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
  ADD PRIMARY KEY (`ID_Res`,`ID_Usuario`),
  ADD UNIQUE KEY `ID_Creditos_IND` (`ID_Res`,`ID_Usuario`),
  ADD KEY `FKCre_Usu_IND` (`ID_Usuario`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `ID_Cursos_IND` (`Codigo`),
  ADD KEY `FKComposicao_IND` (`ID_Unidade`);

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
  ADD UNIQUE KEY `FKStr_Dou_IND` (`Codigo`);

--
-- Indexes for table `empresta`
--
ALTER TABLE `empresta`
  ADD PRIMARY KEY (`Id_Emprestimo`),
  ADD UNIQUE KEY `ID_Empresta_IND` (`Id_Emprestimo`),
  ADD KEY `FKEmp_Usu_IND` (`ID_Usuario`),
  ADD KEY `FKEmp_Ace_IND` (`B_Item_Id`);

--
-- Indexes for table `ensino`
--
ALTER TABLE `ensino`
  ADD PRIMARY KEY (`ID_Unidade`),
  ADD UNIQUE KEY `FKUni_Ens_IND` (`ID_Unidade`);

--
-- Indexes for table `exerce`
--
ALTER TABLE `exerce`
  ADD PRIMARY KEY (`ID_Usuario`,`ID_Projeto`),
  ADD UNIQUE KEY `ID_exerce_IND` (`ID_Usuario`,`ID_Projeto`),
  ADD KEY `FKexe_Pro_IND` (`ID_Projeto`);

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
  ADD PRIMARY KEY (`Id_Pagamento`),
  ADD UNIQUE KEY `ID_Folha_de_Pagamento_IND` (`Id_Pagamento`),
  ADD KEY `FKServidor_Recebe_IND` (`ID_Usuario`);

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
  ADD PRIMARY KEY (`ID_Unidade`),
  ADD UNIQUE KEY `FKUni_Hos_IND` (`ID_Unidade`);

--
-- Indexes for table `isencao_na_inscricao`
--
ALTER TABLE `isencao_na_inscricao`
  ADD PRIMARY KEY (`Codigo`,`ID_Usuario`),
  ADD UNIQUE KEY `ID_Isencao_na_inscricao_IND` (`Codigo`,`ID_Usuario`),
  ADD KEY `FKIse_Alu_IND` (`ID_Usuario`);

--
-- Indexes for table `latu_sensu`
--
ALTER TABLE `latu_sensu`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKPos_Lat_IND` (`Codigo`);

--
-- Indexes for table `mestrado_academico`
--
ALTER TABLE `mestrado_academico`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKStr_Mes_IND` (`Codigo`);

--
-- Indexes for table `mestrado_profissional`
--
ALTER TABLE `mestrado_profissional`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKStr_Mes_1_IND` (`Codigo`);

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
  ADD UNIQUE KEY `FKSer_Pro_IND` (`ID_Usuario`),
  ADD KEY `FKLeciona_IND` (`Codigo`);

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
  ADD UNIQUE KEY `FKPro_Pro_1_IND` (`ID_Projeto`);

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
-- Indexes for table `strictu_sensu`
--
ALTER TABLE `strictu_sensu`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `FKPos_Str_IND` (`Codigo`);

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
-- AUTO_INCREMENT for table `biblioteca`
--
ALTER TABLE `biblioteca`
  MODIFY `ID_Bib` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `ID_Res` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
-- Limitadores para a tabela `atividades_extensao`
--
ALTER TABLE `atividades_extensao`
  ADD CONSTRAINT `FKExtensao_Possui_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto_extensao` (`ID_Projeto`);

--
-- Limitadores para a tabela `atribuicoes`
--
ALTER TABLE `atribuicoes`
  ADD CONSTRAINT `FKProfessor_possui_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `professor` (`ID_Usuario`);

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
  ADD CONSTRAINT `FKCre_Res` FOREIGN KEY (`ID_Res`) REFERENCES `restaurante` (`ID_Res`),
  ADD CONSTRAINT `FKCre_Usu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `FKComposicao_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `ensino` (`ID_Unidade`);

--
-- Limitadores para a tabela `doutorado`
--
ALTER TABLE `doutorado`
  ADD CONSTRAINT `FKStr_Dou_FK` FOREIGN KEY (`Codigo`) REFERENCES `strictu_sensu` (`Codigo`);

--
-- Limitadores para a tabela `empresta`
--
ALTER TABLE `empresta`
  ADD CONSTRAINT `FKEmp_Ace_FK` FOREIGN KEY (`B_Item_Id`) REFERENCES `acervo_biblioteca` (`B_Item_Id`),
  ADD CONSTRAINT `FKEmp_Usu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `ensino`
--
ALTER TABLE `ensino`
  ADD CONSTRAINT `FKUni_Ens_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `exerce`
--
ALTER TABLE `exerce`
  ADD CONSTRAINT `FKexe_Pro_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto_extensao` (`ID_Projeto`),
  ADD CONSTRAINT `FKexe_Ser` FOREIGN KEY (`ID_Usuario`) REFERENCES `servidor` (`ID_Usuario`);

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
  ADD CONSTRAINT `FKUni_Hos_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `isencao_na_inscricao`
--
ALTER TABLE `isencao_na_inscricao`
  ADD CONSTRAINT `FKIse_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKIse_Lat` FOREIGN KEY (`Codigo`) REFERENCES `latu_sensu` (`Codigo`);

--
-- Limitadores para a tabela `latu_sensu`
--
ALTER TABLE `latu_sensu`
  ADD CONSTRAINT `FKPos_Lat_FK` FOREIGN KEY (`Codigo`) REFERENCES `pos_graduacao` (`Codigo`);

--
-- Limitadores para a tabela `mestrado_academico`
--
ALTER TABLE `mestrado_academico`
  ADD CONSTRAINT `FKStr_Mes_FK` FOREIGN KEY (`Codigo`) REFERENCES `strictu_sensu` (`Codigo`);

--
-- Limitadores para a tabela `mestrado_profissional`
--
ALTER TABLE `mestrado_profissional`
  ADD CONSTRAINT `FKStr_Mes_1_FK` FOREIGN KEY (`Codigo`) REFERENCES `strictu_sensu` (`Codigo`);

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
  ADD CONSTRAINT `FKLeciona_FK` FOREIGN KEY (`Codigo`) REFERENCES `cursos` (`Codigo`),
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
  ADD CONSTRAINT `FKPro_Pro_1_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `projeto` (`ID_Projeto`);

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
-- Limitadores para a tabela `strictu_sensu`
--
ALTER TABLE `strictu_sensu`
  ADD CONSTRAINT `FKPos_Str_FK` FOREIGN KEY (`Codigo`) REFERENCES `pos_graduacao` (`Codigo`);

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
