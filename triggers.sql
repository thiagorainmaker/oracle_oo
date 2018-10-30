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
