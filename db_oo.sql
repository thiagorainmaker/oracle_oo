CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
        cep varchar2(255),
        logradouro varchar2(255),
        numero varchar2(255)
);

CREATE OR REPLACE TYPE tp_contato AS OBJECT  (
        celular varchar2(255),
        fone varchar2(255)
);

CREATE OR REPLACE TYPE tp_funcionario  AS OBJECT (
        nome varchar2(255),
        data_nascimento timestamp,
        matricula INTEGER,
        cpf varchar2(255),
        setor varchar2(255),
        data_admissao timestamp,
        contato REF tp_contato,
        endereco REF tp_endereco
) NOT FINAL;
  
CREATE OR REPLACE TYPE tp_diretor_executivo UNDER  tp_funcionario(
);
    
CREATE OR REPLACE TYPE tp_diagramador UNDER  tp_funcionario(
);
   
CREATE OR REPLACE TYPE tp_editor UNDER  tp_funcionario(
);
    
CREATE OR REPLACE TYPE tp_jornalista UNDER  tp_funcionario(
);

CREATE OR REPLACE TYPE tp_fotografo UNDER  tp_funcionario(
);

ALTER TYPE tp_funcionario ADD ATTRIBUTE supervisor REF tp_diretor_executivo CASCADE;  


CREATE OR REPLACE TYPE tp_qualificador  AS OBJECT (
        materia_de_capa NUMBER(1,0),
        relevancia INTEGER,
        data_qualificacao timestamp,
	editor REF tp_editor
);


CREATE OR REPLACE TYPE  tp_materia AS OBJECT (
        lead varchar2(255),
        manchete varchar2(255),
        texto varchar2(255),
        titulo varchar2(255),
        data_aprovacao timestamp,
	editor REF tp_editor,
        data_escrita timestamp,
	jornalista REF tp_jornalista,
	qualificador REF tp_qualificador,
        data timestamp
);

CREATE TYPE tp_nt_materias AS TABLE OF tp_materia;

CREATE OR REPLACE TYPE tp_caderno_tematico AS OBJECT(
	descricao varchar2(255),
	tema varchar2(255),
        data_diagramacao timestamp,
	diagramador REF tp_diagramador,	
	materias tp_nt_materias
);


CREATE OR REPLACE TYPE tp_cadernos AS VARRAY(10) OF tp_caderno_tematico;


CREATE OR REPLACE TYPE  tp_edicao   AS OBJECT  (
    valor NUMBER(10,2), 
    data_edicao timestamp,
    data_aprovacao timestamp,
	responsavel REF tp_diretor_executivo,
	cadernos tp_cadernos
);


CREATE OR REPLACE TYPE  tp_fotografia   AS OBJECT  (
        data_foto timestamp,
        descricao varchar2(255),
        imagem varchar2(255),
        local varchar2(255),
        data timestamp,
    	fotografo REF tp_fotografo
);


CREATE OR REPLACE TYPE tp_fotos AS VARRAY(5) OF tp_fotografia;

CREATE OR REPLACE TYPE  tp_escolhe   AS OBJECT  (
	lista_fotos tp_fotos,
        data timestamp,
	materias  tp_nt_materias
)





CREATE OR REPLACE TYPE tp_anuncio  AS OBJECT (
	tamanho varchar2(255),
	texto varchar2(255),
	titulo varchar2(255),
	valor NUMBER(10,2)
);



CREATE OR REPLACE TYPE  tp_cliente AS OBJECT (
        texto varchar2(255),
	contato tp_contato,
	endereco tp_endereco
)NOT FINAL;

CREATE OR REPLACE TYPE tp_pessoa_fisica  UNDER tp_cliente(
        cpf varchar2(255),
        nome varchar2(255)
);
CREATE OR REPLACE TYPE  tp_pessoa_juridica UNDER tp_cliente(
        cnpj varchar2(255),
        razao_social varchar2(255)
);

CREATE OR REPLACE TYPE tp_revendedor AS OBJECT (
        cnpj varchar2(255),
        razao_social varchar2(255)
);


CREATE TABLE tab_caderno_tematico OF tp_caderno_tematico NESTED TABLE materias STORE AS tb_l_materias;
CREATE TABLE TAB_EDICAO OF TP_EDICAO ;
CREATE TABLE TAB_materia OF tp_materia ;
CREATE TABLE TAB_escolhe OF tp_escolhe NESTED TABLE materias STORE AS tb_list_materias
CREATE TABLE TAB_FOTOGRAFIA OF TP_FOTOGRAFIA ;
CREATE TABLE TAB_ENDERECO OF TP_ENDERECO; 
CREATE TABLE TAB_CONTATO OF TP_CONTATO ;
CREATE TABLE TAB_DIRETOR_EXECUTIVO OF TP_DIRETOR_EXECUTIVO; 
CREATE TABLE TAB_DIAGRAMADOR OF TP_DIAGRAMADOR ;
CREATE TABLE TAB_EDITOR OF TP_EDITOR ;
CREATE TABLE TAB_JORNALISTA OF TP_JORNALISTA; 
CREATE TABLE TAB_FOTOGRAFO OF TP_FOTOGRAFO ;
CREATE TABLE TAB_ANUNCIO OF TP_ANUNCIO; 
CREATE TABLE TAB_QUALIFICADOR OF TP_QUALIFICADOR; 
CREATE TABLE TAB_PESSOA_FISICA OF TP_PESSOA_FISICA; 
CREATE TABLE TAB_PESSOA_JURIDICA OF TP_PESSOA_JURIDICA; 
CREATE TABLE TAB_REVENDEDOR OF TP_REVENDEDOR ;
