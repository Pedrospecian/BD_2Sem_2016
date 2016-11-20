


-- Database Section
-- ________________ 

create database ENTIDADE_RELACIONAMENTO;
use ENTIDADE_RELACIONAMENTO;


-- Tables Section
-- _____________ 

create table Aluno (
     ID_Usuario int not null,
     Codigo bigint not null,
     Ise_Codigo bigint,
     constraint FKUsu_Alu_ID primary key (ID_Usuario));

create table Atividades_Extensao (
     ID_Ati int not null auto_increment,
     Data_Atividade char(1) not null,
     Localizacao char(255) not null,
     constraint ID_ID primary key (ID_Ati));

create table Atribuicoes (
     Id_Atribuicoes int not null,
     Data_Inicio date,
     Data_Fim date,
     Nome_Atribuicao char(255) not null,
     ID_Usuario int not null,
     constraint ID_Atribuicoes_ID primary key (Id_Atribuicoes));

create table Bens (
     Localizacao char(255) not null,
     Valor int not null,
     ID_bem int not null,
     Data_de_Aquisicao date not null,
     Tipo char(255) not null,
     ID_Unidade int not null,
     constraint ID_Bens_ID primary key (ID_bem));

create table Coordena (
     ID_Projeto bigint not null,
     Indice_Pequisador int not null,
     Bolsa_Pesquisador int not null,
     ID_Usuario int not null,
     constraint FKCoo_Pro_ID primary key (ID_Projeto));

create table Cursos (
     Codigo bigint not null,
     Nome char(255) not null,
     ID_Unidade int not null,
     constraint ID_Cursos_ID primary key (Codigo));

create table Disciplinas (
     ID_Disciplina int not null,
     Nome char(255) not null,
     constraint ID_Disciplinas_ID primary key (ID_Disciplina));

create table Doutorado (
     Codigo bigint not null,
     constraint FKStr_Dou_ID primary key (Codigo));

create table Especializacao (
     Codigo bigint not null,
     constraint FKLac_Esp_ID primary key (Codigo));

create table Extensao_Possui (
     ID_Ati int not null,
     ID_Projeto bigint not null,
     constraint ID_Extensao_Possui_ID primary key (ID_Ati, ID_Projeto));

create table Financiador (
     Tipo char(255) not null,
     nome char(255) not null,
     ID_Financiador int not null,
     constraint ID_Financiador_ID primary key (ID_Financiador));

create table Folha_de_Pagamento (
     Salario int not null,
     Data char(1) not null,
     ID_Usuario int not null,
     constraint ID_Folha_de_Pagamento_ID primary key (Data),
     constraint FKServidor_Recebe_ID unique (ID_Usuario));

create table Funcionario (
     ID_Usuario int not null,
     Funcao char(255) not null,
     constraint FKSer_Fun_ID primary key (ID_Usuario));

create table Graduacao (
     Codigo bigint not null,
     constraint FKCur_Gra_ID primary key (Codigo));

create table Historico (
     ID_Usuario int not null,
     ID_Disciplina int not null,
     Notas int not null,
     Frequencia int not null,
     constraint ID_Historico_ID primary key (ID_Usuario, ID_Disciplina));

create table Indice_de_Desempenho (
     Codigo bigint not null,
     Indice_Curso char(1) not null,
     ID_Usuario int not null,
     I_A_ID_Usuario int not null,
     constraint FKInd_Cur_ID primary key (Codigo));

create table Lactu_Sensu (
     Codigo bigint not null,
     Valor_Mensalidade int not null,
     constraint FKPos_Lac_ID primary key (Codigo));

create table MBA (
     Codigo bigint not null,
     constraint FKLac_MBA_ID primary key (Codigo));

create table Mestrado_Academico (
     Codigo bigint not null,
     constraint FKStr_Mes_ID primary key (Codigo));

create table Mestrado_Profissional (
     Codigo bigint not null,
     constraint FKStr_Mes_1_ID primary key (Codigo));

create table Ocorrencias (
     ID_Ocorrencia int not null,
     Tipo_Ocorrencia char(255) not null,
     Data_Inicio date not null,
     Data_Final date not null,
     ID_Usuario int not null,
     constraint ID_Ocorrencias_ID primary key (ID_Ocorrencia));

