CREATE TYPE tp_localizacao AS OBJECT (
  id        NUMBER(4),
  rua       VARCHAR2(40),
  cep       VARCHAR2(12),
  cidade    VARCHAR2(30),
  estado    VARCHAR2(25));

CREATE TYPE nt_tp_localizacao AS TABLE OF tp_localizacao; 

CREATE TYPE tp_pais AS OBJECT (
  nome          VARCHAR2(40),
  localizacoes  nt_tp_localizacao);

CREATE TYPE nt_tp_paises AS TABLE OF tp_pais; 


CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
	cod NUMBER(4),        
	cep		varchar2(255),
        logradouro	varchar2(255),
        numero		varchar2(255)
);

CREATE OR REPLACE TYPE tp_contato AS OBJECT  (
  	cod NUMBER(4),
        celular varchar2(255),
        fone varchar2(255)
);




CREATE OR REPLACE TYPE tp_funcionario  AS OBJECT (
	id NUMBER(4),
	salario NUMBER(10,2),  
        nome varchar2(255),
        data_nascimento timestamp,
        matricula INTEGER,
        cpf varchar2(255),
        data_admissao timestamp,
        contato REF tp_contato,
        endereco REF tp_endereco
) NOT INSTANTIABLE NOT FINAL;
  
CREATE OR REPLACE TYPE tp_diretor_executivo UNDER  tp_funcionario(
	foto blob -- campo imágem atendendo ao requisito
);
    
CREATE OR REPLACE TYPE tp_diagramador UNDER  tp_funcionario();
   
CREATE OR REPLACE TYPE tp_editor UNDER  tp_funcionario();
    
CREATE OR REPLACE TYPE tp_jornalista UNDER  tp_funcionario();

CREATE OR REPLACE TYPE tp_fotografo UNDER  tp_funcionario();

ALTER TYPE tp_funcionario ADD ATTRIBUTE supervisor REF tp_diretor_executivo CASCADE; 

CREATE OR REPLACE TYPE tp_departamento AS OBJECT  (
  	cod NUMBER(4),
        nome varchar2(255),
        chefe REF  tp_diretor_executivo
);

ALTER TYPE tp_funcionario ADD ATTRIBUTE setor REF tp_departamento CASCADE;  


CREATE OR REPLACE TYPE tp_qualificador  AS OBJECT (
	cod NUMBER(4),
        materia_de_capa NUMBER(1,0),
        relevancia INTEGER,
        data_qualificacao timestamp,
	editor REF tp_editor
);


CREATE OR REPLACE TYPE  tp_materia AS OBJECT (
    	cod NUMBER(4),       
        lead varchar2(255),
        manchete varchar2(255),
        texto varchar2(255),
        titulo varchar2(255),
        data_aprovacao timestamp,
	editor REF tp_editor,
        data_escrita timestamp,
	jornalista REF tp_jornalista,
	qualificador tp_qualificador,
        data timestamp,
        FINAL MAP MEMBER FUNCTION lista_por_data RETURN timestamp
);

CREATE TYPE tp_nt_materias AS TABLE OF tp_materia;

CREATE OR REPLACE TYPE tp_caderno_tematico AS OBJECT(
	descricao varchar2(255),
	tema varchar2(255),
        data_diagramacao timestamp,
	diagramador REF tp_diagramador,
  	data_revisao timestamp,
	editor REF tp_editor,	
	materias tp_nt_materias
);


CREATE OR REPLACE TYPE tp_cadernos AS VARRAY(5) OF tp_caderno_tematico;


CREATE OR REPLACE TYPE tp_anuncio  AS OBJECT (
	tamanho varchar2(255),
	texto varchar2(255),
	titulo varchar2(255),
	valor NUMBER(10,2)
);

CREATE TYPE tp_nt_anuncios AS TABLE OF tp_anuncio;

CREATE OR REPLACE TYPE  tp_edicao   AS OBJECT  (
	valor NUMBER(10,2),
	data_edicao timestamp,
	data_aprovacao timestamp,
	responsavel REF tp_diretor_executivo,
	cadernos tp_cadernos,
	anuncios tp_nt_anuncios
);


