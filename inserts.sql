
-- INSERT DE FUNCIONARIOS

insert into tab_contato values(tp_contato(1, '6666666', '9999999'));
insert into tab_contato values(tp_contato(2, '6666666', '9999999'));
insert into tab_contato values(tp_contato(3, '6666666', '9999999'));
insert into tab_contato values(tp_contato(4, '6666666', '9999999'));
insert into tab_contato values(tp_contato(5, '6666666', '9999999'));

insert into tab_endereco values(tp_endereco(1, '78555', 'AV', '456'));
insert into tab_endereco values(tp_endereco(2, '78555', 'RUA', '456'));
insert into tab_endereco values(tp_endereco(3, '78555', 'RUA', '456'));
insert into tab_endereco values(tp_endereco(4, '78555', 'RUA', '456'));
insert into tab_endereco values(tp_endereco(5, '78555', 'RUA', '456'));

insert into tab_diretor_executivo values (
tp_diretor_executivo(1, 'João das neves', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '', '', 
	'' , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 1), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 1),
	NULL,
	NULL
));

insert into TAB_FOTOGRAFO values (
TP_FOTOGRAFO(1, 'João das neves', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '', '', 
	'' , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 5), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 5),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1))
));

insert into tab_diagramador values (
TP_diagramador(1, 'Gustavo Fernandes', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '', '', 
	'' , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 2), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 2),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1))
));



insert into tab_editor values (
TP_editor(1, 'MARIA DE SOUSA', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '', '', 
	'' , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 3), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 3),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1))
));


insert into tab_JORNALISTA values (
TP_JORNALISTA(1, 'JULIANA AMORIN', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '', '', 
	'' , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 4), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 4),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1))
));
-- INSERT DE MATÉRIA

insert into TAB_MATERIA values(
TP_MATERIA(1, 'LEAD DA MATÉRIA', 'MANCHETE - TEXTO EM DESTAQUE', 'TEXTO ALEATÓRIO DA MATÉRIA ...', 'TÍTULO GENÉRICO', 
TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
));


insert into TAB_MATERIA values(
TP_MATERIA(2, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 2', 'TEXTO ALEATÓRIO DA MATÉRIA ... 2 ', 'TÍTULO GENÉRICO 2 ', 
TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
));




insert into TAB_MATERIA values(
TP_MATERIA(3, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
));


insert into TAB_MATERIA values(
TP_MATERIA(4, 'LEAD DA MATÉRIA 4', 'MANCHETE - TEXTO EM DESTAQUE 4', 'TEXTO ALEATÓRIO DA MATÉRIA ... 4 ', 'TÍTULO GENÉRICO 4 ', 
TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
));

-- CADERNO TEMÁTICO

insert into tab_caderno_tematico values ( tp_caderno_tematico('descrição genérica', 'tema genérico', 
TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
(SELECT REF(P) FROM tab_diagramador P WHERE id = 1), tp_nt_materias(

        TP_MATERIA(5, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
        tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
        TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
        ), 
        
        TP_MATERIA(6, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
        tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
        TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
        ), 
        
        TP_MATERIA(7, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
        tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
        TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
        ))
));

-- INSERT ANUNCIO

INSERT INTO TAB_ANUNCIO VALUES (tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60));

-- INSERT DE EDIÇÃO 

insert into tab_edicao values (
    tp_edicao(
        5.20, 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
        (SELECT REF(P) FROM tab_diretor_executivo P WHERE ID = 1) ,
        tp_cadernos(
                    tp_caderno_tematico('descrição genérica', 'tema genérico', 
                    TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                    (SELECT REF(P) FROM tab_diagramador P WHERE id = 1), 
                    tp_nt_materias(
                         TP_MATERIA(8, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
                        TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
                        ), 
                         TP_MATERIA(9, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
                        TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
                        ), 
                         TP_MATERIA(10, 'LEAD DA MATÉRIA 2', 'MANCHETE - TEXTO EM DESTAQUE 3', 'TEXTO ALEATÓRIO DA MATÉRIA ... 3 ', 'TÍTULO GENÉRICO 3 ', 
                        TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_editor P WHERE ID = 1), 
                        TO_DATE('2016/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
                        (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1), 
                        tp_qualificador(1, 2, TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), (SELECT REF(P) FROM tab_editor P WHERE ID = 1)),
                        TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
                        )
                    
                    ))),
        tp_nt_anuncios(
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60), 
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60), 
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60), 
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60), 
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60), 
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60), 
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60)
        )
        
        ));

-- INSERT DE FOTOGRAFIA

INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 1,
    TO_DATE( '2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    'DESCRIÇÃO DA IMG', 
     NULL, 
    'LOCAL DA FOTO', 
    TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 1))
);



INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 2,
    TO_DATE( '2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    'DESCRIÇÃO DA IMG', 
     NULL, 
    'LOCAL DA FOTO', 
    TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 1))
);



INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 3,
    TO_DATE( '2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    'DESCRIÇÃO DA IMG', 
     NULL, 
    'LOCAL DA FOTO', 
    TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 1))
);


INSERT INTO tab_fotografia VALUES( 
    tp_fotografia( 4,
    TO_DATE( '2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    'DESCRIÇÃO DA IMG', 
     NULL, 
    'LOCAL DA FOTO', 
    TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    (SELECT REF(P) FROM tab_fotografo P WHERE ID = 1))
);

-- INSERT ESCOLHA

INSERT INTO tab_escolhe VALUES(
    (SELECT REF(P) FROM tab_fotografia P WHERE cod = 1),
    TO_DATE('2017/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
    (SELECT REF(P) FROM tab_materia P WHERE cod = 1),
    (SELECT REF(P) FROM tab_jornalista P WHERE ID = 1)
);

-- INSERT DE CLIENTES - PESSOAS FÍSICAS E JURIDICAS
insert into tab_contato values(tp_contato(7, '6666666', '9999999'));
insert into tab_endereco values(tp_endereco(7, '78555', 'RUA', '456'));
insert into tab_contato values(tp_contato(8, '666456666', '9999454999'));
insert into tab_endereco values(tp_endereco(8, '78555', 'RUA', '456'));


insert into TAB_PESSOA_FISICA values( Tp_PESSOA_FISICA(1, (SELECT REF(P) FROM tab_contato P WHERE cod = 7), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 7),'14561111111', '145646111111') );
	

insert into TAB_PESSOA_juridica values( Tp_PESSOA_juridica(1, (SELECT REF(P) FROM tab_contato P WHERE cod = 7), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 7),'14561111111', '145646111111') );
	

-- INSERT COMPRAS

insert into tab_compra values (
    tp_compra(
        TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        'texto genérico', 
        250.25,
        (SELECT REF(P) FROM TAB_PESSOA_FISICA P WHERE id = 1), 
        tp_nt_anuncios(
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60),
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60),
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60),
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60),
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60)
        )
    )
);


insert into tab_compra values (
    tp_compra(
        TO_DATE('2017/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 
        'texto genérico', 
        250.25,
        (SELECT REF(P) FROM TAB_PESSOA_juridica P WHERE id = 1), 
        tp_nt_anuncios(
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60),
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60),
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60),
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60),
            tp_anuncio('10X10', 'TEXTO ANUNCIO', 'TÍTULO ANUNCIO', 58.60)
        )
    )
);

-- INSERT DE REVENDEDORES


insert into TAB_REVENDEDOR values(TP_REVENDEDOR('6666666', 'LOJA DO ZÉ', 
nt_tp_paises( 
    tp_pais('ITÁLIA', nt_tp_localizacao(
        tp_localizacao(1000, '1297 Via Cola di Rie','00989','Roma', ''),
        tp_localizacao(1100, '93091 Calle della Testa','10934','Venice','')
    )), 
    tp_pais('SUIÇA', nt_tp_localizacao(
        tp_localizacao(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve'),
        tp_localizacao(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE')
    )), 
    tp_pais('United Kingdom', nt_tp_localizacao(
        tp_localizacao(2400, '8204 Arthur St', '', 'London', 'London'),
        tp_localizacao(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford')
    ))
    )
));


insert into TAB_REVENDEDOR values(TP_REVENDEDOR('8888888', 'LOJA DO JOÃO', 
nt_tp_paises( 
    tp_pais('BRASIL', nt_tp_localizacao(
        tp_localizacao(1000, '1297 Via Cola di Rie','00989','Roma', ''),
        tp_localizacao(1100, '93091 Calle della Testa','10934','Venice','')
    )), 
    tp_pais('RUSSIA', nt_tp_localizacao(
        tp_localizacao(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve'),
        tp_localizacao(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE')
    )), 
    tp_pais('United Kingdom', nt_tp_localizacao(
        tp_localizacao(2400, '8204 Arthur St', '', 'London', 'London'),
        tp_localizacao(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford')
    ))
    )
));




insert into TAB_REVENDEDOR values(TP_REVENDEDOR('9999999', 'BANQUINHA GLOBO', 
nt_tp_paises( 
    tp_pais('INDIA', nt_tp_localizacao(
        tp_localizacao(1000, '1297 Via Cola di Rie','00989','Roma', ''),
        tp_localizacao(1100, '93091 Calle della Testa','10934','Venice','')
    )), 
    tp_pais('CHILE', nt_tp_localizacao(
        tp_localizacao(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve'),
        tp_localizacao(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE')
    )), 
    tp_pais('MÉXICO', nt_tp_localizacao(
        tp_localizacao(2400, '8204 Arthur St', '', 'London', 'London'),
        tp_localizacao(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford')
    ))
    )
));