create table Pos_Graduacao (
     Codigo bigint not null,
     Data_defesa_do_Trabalho_final date not null,
     constraint FKCur_Pos_ID primary key (Codigo));

create table Professor (
     ID_Usuario int not null,
     carreira char(255) not null,
     nivel char(255) not null,
     constraint FKSer_Pro_ID primary key (ID_Usuario));

create table Projeto (
     objetivo char(255) not null,
     Data_Inicio date not null,
     Descricao char(255) not null,
     Data_Termino date not null,
     Orcamento bigint not null,
     ID_Projeto bigint not null,
     ID_Financiador int not null,
     constraint ID_Projeto_ID primary key (ID_Projeto));

create table Projeto_Extensao (
     ID_Projeto bigint not null,
     ID_Usuario int not null,
     constraint FKPro_Pro_1_ID primary key (ID_Projeto));

create table Projeto_Pesquisa (
     ID_Projeto bigint not null,
     constraint FKPro_Pro_ID primary key (ID_Projeto));

create table Oferecimento (
     Codigo bigint not null,
     ID_Disciplina int not null,
     constraint ID_Oferecimento_ID primary key (Codigo, ID_Disciplina));

create table Participa (
     ID_Usuario int not null,
     ID_Projeto bigint not null,
     Bolsa int not null,
     constraint ID_Participa_ID primary key (ID_Projeto, ID_Usuario));

create table Servidor (
     ID_Usuario int not null,
     constraint FKUsu_Ser_ID primary key (ID_Usuario));

create table Strictu_Sensu (
     Codigo bigint not null,
     Data_final_qualifiacao date not null,
     constraint FKPos_Str_ID primary key (Codigo));

create table Unidade (
     Nome_Unidade char(255) not null,
     Endereco char(255) not null,
     ID_Unidade int not null,
     constraint ID_Unidade_ID primary key (ID_Unidade));

create table Usuario (
     ID_Usuario int not null,
     nome char(255) not null,
     cpf char(14) not null,
     Sexo char(255) not null,
     data_de_nascimento date not null,
     ID_Unidade int not null,
     constraint ID_Usuario_ID primary key (ID_Usuario));

create table Verba (
     Valor bigint not null,
     Data date not null,
     ID_Unidade int not null);


-- Constraints Section
-- ___________________ 

alter table Aluno add constraint FKUsu_Alu_FK
     foreign key (ID_Usuario)
     references Usuario (ID_Usuario);

alter table Aluno add constraint FKcursa_FK
     foreign key (Codigo)
     references Cursos (Codigo);

alter table Aluno add constraint FKIsencao_na_Inscricao_FK
     foreign key (Ise_Codigo)
     references Especializacao (Codigo);

alter table Atribuicoes add constraint FKProfessor_Possui_FK
     foreign key (ID_Usuario)
     references Professor (ID_Usuario);

alter table Bens add constraint FKPossui_FK
     foreign key (ID_Unidade)
     references Unidade (ID_Unidade);

alter table Coordena add constraint FKCoo_Pro_1_FK
     foreign key (ID_Usuario)
     references Professor (ID_Usuario);

alter table Coordena add constraint FKCoo_Pro_FK
     foreign key (ID_Projeto)
     references Projeto_Pesquisa (ID_Projeto);

-- Not implemented
-- alter table Cursos add constraint ID_Cursos_CHK
--     check(exists(select * from Indice_de_Desempenho
--                  where Indice_de_Desempenho.Codigo = Codigo)); 

-- Not implemented
-- alter table Cursos add constraint ID_Cursos_CHK
--     check(exists(select * from Oferecimento
--                  where Oferecimento.Codigo = Codigo)); 

alter table Cursos add constraint FKComposicao_FK
     foreign key (ID_Unidade)
     references Unidade (ID_Unidade);

alter table Doutorado add constraint FKStr_Dou_FK
     foreign key (Codigo)
     references Strictu_Sensu (Codigo);

alter table Especializacao add constraint FKLac_Esp_FK
     foreign key (Codigo)
     references Lactu_Sensu (Codigo);

alter table Extensao_Possui add constraint FKExt_Pro_FK
     foreign key (ID_Projeto)
     references Projeto_Extensao (ID_Projeto);

alter table Extensao_Possui add constraint FKExt_Ati
     foreign key (ID_Ati)
     references Atividades_Extensao (ID_Ati);

