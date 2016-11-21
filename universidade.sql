-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 21-Nov-2016 às 00:33
-- Versão do servidor: 5.5.50-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



--
-- Base de Dados: `ENTIDADE_RELACIONAMENTO`
--
create database ENTIDADE_RELACIONAMENTO;
use ENTIDADE_RELACIONAMENTO;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Acervo_Biblioteca`
--

CREATE TABLE IF NOT EXISTS `Acervo_Biblioteca` (
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
-- Estrutura da tabela `Acervo_Museu`
--

CREATE TABLE IF NOT EXISTS `Acervo_Museu` (
  `M_Item_Id` int(11) NOT NULL,
  `M_Item_Nome` char(1) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`M_Item_Id`),
  UNIQUE KEY `ID_Acervo_Museu_IND` (`M_Item_Id`),
  KEY `FKMuseu_Possui_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Aluno`
--

CREATE TABLE IF NOT EXISTS `Aluno` (
  `ID_Usuario` int(11) NOT NULL,
  `Codigo` bigint(20) NOT NULL,
  `Ise_Codigo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKUsu_Alu_IND` (`ID_Usuario`),
  KEY `FKcursa_IND` (`Codigo`),
  KEY `FKIsencao_na_inscricao_IND` (`Ise_Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Aluno`
--

INSERT INTO `Aluno` (`ID_Usuario`, `Codigo`, `Ise_Codigo`) VALUES
(1, 1, NULL),
(2, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Atividades_Extensao`
--

