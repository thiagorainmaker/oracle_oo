-- TRIGGER que impede a edição do texto de uma matéria apos a sua aprovação
-- para testar a trigger primeiro execute o código de criação da trigger

CREATE OR REPLACE TRIGGER trg_aprovacao_materia
  BEFORE UPDATE OF texto ON TAB_MATERIA
    FOR EACH ROW
    BEGIN
        IF :NEW.data_aprovacao IS NOT NULL THEN
           Raise_application_error(-20324,'Materia já aprovada - não é possível alterar o texto' || 'Operação cancelada');
        END IF;
    END;


-- apos a criação da trigger, rode os inserts com dados de teste.
-- observe que o único dado relevante para o teste é a data de aprovação da matéria

insert into tab_materia values ( TP_MATERIA(500, null, null, null, null,
TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), null, null, null,null, null));
        
insert into tab_materia values ( TP_MATERIA(501, null, null, null, null,
null, null, null, null,null, null));
        
    
-- apos inserir os dados de teste rode os dois comandos SQL 
-- o primeiro, que altera a matéria com cod = 501 vai funcionar sem problemas
-- o segundo sera impedido de executar, pois a matéria já foi aprovada, e segundo a nossa regra 
-- o texto não deve mais ser alterado

update tab_materia m set m.texto = 'blá blá blá' where cod = 501;
update tab_materia m set m.texto = 'blá blá blá' where cod = 500;

-----------------------------------------------------------------------------------------------------------------------------------


-- trigger responsavel por manter sempre como supervisor dos jornalistas o diretor executivo com mais tempo de casa
-- para testar a triguer primeiro execute o código de criação da trigger

CREATE OR REPLACE TRIGGER verifica_diretor_executivo
AFTER  INSERT OR DELETE OR UPDATE ON tab_diretor_executivo
DECLARE
    v_sup TP_DIRETOR_EXECUTIVO;
BEGIN
   UPDATE tab_jornalista j SET j.supervisor = (  select REF(T) from tab_diretor_executivo t where data_admissao IN (select min(t1.data_admissao)  from tab_diretor_executivo t1 ) );
END;

-- em seguida faça uma consulta no diretor executivo dos jornalistas
-- logo apos rodar o script de insert o diretor executivo vai ser o João das neves
select t.supervisor.nome from tab_jornalista t

-- para disparar a trigger basta fazer um insert de um diretor executivo com mais tempo de casa
insert into tab_diretor_executivo values (
tp_diretor_executivo(
	100, 
	'Gustavo Batista', 
	TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, 
	'00103841111',  
	TO_DATE('2001/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 1), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 1),
	NULL,
	NULL,
	NULL
));

-- execute novamente a consulta e observe que o supervisor dos jornalista agora é o Gustavo Batista
select t.supervisor.nome from tab_jornalista t




