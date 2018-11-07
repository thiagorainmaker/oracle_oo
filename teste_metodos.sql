
-- arquivo de teste de metodos
-- os testes só devem ser executados depois da criação do banco e da carga inicial

-- teste método que retorna as matérias ordenadas por data
-- usando MAP
SELECT a.manchete, a.data_escrita FROM tab_materia a ORDER BY a.lista_por_data();

-- busca o diretor executivo com o id = 1 e exibe nome e data de admissão
DECLARE
	de tp_diretor_executivo;
BEGIN
	SELECT VALUE(p) INTO de FROM tab_diretor_executivo p WHERE p.id = 1;
	de.exibir_detalhes();
END;


-- bloco de código que compara duas edições e diz qual tem o maior valor
-- exemplo de uso de ORDER

DECLARE
    ed tp_edicao;
    n number;
BEGIN 
    SELECT VALUE(p) INTO ed FROM tab_edicao p WHERE p.cod = 1;
    SELECT d.func_order(ed) INTO n FROM tab_edicao d  WHERE d.cod = 2;
    IF n > 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Valor da edição n° 1 é maior que da edição 2 ' );
    END IF;
    IF n = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Valor da edição n° 1 é igual o da edição 2 ' );
    END IF;
    IF n < 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Valor da edição n° 1 é menor que da edição 2 ' );
    END IF;
END; 



-- chama a função q calcula o salário anual de dos funcionários
-- função herdada de funcionário para jornalista
select g.salario_anual()  from tab_jornalista g where g.id = 1;

-- chama a função sobre escrita herdada de funcionário
-- calculando o salário e adicionando 5000.00
select g.salario_anual()  from tab_diretor_executivo g where g.id = 1;



-- teste de construtores sobrecarregados
insert into tab_localizacao values(tp_localizacao('74310270')); 
insert into tab_localizacao values(tp_localizacao('74310270', 'Goiás'));
insert into tab_localizacao values (tp_localizacao(1000, '1297 Via Cola di Rie','00989','Roma', ''));

-- teste sobreescrita construtor
insert into tab_pessoa_fisica values(tp_pessoa_fisica(tp_cliente(500, null, null)));