CREATE TABLE IF NOT EXISTS `Atividades_Extensao` (
  `ID_Ati` int(11) NOT NULL AUTO_INCREMENT,
  `Localizacao` char(255) NOT NULL,
  `Data_Atividade` date NOT NULL,
  PRIMARY KEY (`ID_Ati`),
  UNIQUE KEY `ID_IND` (`ID_Ati`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Atividades_Extensao`
--

INSERT INTO `Atividades_Extensao` (`ID_Ati`, `Localizacao`, `Data_Atividade`) VALUES
(1, 'local', '2016-11-08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Atribuicoes`
--

CREATE TABLE IF NOT EXISTS `Atribuicoes` (
  `Data_inicio` date DEFAULT NULL,
  `Id_Atribuicoes` int(11) NOT NULL,
  `Nome_Atribuicao` char(255) NOT NULL,
  `Data_fim` date DEFAULT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Atribuicoes`),
  UNIQUE KEY `ID_Atribuicoes_IND` (`Id_Atribuicoes`),
  KEY `FKProfessor_possui_IND` (`ID_Usuario`)
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
('sala 137', 400, 1, '2016-11-04', 'mesa', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Biblioteca`
--

CREATE TABLE IF NOT EXISTS `Biblioteca` (
  `ID_Bib` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Unidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Bib`),
  UNIQUE KEY `ID_IND` (`ID_Bib`),
  UNIQUE KEY `FKEnsino_Possui3_ID` (`ID_Unidade`),
  UNIQUE KEY `FKEnsino_Possui3_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Coordena`
--

CREATE TABLE IF NOT EXISTS `Coordena` (
  `ID_Projeto` bigint(20) NOT NULL,
  `Indice_Pequisador` int(11) NOT NULL,
  `Bolsa_Pesquisador` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `FKCoo_Pro_1_IND` (`ID_Projeto`),
  KEY `FKCoo_Pro_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Coordena`
--

INSERT INTO `Coordena` (`ID_Projeto`, `Indice_Pequisador`, `Bolsa_Pesquisador`, `ID_Usuario`) VALUES
(1, 0, 400, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Creditos`
--

CREATE TABLE IF NOT EXISTS `Creditos` (
  `ID_Res` int(11) NOT NULL,
  `Nro_de_Creditos` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Res`),
  UNIQUE KEY `FKCre_Res_IND` (`ID_Res`),
  KEY `FKCre_Usu_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Cursos`
--

CREATE TABLE IF NOT EXISTS `Cursos` (
  `Codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` char(255) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `ID_Cursos_IND` (`Codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `Cursos`
--

INSERT INTO `Cursos` (`Codigo`, `Nome`) VALUES
(1, 'curso de graduacao'),
(2, 'curso de pos');

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
  UNIQUE KEY `FKStr_Dou_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Emprestimos`
--

CREATE TABLE IF NOT EXISTS `Emprestimos` (
  `Data_Inicio` date NOT NULL,
  `Id_Emprestimo` bigint(20) NOT NULL AUTO_INCREMENT,
  `Data_Devolucao` date NOT NULL,
  `B_Item_Id` bigint(20) NOT NULL,
  PRIMARY KEY (`Id_Emprestimo`),
  UNIQUE KEY `ID_Emprestimos_IND` (`Id_Emprestimo`),
  KEY `FKEmpresta_IND` (`B_Item_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Ensino`
--

CREATE TABLE IF NOT EXISTS `Ensino` (
  `ID_Unidade` int(11) NOT NULL,
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `FKUni_Ens_IND` (`ID_Unidade`),
  KEY `FKComposicao_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Especializacao`
--

CREATE TABLE IF NOT EXISTS `Especializacao` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKLac_Esp_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Extensao_Possui`
--

CREATE TABLE IF NOT EXISTS `Extensao_Possui` (
  `ID_Ati` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Projeto`,`ID_Ati`),
  UNIQUE KEY `ID_Extensao_Possui_IND` (`ID_Projeto`,`ID_Ati`),
  KEY `FKExt_Ati_IND` (`ID_Ati`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Extensao_Possui`
--

INSERT INTO `Extensao_Possui` (`ID_Ati`, `ID_Projeto`) VALUES
(1, 2);

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
('privado', 'Santander', 1),
('publico', 'FAPESP', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Folha_de_Pagamento`
--

CREATE TABLE IF NOT EXISTS `Folha_de_Pagamento` (
  `Salario` int(11) NOT NULL,
  `Data` date NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Data`),
  UNIQUE KEY `FKServidor_Recebe_ID` (`ID_Usuario`),
  UNIQUE KEY `ID_Folha_de_Pagamento_IND` (`Data`),
  UNIQUE KEY `FKServidor_Recebe_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Folha_de_Pagamento`
--

INSERT INTO `Folha_de_Pagamento` (`Salario`, `Data`, `ID_Usuario`) VALUES
(130000, '2016-11-01', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Funcionario`
--

CREATE TABLE IF NOT EXISTS `Funcionario` (
  `ID_Usuario` int(11) NOT NULL,
  `Funcao` char(255) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKSer_Fun_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Funcionario`
--

INSERT INTO `Funcionario` (`ID_Usuario`, `Funcao`) VALUES
(4, 'funcao');

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
  PRIMARY KEY (`ID_Disciplina`,`ID_Usuario`),
  UNIQUE KEY `ID_Historico_IND` (`ID_Disciplina`,`ID_Usuario`),
  KEY `FKHis_Alu_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Hospital`
--

CREATE TABLE IF NOT EXISTS `Hospital` (
  `ID_Unidade` int(11) DEFAULT NULL,
  UNIQUE KEY `FKEnsino_Possui1_ID` (`ID_Unidade`),
  UNIQUE KEY `FKEnsino_Possui1_IND` (`ID_Unidade`)
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
-- Estrutura da tabela `Lactu_Sensu`
--

CREATE TABLE IF NOT EXISTS `Lactu_Sensu` (
  `Codigo` bigint(20) NOT NULL,
  `Valor_Mensalidade` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKPos_Lac_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `MBA`
--

CREATE TABLE IF NOT EXISTS `MBA` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKLac_MBA_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Mestrado_Academico`
--

CREATE TABLE IF NOT EXISTS `Mestrado_Academico` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKStr_Mes_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Mestrado_Profissional`
--

CREATE TABLE IF NOT EXISTS `Mestrado_Profissional` (
  `Codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKStr_Mes_1_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Museu`
--

CREATE TABLE IF NOT EXISTS `Museu` (
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `FKUni_Mus_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Ocorrencias`
--

CREATE TABLE IF NOT EXISTS `Ocorrencias` (
  `ID_Ocorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Ocorrencia` char(255) NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Data_Final` date NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Ocorrencia`),
  UNIQUE KEY `ID_Ocorrencias_IND` (`ID_Ocorrencia`),
  KEY `FKServidor_tem_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Oferecimento`
--

CREATE TABLE IF NOT EXISTS `Oferecimento` (
  `Codigo` bigint(20) NOT NULL,
  `ID_Disciplina` int(11) NOT NULL,
  PRIMARY KEY (`ID_Disciplina`,`Codigo`),
  UNIQUE KEY `ID_Oferecimento_IND` (`ID_Disciplina`,`Codigo`),
  KEY `FKOfe_Cur_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Participa`
--

CREATE TABLE IF NOT EXISTS `Participa` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL,
  `Bolsa` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`,`ID_Usuario`),
  UNIQUE KEY `ID_Participa_IND` (`ID_Projeto`,`ID_Usuario`),
  KEY `FKPar_Alu_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Participa`
--

INSERT INTO `Participa` (`ID_Usuario`, `ID_Projeto`, `Bolsa`) VALUES
(1, 1, 400),
(2, 2, 400);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pos_Graduacao`
--

CREATE TABLE IF NOT EXISTS `Pos_Graduacao` (
  `Codigo` bigint(20) NOT NULL,
  `Data_defesa_do_Trabalho_final` date NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKCur_Pos_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Pos_Graduacao`
--

INSERT INTO `Pos_Graduacao` (`Codigo`, `Data_defesa_do_Trabalho_final`) VALUES
(2, '2016-11-02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Professor`
--

CREATE TABLE IF NOT EXISTS `Professor` (
  `ID_Usuario` int(11) NOT NULL,
  `nivel` char(255) NOT NULL,
  `carreira` char(255) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKSer_Pro_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Professor`
--

INSERT INTO `Professor` (`ID_Usuario`, `nivel`, `carreira`) VALUES
(3, 'nivel', 'carreira');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto`
--

CREATE TABLE IF NOT EXISTS `Projeto` (
  `objetivo` char(255) NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Descricao` char(255) NOT NULL,
  `Data_Termino` date NOT NULL,
  `Orcamento` bigint(20) NOT NULL,
  `ID_Projeto` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_Financiador` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `ID_Projeto_IND` (`ID_Projeto`),
  KEY `FKFinancia_IND` (`ID_Financiador`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `Projeto`
--

INSERT INTO `Projeto` (`objetivo`, `Data_Inicio`, `Descricao`, `Data_Termino`, `Orcamento`, `ID_Projeto`, `ID_Financiador`) VALUES
('objetivo do projeto de pesquisa', '2016-11-15', 'descriÃ§Ã£o do projeto de pesquisa', '2016-11-17', 40000, 1, 1),
('objetivo do projeto de extensao', '2016-11-16', 'des do projeto de extensao', '2016-11-26', 50000, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Projeto_Extensao`
--

CREATE TABLE IF NOT EXISTS `Projeto_Extensao` (
  `ID_Projeto` bigint(20) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  UNIQUE KEY `FKPro_Pro_1_IND` (`ID_Projeto`),
  KEY `FKexerce_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Projeto_Extensao`
--

INSERT INTO `Projeto_Extensao` (`ID_Projeto`, `ID_Usuario`) VALUES
(2, 3);

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
-- Estrutura da tabela `Reitoria`
--

CREATE TABLE IF NOT EXISTS `Reitoria` (
  `Cnpj` varchar(20) NOT NULL,
  `ID_Unidade` int(11) NOT NULL,
  PRIMARY KEY (`Cnpj`),
  UNIQUE KEY `ID_Reitoria_IND` (`Cnpj`),
  KEY `FKAdmnistra_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Restaurante`
--

CREATE TABLE IF NOT EXISTS `Restaurante` (
  `ID_Res` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Unidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Res`),
  UNIQUE KEY `ID_IND` (`ID_Res`),
  UNIQUE KEY `FKEnsino_Possui2_ID` (`ID_Unidade`),
  UNIQUE KEY `FKEnsino_Possui2_IND` (`ID_Unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Servidor`
--

CREATE TABLE IF NOT EXISTS `Servidor` (
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `FKUsu_Ser_IND` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Servidor`
--

INSERT INTO `Servidor` (`ID_Usuario`) VALUES
(3),
(4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Strictu_Sensu`
--

CREATE TABLE IF NOT EXISTS `Strictu_Sensu` (
  `Codigo` bigint(20) NOT NULL,
  `Data_final_qualifiacao` date NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `FKPos_Str_IND` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Unidade`
--

CREATE TABLE IF NOT EXISTS `Unidade` (
  `Nome_Unidade` char(255) NOT NULL,
  `ID_Unidade` int(11) NOT NULL AUTO_INCREMENT,
  `Endereco` char(255) NOT NULL,
  PRIMARY KEY (`ID_Unidade`),
  UNIQUE KEY `ID_Unidade_IND` (`ID_Unidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `Unidade`
--

INSERT INTO `Unidade` (`Nome_Unidade`, `ID_Unidade`, `Endereco`) VALUES
('USP Leste', 1, 'av dr assis ribeiro, 1500');

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
(1, 'nome do aluno de graduação', '34324', 'masculino', '2016-11-01', 1),
(2, 'nome do aluno da pos', '432432423', 'm', '2016-11-30', 1),
(3, 'nome do professor', '34324', 'f', '2016-11-01', 1),
(4, 'nome do funcionario', '423432', 'se', '2016-11-22', 1);

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
-- Limitadores para a tabela `Acervo_Biblioteca`
--
ALTER TABLE `Acervo_Biblioteca`
  ADD CONSTRAINT `FKBiblioteca_Possui_FK` FOREIGN KEY (`ID_Bib`) REFERENCES `Biblioteca` (`ID_Bib`);

--
-- Limitadores para a tabela `Acervo_Museu`
--
ALTER TABLE `Acervo_Museu`
  ADD CONSTRAINT `FKMuseu_Possui_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Museu` (`ID_Unidade`);

--
-- Limitadores para a tabela `Aluno`
--
ALTER TABLE `Aluno`
  ADD CONSTRAINT `FKIsencao_na_inscricao_FK` FOREIGN KEY (`Ise_Codigo`) REFERENCES `Especializacao` (`Codigo`),
  ADD CONSTRAINT `FKcursa_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`),
  ADD CONSTRAINT `FKUsu_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Atribuicoes`
--
ALTER TABLE `Atribuicoes`
  ADD CONSTRAINT `FKProfessor_possui_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Bens`
--
ALTER TABLE `Bens`
  ADD CONSTRAINT `FKPossui_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Biblioteca`
--
ALTER TABLE `Biblioteca`
  ADD CONSTRAINT `FKEnsino_Possui3_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Ensino` (`ID_Unidade`);

--
-- Limitadores para a tabela `Coordena`
--
ALTER TABLE `Coordena`
  ADD CONSTRAINT `FKCoo_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`),
  ADD CONSTRAINT `FKCoo_Pro_1_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto_Pesquisa` (`ID_Projeto`);

--
-- Limitadores para a tabela `Creditos`
--
ALTER TABLE `Creditos`
  ADD CONSTRAINT `FKCre_Res_FK` FOREIGN KEY (`ID_Res`) REFERENCES `Restaurante` (`ID_Res`),
  ADD CONSTRAINT `FKCre_Usu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Doutorado`
--
ALTER TABLE `Doutorado`
  ADD CONSTRAINT `FKStr_Dou_FK` FOREIGN KEY (`Codigo`) REFERENCES `Strictu_Sensu` (`Codigo`);

--
-- Limitadores para a tabela `Emprestimos`
--
ALTER TABLE `Emprestimos`
  ADD CONSTRAINT `FKEmpresta_FK` FOREIGN KEY (`B_Item_Id`) REFERENCES `Acervo_Biblioteca` (`B_Item_Id`);

--
-- Limitadores para a tabela `Ensino`
--
ALTER TABLE `Ensino`
  ADD CONSTRAINT `FKComposicao_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`),
  ADD CONSTRAINT `FKUni_Ens_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Especializacao`
--
ALTER TABLE `Especializacao`
  ADD CONSTRAINT `FKLac_Esp_FK` FOREIGN KEY (`Codigo`) REFERENCES `Lactu_Sensu` (`Codigo`);

--
-- Limitadores para a tabela `Extensao_Possui`
--
ALTER TABLE `Extensao_Possui`
  ADD CONSTRAINT `FKExt_Ati_FK` FOREIGN KEY (`ID_Ati`) REFERENCES `Atividades_Extensao` (`ID_Ati`),
  ADD CONSTRAINT `FKExt_Pro` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto_Extensao` (`ID_Projeto`);

--
-- Limitadores para a tabela `Folha_de_Pagamento`
--
ALTER TABLE `Folha_de_Pagamento`
  ADD CONSTRAINT `FKServidor_Recebe_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Funcionario`
--
ALTER TABLE `Funcionario`
  ADD CONSTRAINT `FKSer_Fun_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Graduacao`
--
ALTER TABLE `Graduacao`
  ADD CONSTRAINT `FKCur_Gra_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`);

--
-- Limitadores para a tabela `Historico`
--
ALTER TABLE `Historico`
  ADD CONSTRAINT `FKHis_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKHis_Dis` FOREIGN KEY (`ID_Disciplina`) REFERENCES `Disciplinas` (`ID_Disciplina`);

--
-- Limitadores para a tabela `Hospital`
--
ALTER TABLE `Hospital`
  ADD CONSTRAINT `FKEnsino_Possui1_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Ensino` (`ID_Unidade`);

--
-- Limitadores para a tabela `Indice_de_Desempenho`
--
ALTER TABLE `Indice_de_Desempenho`
  ADD CONSTRAINT `FKInd_Alu_FK` FOREIGN KEY (`I_A_ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKInd_Cur_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`),
  ADD CONSTRAINT `FKInd_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Professor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Lactu_Sensu`
--
ALTER TABLE `Lactu_Sensu`
  ADD CONSTRAINT `FKPos_Lac_FK` FOREIGN KEY (`Codigo`) REFERENCES `Pos_Graduacao` (`Codigo`);

--
-- Limitadores para a tabela `MBA`
--
ALTER TABLE `MBA`
  ADD CONSTRAINT `FKLac_MBA_FK` FOREIGN KEY (`Codigo`) REFERENCES `Lactu_Sensu` (`Codigo`);

--
-- Limitadores para a tabela `Mestrado_Academico`
--
ALTER TABLE `Mestrado_Academico`
  ADD CONSTRAINT `FKStr_Mes_FK` FOREIGN KEY (`Codigo`) REFERENCES `Strictu_Sensu` (`Codigo`);

--
-- Limitadores para a tabela `Mestrado_Profissional`
--
ALTER TABLE `Mestrado_Profissional`
  ADD CONSTRAINT `FKStr_Mes_1_FK` FOREIGN KEY (`Codigo`) REFERENCES `Strictu_Sensu` (`Codigo`);

--
-- Limitadores para a tabela `Museu`
--
ALTER TABLE `Museu`
  ADD CONSTRAINT `FKUni_Mus_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Ocorrencias`
--
ALTER TABLE `Ocorrencias`
  ADD CONSTRAINT `FKServidor_tem_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Oferecimento`
--
ALTER TABLE `Oferecimento`
  ADD CONSTRAINT `FKOfe_Cur_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`),
  ADD CONSTRAINT `FKOfe_Dis` FOREIGN KEY (`ID_Disciplina`) REFERENCES `Disciplinas` (`ID_Disciplina`);

--
-- Limitadores para a tabela `Participa`
--
ALTER TABLE `Participa`
  ADD CONSTRAINT `FKPar_Alu_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Aluno` (`ID_Usuario`),
  ADD CONSTRAINT `FKPar_Pro` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto` (`ID_Projeto`);

--
-- Limitadores para a tabela `Pos_Graduacao`
--
ALTER TABLE `Pos_Graduacao`
  ADD CONSTRAINT `FKCur_Pos_FK` FOREIGN KEY (`Codigo`) REFERENCES `Cursos` (`Codigo`);

--
-- Limitadores para a tabela `Professor`
--
ALTER TABLE `Professor`
  ADD CONSTRAINT `FKSer_Pro_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Servidor` (`ID_Usuario`);

--
-- Limitadores para a tabela `Projeto`
--
ALTER TABLE `Projeto`
  ADD CONSTRAINT `FKFinancia_FK` FOREIGN KEY (`ID_Financiador`) REFERENCES `Financiador` (`ID_Financiador`);

--
-- Limitadores para a tabela `Projeto_Extensao`
--
ALTER TABLE `Projeto_Extensao`
  ADD CONSTRAINT `FKexerce_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Servidor` (`ID_Usuario`),
  ADD CONSTRAINT `FKPro_Pro_1_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto` (`ID_Projeto`);

--
-- Limitadores para a tabela `Projeto_Pesquisa`
--
ALTER TABLE `Projeto_Pesquisa`
  ADD CONSTRAINT `FKPro_Pro_FK` FOREIGN KEY (`ID_Projeto`) REFERENCES `Projeto` (`ID_Projeto`);

--
-- Limitadores para a tabela `Reitoria`
--
ALTER TABLE `Reitoria`
  ADD CONSTRAINT `FKAdmnistra_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Unidade` (`ID_Unidade`);

--
-- Limitadores para a tabela `Restaurante`
--
ALTER TABLE `Restaurante`
  ADD CONSTRAINT `FKEnsino_Possui2_FK` FOREIGN KEY (`ID_Unidade`) REFERENCES `Ensino` (`ID_Unidade`);

--
-- Limitadores para a tabela `Servidor`
--
ALTER TABLE `Servidor`
  ADD CONSTRAINT `FKUsu_Ser_FK` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`);

--
-- Limitadores para a tabela `Strictu_Sensu`
--
ALTER TABLE `Strictu_Sensu`
  ADD CONSTRAINT `FKPos_Str_FK` FOREIGN KEY (`Codigo`) REFERENCES `Pos_Graduacao` (`Codigo`);

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