CREATE OR REPLACE TYPE  tp_fotografia   AS OBJECT  (
	cod NUMBER(4),   
        data_foto timestamp,
        descricao varchar2(255),
        imagem varchar2(255),
        local varchar2(255),
        data timestamp,
    	fotografo REF tp_fotografo
);



CREATE OR REPLACE TYPE  tp_escolhe   AS OBJECT  (
	foto REF tp_FOTOGRAFIA,
    	data timestamp,
	materia REF tp_materia,
    	jornalista REF tp_jornalista
);



CREATE OR REPLACE TYPE  tp_cliente AS OBJECT (
  	id  NUMBER(4),
	contato ref tp_contato,
	endereco ref tp_endereco
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
        razao_social varchar2(255),
        paises  nt_tp_paises -- localidades em que o revendedor atua
);

CREATE OR REPLACE TYPE  tp_distribuida AS OBJECT (
        data timestamp,
        tiragem INTEGER,
	contato ref tp_contato,
        edicao tp_edicao,
	revendedor tp_revendedor
);


CREATE OR REPLACE TYPE  tp_compra AS OBJECT (
        data timestamp,
        termos varchar2(255),
	valor NUMBER(10,2),
        cliente REF tp_cliente,
	anuncios tp_nt_anuncios
	
);




CREATE TABLE TAB_PAIS  OF TP_PAIS NESTED TABLE localizacoes STORE AS nt_localizacao_t_P;
CREATE TABLE TAB_REVENDEDOR  OF TP_REVENDEDOR NESTED TABLE paises STORE AS nt_paises_t (NESTED TABLE localizacoes STORE AS nt_localizacao_t);
CREATE TABLE TAB_escolhe OF tp_escolhe;
CREATE TABLE TAB_EDICAO OF TP_EDICAO  NESTED TABLE anuncios STORE AS tb_l_anuncios; 
CREATE TABLE tab_caderno_tematico OF tp_caderno_tematico NESTED TABLE materias STORE AS tb_l_materias;
CREATE TABLE TAB_compra OF tp_compra  NESTED TABLE anuncios STORE AS tb_ls_anuncios; 
CREATE TABLE TAB_materia OF tp_materia ( cod PRIMARY KEY); 
CREATE TABLE TAB_FOTOGRAFIA OF TP_FOTOGRAFIA  ( cod PRIMARY KEY);
CREATE TABLE tab_localizacao OF tp_localizacao ;
CREATE TABLE TAB_ENDERECO OF TP_ENDERECO  ( cod PRIMARY KEY); 
CREATE TABLE TAB_CONTATO OF TP_CONTATO ( cod PRIMARY KEY) ;
CREATE TABLE TAB_DIRETOR_EXECUTIVO OF TP_DIRETOR_EXECUTIVO  ( id PRIMARY KEY); 
CREATE TABLE TAB_DIAGRAMADOR OF TP_DIAGRAMADOR ( id PRIMARY KEY);
CREATE TABLE TAB_EDITOR OF TP_EDITOR ( id PRIMARY KEY);
CREATE TABLE TAB_JORNALISTA OF TP_JORNALISTA ( id PRIMARY KEY); 
CREATE TABLE TAB_FOTOGRAFO OF TP_FOTOGRAFO ( id PRIMARY KEY);
CREATE TABLE TAB_ANUNCIO OF TP_ANUNCIO; 
CREATE TABLE TAB_PESSOA_FISICA OF TP_PESSOA_FISICA  ( id PRIMARY KEY, CPF unique) ; 
CREATE TABLE TAB_PESSOA_JURIDICA OF TP_PESSOA_JURIDICA ( id PRIMARY KEY, CNPJ unique) ;
create table tab_departamento OF tp_departamento ( cod PRIMARY KEY, nome NOT NULL, chefe WITH ROWID REFERENCES tab_diretor_executivo);




-- corpo da função MAP para ordenar diretores executivos por data de admissão 
CREATE OR REPLACE TYPE BODY tp_materia AS FINAL MAP MEMBER FUNCTION lista_por_data RETURN
	timestamp IS
	p timestamp := data_escrita;
	BEGIN
		RETURN p;
	END;
END;