-- Not implemented
-- alter table Financiador add constraint ID_Financiador_CHK
--     check(exists(select * from Projeto
--                  where Projeto.ID_Financiador = ID_Financiador)); 

alter table Folha_de_Pagamento add constraint FKServidor_Recebe_FK
     foreign key (ID_Usuario)
     references Servidor (ID_Usuario);

alter table Funcionario add constraint FKSer_Fun_FK
     foreign key (ID_Usuario)
     references Servidor (ID_Usuario);

alter table Graduacao add constraint FKCur_Gra_FK
     foreign key (Codigo)
     references Cursos (Codigo);

alter table Historico add constraint FKHis_Dis_FK
     foreign key (ID_Disciplina)
     references Disciplinas (ID_Disciplina);

alter table Historico add constraint FKHis_Alu
     foreign key (ID_Usuario)
     references Aluno (ID_Usuario);

alter table Indice_de_Desempenho add constraint FKInd_Pro_FK
     foreign key (ID_Usuario)
     references Professor (ID_Usuario);

alter table Indice_de_Desempenho add constraint FKInd_Cur_FK
     foreign key (Codigo)
     references Cursos (Codigo);

alter table Indice_de_Desempenho add constraint FKInd_Alu_FK
     foreign key (I_A_ID_Usuario)
     references Aluno (ID_Usuario);

alter table Lactu_Sensu add constraint FKPos_Lac_FK
     foreign key (Codigo)
     references Pos_Graduacao (Codigo);

alter table MBA add constraint FKLac_MBA_FK
     foreign key (Codigo)
     references Lactu_Sensu (Codigo);

alter table Mestrado_Academico add constraint FKStr_Mes_FK
     foreign key (Codigo)
     references Strictu_Sensu (Codigo);

alter table Mestrado_Profissional add constraint FKStr_Mes_1_FK
     foreign key (Codigo)
     references Strictu_Sensu (Codigo);

alter table Ocorrencias add constraint FKServidor_tem_FK
     foreign key (ID_Usuario)
     references Servidor (ID_Usuario);

alter table Pos_Graduacao add constraint FKCur_Pos_FK
     foreign key (Codigo)
     references Cursos (Codigo);

alter table Professor add constraint FKSer_Pro_FK
     foreign key (ID_Usuario)
     references Servidor (ID_Usuario);

alter table Projeto add constraint FKFinancia_FK
     foreign key (ID_Financiador)
     references Financiador (ID_Financiador);

alter table Projeto_Extensao add constraint FKPro_Pro_1_FK
     foreign key (ID_Projeto)
     references Projeto (ID_Projeto);

alter table Projeto_Extensao add constraint FKexerce_FK
     foreign key (ID_Usuario)
     references Servidor (ID_Usuario);

-- Not implemented
-- alter table Projeto_Pesquisa add constraint FKPro_Pro_CHK
--     check(exists(select * from Coordena
--                  where Coordena.ID_Projeto = ID_Projeto)); 

alter table Projeto_Pesquisa add constraint FKPro_Pro_FK
     foreign key (ID_Projeto)
     references Projeto (ID_Projeto);

alter table Oferecimento add constraint FKOfe_Dis_FK
     foreign key (ID_Disciplina)
     references Disciplinas (ID_Disciplina);

alter table Oferecimento add constraint FKOfe_Cur
     foreign key (Codigo)
     references Cursos (Codigo);

alter table Participa add constraint FKPar_Pro
     foreign key (ID_Projeto)
     references Projeto (ID_Projeto);

alter table Participa add constraint FKPar_Alu_FK
     foreign key (ID_Usuario)
     references Aluno (ID_Usuario);

-- Not implemented
-- alter table Servidor add constraint FKUsu_Ser_CHK
--     check(exists(select * from Folha_de_Pagamento
--                  where Folha_de_Pagamento.ID_Usuario = ID_Usuario)); 

alter table Servidor add constraint FKUsu_Ser_FK
     foreign key (ID_Usuario)
     references Usuario (ID_Usuario);

alter table Strictu_Sensu add constraint FKPos_Str_FK
     foreign key (Codigo)
     references Pos_Graduacao (Codigo);

alter table Usuario add constraint FKCadastro_FK
     foreign key (ID_Unidade)
     references Unidade (ID_Unidade);

