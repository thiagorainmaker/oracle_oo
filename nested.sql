CREATE OR REPLACE TYPE tp_carro AS OBJECT (
    nome VARCHAR2(8)
);

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    nome VARCHAR2(8)
);

CREATE TYPE tp_nt_carros AS TABLE OF tp_carro;


CREATE TABLE tb_lista_carros(
    lista_carros tp_nt_carros)
NESTED TABLE lista_carros STORE AS tb_l_carros;

ALTER TYPE tp_pessoa ADD ATTRIBUTE carros tp_nt_carros CASCADE;  

---------------------------------------------------------------------------------------------
CREATE OR REPLACE TYPE tp_fone AS OBJECT (
cod_area VARCHAR2(2),
numero
VARCHAR2(8));

CREATE TYPE tp_nt_fone AS TABLE OF tp_fone;

CREATE TABLE tb_lista_fone_departamento(
    cod_depto NUMBER(5),
    lista_fone tp_nt_fone)
NESTED TABLE lista_fone STORE AS tb_lista_fone;


INSERT INTO tb_lista_fone_departamento VALUES (1, tp_nt_fone (tp_fone('81', '55555555'), tp_fone('81', '66666666')));

SELECT * FROM tb_lista_fone_departamento;


CREATE OR REPLACE TYPE tp_lista_fones_Departamento AS OBJECT( cod_depto NUMBER(5), lista_fones tp_nt_fone);

CREATE TABLE tb_lista_fones_Departamento OF tp_lista_fones_departamento NESTED TABLE lista_fones STORE AS tb_lista_fones;

