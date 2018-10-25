CREATE OR REPLACE TYPE tp_atividade AS object (
	Cod integer,
	descricao varchar2(20)
) NOT FINAL;


CREATE OR REPLACE TYPE tp_projeto AS OBJECT (
	Cod INTEGER,
	descricao VARCHAR2(20),
	valor NUMBER(12,2)
) NOT FINAL;


CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
	descricao varchar2(30),
	CEP varchar2(9)
	Redefinir PROJETO
);

CREATE OR REPLACE TYPE tp_fone AS OBJECT (
	cod_area VARCHAR2(2),
	numero VARCHAR2(8)
);

CREATE OR REPLACE TYPE tp_fones AS VARRAY(5) OF tp_fone;

CREATE OR REPLACE TYPE tp_empregado AS OBJECT(
	CPF varchar2(12),
	nome varchar2(25),
	sexo char,
	salario number(8,2),
	dtNascimento date,
	endereco tp_endereco,
	fones tp_fones
) NOT FINAL;

CREATE OR REPLACE TYPE tp_graduado UNDER tp_empregado();

CREATE TYPE tp_tecnico UNDER tp_empregado( ultimaSerie VARCHAR2(30) ) NOT FINAL;

ALTER TYPE tp_empregado ADD ATTRIBUTE (supervisor REF tp_graduado) CASCADE ;

CREATE TABLE tb_atividade of tp_atividade (cod PRIMARY KEY );

CREATE TABLE tb_projeto OF tp_projeto;

CREATE TABLE tb_GRADUADO of tp_graduado;

CREATE TABLE tb_tecnico OF tp_tecnico;

CREATE OR REPLACE TYPE tp_relac AS OBJECT(
	projeto REF tp_projeto,
	atividade REF tp_atividade,
	empregado REF tp_empregado
) NOT FINAL;

CREATE TABLE tb_relac OF tp_relac;

INSERT INTO tb_graduado VALUES (tp_graduado(tp_empregado('132516702-16', 'Ana Paula', 'F', 12345.00, to_date('10/04/1970', 'dd/mm/yyyy'), tp_endereco('R. Janaína, 15','52020-200'), tp_fones( ), null)) ));


INSERT INTO tb_graduado VALUES (tp_graduado(tp_empregado('215439210-15', 'Jonas Mota', 'M', 10115.00, to_date('12/03/1975', 'dd/mm/yyyy'), tp_endereco('R. Sanharó, 32', '51020-710'), tp_fones(tp_fone('81', '32712044'), tp_fone('21', '32295968')), (SELECT REF(G) FROM tb_graduado G WHERE cpf ='132516702-16') )));


INSERT INTO tb_graduado VALUES (tp_graduado(tp_empregado('420316123-45', 'Helena Ramos', 'F', 8500.00, to_date('21/11/1982', 'dd/mm/yyyy'), tp_endereco('R. Roriz, 100', '50135-316'), null, (SELECT REF(G) FROM tb_graduado G WHERE cpf ='132516702-16') )));

INSERT INTO tb_tecnico VALUES (tp_tecnico(tp_empregado('813509123-35', 'Márcia Rocha', 'F', 9200.00, to_date('13/08/1976', 'dd/mm/yyyy'), tp_endereco('R. Andaluzia, 1245', '51005-356'), null, (SELECT REF(G) FROM tb_graduado G WHERE cpf ='420316123-45')) , 'Terceiro') ));

INSERT INTO tb_tecnico VALUES (tp_tecnico(tp_empregado('515422936-18', 'Marcos Lessa', 'M', 7934.00, to_date('19/10/1986', 'dd/mm/yyyy'), tp_endereco('R. Baronesa Léa, 15', '50540-930'), tp_fones(tp_fone('83', '63502143'), tp_fone('11', '98764592')), (SELECT REF(G) FROM tb_graduado G WHERE cpf ='420316123-45')) , 'Quinto')));

INSERT INTO tb_relac VALUES (tp_relac((SELECT REF(P) FROM tb_projeto P WHERE cod =1), (SELECT REF(A) FROM tb_atividade A WHERE cod =1) , (SELECT REF(G) FROM tb_graduado G WHERE cpf ='420316123-45') ));

INSERT INTO tb_relac VALUES (tp_relac((SELECT REF(P) FROM tb_projeto P WHERE cod =2), (SELECT REF(A) FROM tb_atividade A WHERE cod =3) , (SELECT REF(G) FROM tb_graduado G WHERE cpf ='420316123-45') ));

INSERT INTO tb_relac VALUES (tp_relac((SELECT REF(P) FROM tb_projeto P WHERE cod =3), (SELECT REF(A) FROM tb_atividade A WHERE cod =2), (SELECT REF(G) FROM tb_tecnico G WHERE cpf ='813509123-35') ));


CREATE OR REPLACE TYPE tp_ref_relac AS OBJECT(projeto REF tp_projeto) NOT FINAL;

CREATE TYPE tp_nt_ref_relac AS TABLE OF tp_ref_relac;

CREATE OR REPLACE TYPE tp_agencia AS OBJECT (
	id INTEGER,
	sigla VARCHAR2(20),
	Projetos tp_nt_ref_relac
) NOT FINAL;

CREATE TABLE tb_agencia OF tp_agencia NESTED TABLE Projetos STORE AS lista_projetos;

INSERT INTO tb_agencia VALUES (tp_agencia(1, 'CAPES', tp_nt_ref_relac( )));

INSERT INTO tb_agencia VALUES (tp_agencia(2, 'CNPq', tp_nt_ref_relac( )));

INSERT INTO tb_agencia VALUES (tp_agencia(3, 'FACEPE', tp_nt_ref_relac( )));

INSERT INTO tb_agencia VALUES (tp_agencia(4, 'FINEPE', tp_nt_ref_relac( )));


UPDATE tb_agencia A
SET A.projetos = tp_nt_ref_relac ( tp_ref_relac((SELECT REF(P) FROM tb_projeto P WHERE P.cod =3)), tp_ref_relac((SELECT REF(P) FROM tb_projeto P WHERE P.cod =1))) WHERE id = 3 ;








