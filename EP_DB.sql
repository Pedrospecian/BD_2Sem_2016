-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 9.3.0              
-- * Generator date: Feb 16 2016              
-- * Generation date: Sat Nov 05 19:12:22 2016 
-- * LUN file: C:\Users\Lucas\Desktop\EP_DB.lun 
-- * Schema: ENTIDADE_RELACIONAMENTO/SQL 
-- ********************************************* 


-- Database Section
-- ________________ 

create database universidade;
use universidade;


-- Tables Section
-- _____________ 

create table Aluno (
     ID_Alu int not null auto_increment,
     ID_Usu int not null,
     ID_Pro int not null,
     constraint ID_Aluno_ID primary key (ID_Alu),
     constraint SID_Aluno_Usuar_ID unique (ID_Usu));

create table Bens (
     ID_Ben int not null auto_increment,
     Identificador char(1) not null,
     Localizacao char(1) not null,
     Valor char(1) not null,
     Data_de_Aquisicao char(1) not null,
     Tipo char(1) not null,
     constraint ID_Bens_ID primary key (ID_Ben));

create table Calendario (
     ID_Cal int not null auto_increment,
     constraint ID_Calendario_ID primary key (ID_Cal));

create table Coordena (
     ID_Pro int not null,
     Indice char(1) not null,
     Bolsa char(1) not null,
     C_P_ID_Pro int not null,
     constraint ID_Coord_Profe_ID primary key (ID_Pro));

create table Cursos (
     ID_Cur int not null auto_increment,
     Codigo char(1) not null,
     Nome char(1) not null,
     ID_Uni int not null,
     ID_Dis int not null,
     constraint ID_Cursos_ID primary key (ID_Cur));

create table Disciplinas (
     ID_Dis int not null auto_increment,
     Codigo char(1) not null,
     Nome char(1) not null,
     constraint ID_Disciplinas_ID primary key (ID_Dis));

create table Doutorado (
     ID_Pos int not null,
     constraint ID_Douto_Pos_G_ID primary key (ID_Pos));

create table Financiador (
     ID_Fin int not null auto_increment,
     Tipo char(1) not null,
     constraint ID_Financiador_ID primary key (ID_Fin));

create table Folha_de_Pagamento (
     ID_Fol int not null auto_increment,
     constraint ID_Folha_de_Pagamento_ID primary key (ID_Fol));

create table Funcionario (
     ID_Fun int not null auto_increment,
     ID_Usu int not null,
     funcao char(1) not null,
     ID_Oco int not null,
     constraint ID_Funcionario_ID primary key (ID_Fun),
     constraint SID_Funci_Usuar_ID unique (ID_Usu));

create table Graduacao (
     ID_Cur int not null,
     constraint ID_Gradu_Curso_ID primary key (ID_Cur));

create table Historico (
     ID_Alu int not null,
     ID_Dis int not null,
     Notas char(1) not null,
     Frequencia char(1) not null,
     constraint ID_Historico_ID primary key (ID_Alu, ID_Dis));

create table Indice_de_Desempenho (
     ID_Cur int not null,
     ID_Pro int not null,
     ID_Alu int not null,
     constraint ID_Indic_Curso_ID primary key (ID_Cur));

create table Mestrado_Academico (
     ID_Pos int not null,
     constraint ID_Mestr_Pos_G_1_ID primary key (ID_Pos));

create table Mestrado_Profissional (
     ID_Pos int not null,
     constraint ID_Mestr_Pos_G_ID primary key (ID_Pos));

create table Ocorrencias (
     ID_Oco int not null auto_increment,
     Tipo_Ocorrencia char(1) not null,
     constraint ID_Ocorrencias_ID primary key (ID_Oco));

create table Pos_Graduacao (
     ID_Pos int not null auto_increment,
     ID_Cur int not null,
     constraint ID_Pos_Graduacao_ID primary key (ID_Pos),
     constraint SID_Pos_G_Curso_ID unique (ID_Cur));

