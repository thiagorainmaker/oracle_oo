CREATE OR REPLACE TYPE tp_carro AS OBJECT (
    nome VARCHAR2(8)
);

CREATE TYPE tp_nt_carros AS TABLE OF tp_carro;

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
   	 nome VARCHAR2(8),
 	carros tp_nt_carros
);



CREATE TABLE tb_lista_carros OF tp_pessoa
NESTED TABLE carros STORE AS tb_l_carros;

---------------------------------------------------------------------------------------------





CREATE OR REPLACE TYPE tp_fone AS OBJECT (
cod_area VARCHAR2(2),
numero
VARCHAR2(8));

CREATE TYPE tp_nt_fone AS TABLE OF tp_fone;


CREATE OR REPLACE TYPE tp_lista_fones_Departamento AS OBJECT(
cod_depto NUMBER(5),
lista_fones tp_nt_fone);



CREATE TABLE tb_lista_fones_Departamento OF tp_lista_fones_departamento
NESTED TABLE lista_fones STORE AS tb_lista_fones;


INSERT INTO tb_lista_fones_departamento VALUES (1, tp_nt_fone (tp_fone('81', '55555555'), tp_fone('81', '66666666')));

INSERT INTO tb_lista_fones_departamento VALUES (tp_lista_fones_Departamento (1, tp_nt_fone (tp_fone('81', '55555555'),tp_fone('81', '66666666'))));

