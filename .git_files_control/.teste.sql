
-- arquivo de teste de metodos
-- os testes só devem ser executados depois da criação do banco e da carga inicial

-- teste método que retorna as matérias ordenadas por data
SELECT a.manchete, a.data_escrita FROM tab_materia a ORDER BY a.lista_por_data();



DECLARE
	de tp_diretor_executivo;
BEGIN
	SELECT VALUE(p) INTO de FROM tp_diretor_executivo p WHERE p.id = 1;
	de.exibir_detalhes();
END;