create table Possui (
     ID_Ben int not null,
     ID_Uni int not null,
     constraint ID_Possui_ID primary key (ID_Ben, ID_Uni));

create table Professor (
     ID_Pro int not null auto_increment,
     ID_Usu int not null,
     carreira char(1) not null,
     nivel char(1) not null,
     ID_Oco int not null,
     ID_Alu int not null,
     constraint ID_Professor_ID primary key (ID_Pro),
     constraint SID_Profe_Usuar_ID unique (ID_Usu));

create table Projeto_Extensao (
     ID_Pro int not null auto_increment,
     constraint ID_Projeto_Extensao_ID primary key (ID_Pro));

create table Projeto_Pesquisa (
     ID_Pro int not null auto_increment,
     Objetivo char(1) not null,
     Descricao char(1) not null,
     Orcamento char(1) not null,
     Atividade char(1) not null,
     ID_Fin int not null,
     constraint ID_Projeto_Pesquisa_ID primary key (ID_Pro));

create table R_14 (
     ID_Fol int not null,
     ID_Fun int not null,
     ID_Pro int not null,
     salario char(1) not null,
     constraint ID_R_14_ID primary key (ID_Fol, ID_Fun, ID_Pro));

create table R_5 (
     ID_Cal int not null,
     ID_Fin int not null,
     ID_Pro int not null,
     constraint ID_R_5_ID primary key (ID_Fin, ID_Pro, ID_Cal));

create table R_7 (
     ID_Alu int not null,
     ID_Fun int not null,
     R_P_ID_Pro int not null,
     ID_Pro int not null,
     constraint ID_R_7_ID primary key (ID_Pro, ID_Alu, R_P_ID_Pro, ID_Fun));

create table Unidade (
     ID_Uni int not null auto_increment,
     nome char(1) not null,
     tipo char(1) not null,
     ID_Usu int not null,
     constraint ID_Unidade_ID primary key (ID_Uni));

create table Usuario (
     ID_Usu int not null auto_increment,
     ID_Usuario char(1) not null,
     nome char(1) not null,
     cpf char(1) not null,
     Sexo char(1) not null,
     data_de_nascimento char(1) not null,
     constraint ID_Usuario_ID primary key (ID_Usu));


-- Constraints Section
-- ___________________ 

alter table Aluno add constraint SID_Aluno_Usuar_FK
     foreign key (ID_Usu)
     references Usuario (ID_Usu);

alter table Aluno add constraint REF_Aluno_Proje_FK
     foreign key (ID_Pro)
     references Projeto_Pesquisa (ID_Pro);

alter table Coordena add constraint ID_Coord_Profe_FK
     foreign key (ID_Pro)
     references Professor (ID_Pro);

alter table Coordena add constraint REF_Coord_Proje_FK
     foreign key (C_P_ID_Pro)
     references Projeto_Pesquisa (ID_Pro);

-- Not implemented
-- alter table Cursos add constraint ID_Cursos_CHK
--     check(exists(select * from Indice_de_Desempenho
--                  where Indice_de_Desempenho.ID_Cur = ID_Cur)); 

alter table Cursos add constraint REF_Curso_Unida_FK
     foreign key (ID_Uni)
     references Unidade (ID_Uni);

alter table Cursos add constraint REF_Curso_Disci_FK
     foreign key (ID_Dis)
     references Disciplinas (ID_Dis);

alter table Doutorado add constraint ID_Douto_Pos_G_FK
     foreign key (ID_Pos)
     references Pos_Graduacao (ID_Pos);

alter table Funcionario add constraint SID_Funci_Usuar_FK
     foreign key (ID_Usu)
     references Usuario (ID_Usu);

alter table Funcionario add constraint REF_Funci_Ocorr_FK
     foreign key (ID_Oco)
     references Ocorrencias (ID_Oco);

alter table Graduacao add constraint ID_Gradu_Curso_FK
     foreign key (ID_Cur)
     references Cursos (ID_Cur);

alter table Historico add constraint REF_Histo_Disci_FK
     foreign key (ID_Dis)
     references Disciplinas (ID_Dis);