alter table Verba add constraint FKganha_FK
     foreign key (ID_Unidade)
     references Unidade (ID_Unidade);


-- Index Section
-- _____________ 

create unique index FKUsu_Alu_IND
     on Aluno (ID_Usuario);

create index FKcursa_IND
     on Aluno (Codigo);

create index FKIsencao_na_Inscricao_IND
     on Aluno (Ise_Codigo);

create unique index ID_IND
     on Atividades_Extensao (ID_Ati);

create unique index ID_Atribuicoes_IND
     on Atribuicoes (Id_Atribuicoes);

create index FKProfessor_Possui_IND
     on Atribuicoes (ID_Usuario);

create unique index ID_Bens_IND
     on Bens (ID_bem);

create index FKPossui_IND
     on Bens (ID_Unidade);

create index FKCoo_Pro_1_IND
     on Coordena (ID_Usuario);

create unique index FKCoo_Pro_IND
     on Coordena (ID_Projeto);

create unique index ID_Cursos_IND
     on Cursos (Codigo);

create index FKComposicao_IND
     on Cursos (ID_Unidade);

create unique index ID_Disciplinas_IND
     on Disciplinas (ID_Disciplina);

create unique index FKStr_Dou_IND
     on Doutorado (Codigo);

create unique index FKLac_Esp_IND
     on Especializacao (Codigo);

create unique index ID_Extensao_Possui_IND
     on Extensao_Possui (ID_Ati, ID_Projeto);

create index FKExt_Pro_IND
     on Extensao_Possui (ID_Projeto);

create unique index ID_Financiador_IND
     on Financiador (ID_Financiador);

create unique index ID_Folha_de_Pagamento_IND
     on Folha_de_Pagamento (Data);

create unique index FKServidor_Recebe_IND
     on Folha_de_Pagamento (ID_Usuario);

create unique index FKSer_Fun_IND
     on Funcionario (ID_Usuario);

create unique index FKCur_Gra_IND
     on Graduacao (Codigo);

create unique index ID_Historico_IND
     on Historico (ID_Usuario, ID_Disciplina);

create index FKHis_Dis_IND
     on Historico (ID_Disciplina);

create index FKInd_Pro_IND
     on Indice_de_Desempenho (ID_Usuario);

create unique index FKInd_Cur_IND
     on Indice_de_Desempenho (Codigo);

create index FKInd_Alu_IND
     on Indice_de_Desempenho (I_A_ID_Usuario);

create unique index FKPos_Lac_IND
     on Lactu_Sensu (Codigo);

create unique index FKLac_MBA_IND
     on MBA (Codigo);

create unique index FKStr_Mes_IND
     on Mestrado_Academico (Codigo);

create unique index FKStr_Mes_1_IND
     on Mestrado_Profissional (Codigo);

create unique index ID_Ocorrencias_IND
     on Ocorrencias (ID_Ocorrencia);

create index FKServidor_tem_IND
     on Ocorrencias (ID_Usuario);

create unique index FKCur_Pos_IND
     on Pos_Graduacao (Codigo);

create unique index FKSer_Pro_IND
     on Professor (ID_Usuario);

create unique index ID_Projeto_IND
     on Projeto (ID_Projeto);

create index FKFinancia_IND
     on Projeto (ID_Financiador);

create unique index FKPro_Pro_1_IND
     on Projeto_Extensao (ID_Projeto);

create index FKexerce_IND
     on Projeto_Extensao (ID_Usuario);

create unique index FKPro_Pro_IND
     on Projeto_Pesquisa (ID_Projeto);

create unique index ID_Oferecimento_IND
     on Oferecimento (Codigo, ID_Disciplina);

create index FKOfe_Dis_IND
     on Oferecimento (ID_Disciplina);

create unique index ID_Participa_IND
     on Participa (ID_Projeto, ID_Usuario);

create index FKPar_Alu_IND
     on Participa (ID_Usuario);

create unique index FKUsu_Ser_IND
     on Servidor (ID_Usuario);

create unique index FKPos_Str_IND
     on Strictu_Sensu (Codigo);

create unique index ID_Unidade_IND
     on Unidade (ID_Unidade);

create unique index ID_Usuario_IND
     on Usuario (ID_Usuario);

create index FKCadastro_IND
     on Usuario (ID_Unidade);

create index FKganha_IND
     on Verba (ID_Unidade);