alter table Historico add constraint REF_Histo_Aluno
     foreign key (ID_Alu)
     references Aluno (ID_Alu);

alter table Indice_de_Desempenho add constraint REF_Indic_Profe_FK
     foreign key (ID_Pro)
     references Professor (ID_Pro);

alter table Indice_de_Desempenho add constraint ID_Indic_Curso_FK
     foreign key (ID_Cur)
     references Cursos (ID_Cur);

alter table Indice_de_Desempenho add constraint REF_Indic_Aluno_FK
     foreign key (ID_Alu)
     references Aluno (ID_Alu);

alter table Mestrado_Academico add constraint ID_Mestr_Pos_G_1_FK
     foreign key (ID_Pos)
     references Pos_Graduacao (ID_Pos);

alter table Mestrado_Profissional add constraint ID_Mestr_Pos_G_FK
     foreign key (ID_Pos)
     references Pos_Graduacao (ID_Pos);

alter table Pos_Graduacao add constraint SID_Pos_G_Curso_FK
     foreign key (ID_Cur)
     references Cursos (ID_Cur);

alter table Possui add constraint REF_Possu_Unida_FK
     foreign key (ID_Uni)
     references Unidade (ID_Uni);

alter table Possui add constraint REF_Possu_Bens
     foreign key (ID_Ben)
     references Bens (ID_Ben);

-- Not implemented
-- alter table Professor add constraint ID_Professor_CHK
--     check(exists(select * from Coordena
--                  where Coordena.ID_Pro = ID_Pro)); 

alter table Professor add constraint SID_Profe_Usuar_FK
     foreign key (ID_Usu)
     references Usuario (ID_Usu);

alter table Professor add constraint REF_Profe_Ocorr_FK
     foreign key (ID_Oco)
     references Ocorrencias (ID_Oco);

alter table Professor add constraint REF_Profe_Aluno_FK
     foreign key (ID_Alu)
     references Aluno (ID_Alu);

alter table Projeto_Pesquisa add constraint REF_Proje_Finan_FK
     foreign key (ID_Fin)
     references Financiador (ID_Fin);

alter table R_14 add constraint REF_R_14_Profe_FK
     foreign key (ID_Pro)
     references Professor (ID_Pro);

alter table R_14 add constraint REF_R_14_Funci_FK
     foreign key (ID_Fun)
     references Funcionario (ID_Fun);

alter table R_14 add constraint REF_R_14_Folha
     foreign key (ID_Fol)
     references Folha_de_Pagamento (ID_Fol);

alter table R_5 add constraint REF_R_5_Proje_FK
     foreign key (ID_Pro)
     references Projeto_Extensao (ID_Pro);

alter table R_5 add constraint REF_R_5_Finan
     foreign key (ID_Fin)
     references Financiador (ID_Fin);

alter table R_5 add constraint REF_R_5_Calen_FK
     foreign key (ID_Cal)
     references Calendario (ID_Cal);

alter table R_7 add constraint REF_R_7_Proje
     foreign key (ID_Pro)
     references Projeto_Extensao (ID_Pro);

alter table R_7 add constraint REF_R_7_Profe_FK
     foreign key (R_P_ID_Pro)
     references Professor (ID_Pro);

alter table R_7 add constraint REF_R_7_Funci_FK
     foreign key (ID_Fun)
     references Funcionario (ID_Fun);

alter table R_7 add constraint REF_R_7_Aluno_FK
     foreign key (ID_Alu)
     references Aluno (ID_Alu);

alter table Unidade add constraint REF_Unida_Usuar_FK
     foreign key (ID_Usu)
     references Usuario (ID_Usu);


-- Index Section
-- _____________ 

create unique index ID_Aluno_IND
     on Aluno (ID_Alu);

create unique index SID_Aluno_Usuar_IND
     on Aluno (ID_Usu);

create index REF_Aluno_Proje_IND
     on Aluno (ID_Pro);

create unique index ID_Bens_IND
     on Bens (ID_Ben);

create unique index ID_Calendario_IND
     on Calendario (ID_Cal);

create unique index ID_Coord_Profe_IND
     on Coordena (ID_Pro);

create index REF_Coord_Proje_IND
     on Coordena (C_P_ID_Pro);

create unique index ID_Cursos_IND
     on Cursos (ID_Cur);

create index REF_Curso_Unida_IND
     on Cursos (ID_Uni);

create index REF_Curso_Disci_IND
     on Cursos (ID_Dis);

create unique index ID_Disciplinas_IND
     on Disciplinas (ID_Dis);

create unique index ID_Douto_Pos_G_IND
     on Doutorado (ID_Pos);

create unique index ID_Financiador_IND
     on Financiador (ID_Fin);

create unique index ID_Folha_de_Pagamento_IND
     on Folha_de_Pagamento (ID_Fol);

create unique index ID_Funcionario_IND
     on Funcionario (ID_Fun);

create unique index SID_Funci_Usuar_IND
     on Funcionario (ID_Usu);

create index REF_Funci_Ocorr_IND
     on Funcionario (ID_Oco);

create unique index ID_Gradu_Curso_IND
     on Graduacao (ID_Cur);

create unique index ID_Historico_IND
     on Historico (ID_Alu, ID_Dis);

create index REF_Histo_Disci_IND
     on Historico (ID_Dis);

create index REF_Indic_Profe_IND
     on Indice_de_Desempenho (ID_Pro);

create unique index ID_Indic_Curso_IND
     on Indice_de_Desempenho (ID_Cur);

create index REF_Indic_Aluno_IND
     on Indice_de_Desempenho (ID_Alu);

create unique index ID_Mestr_Pos_G_1_IND
     on Mestrado_Academico (ID_Pos);

create unique index ID_Mestr_Pos_G_IND
     on Mestrado_Profissional (ID_Pos);

create unique index ID_Ocorrencias_IND
     on Ocorrencias (ID_Oco);

create unique index ID_Pos_Graduacao_IND
     on Pos_Graduacao (ID_Pos);

create unique index SID_Pos_G_Curso_IND
     on Pos_Graduacao (ID_Cur);

create unique index ID_Possui_IND
     on Possui (ID_Ben, ID_Uni);

create index REF_Possu_Unida_IND
     on Possui (ID_Uni);

create unique index ID_Professor_IND
     on Professor (ID_Pro);

create unique index SID_Profe_Usuar_IND
     on Professor (ID_Usu);

create index REF_Profe_Ocorr_IND
     on Professor (ID_Oco);

create index REF_Profe_Aluno_IND
     on Professor (ID_Alu);

create unique index ID_Projeto_Extensao_IND
     on Projeto_Extensao (ID_Pro);

create unique index ID_Projeto_Pesquisa_IND
     on Projeto_Pesquisa (ID_Pro);

create index REF_Proje_Finan_IND
     on Projeto_Pesquisa (ID_Fin);

create unique index ID_R_14_IND
     on R_14 (ID_Fol, ID_Fun, ID_Pro);

create index REF_R_14_Profe_IND
     on R_14 (ID_Pro);

create index REF_R_14_Funci_IND
     on R_14 (ID_Fun);

create unique index ID_R_5_IND
     on R_5 (ID_Fin, ID_Pro, ID_Cal);

create index REF_R_5_Proje_IND
     on R_5 (ID_Pro);

create index REF_R_5_Calen_IND
     on R_5 (ID_Cal);

create unique index ID_R_7_IND
     on R_7 (ID_Pro, ID_Alu, R_P_ID_Pro, ID_Fun);

create index REF_R_7_Profe_IND
     on R_7 (R_P_ID_Pro);

create index REF_R_7_Funci_IND
     on R_7 (ID_Fun);

create index REF_R_7_Aluno_IND
     on R_7 (ID_Alu);

create unique index ID_Unidade_IND
     on Unidade (ID_Uni);

create index REF_Unida_Usuar_IND
     on Unidade (ID_Usu);

create unique index ID_Usuario_IND
     on Usuario (ID_Usu);

