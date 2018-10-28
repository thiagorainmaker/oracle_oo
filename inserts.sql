
insert into tab_contato values(tp_contato(1, '6666666', '9999999'));
insert into tab_contato values(tp_contato(2, '6666666', '9999999'));
insert into tab_contato values(tp_contato(3, '6666666', '9999999'));

insert into tab_endereco values(tp_endereco(1, '78555', 'AV', '456'));
insert into tab_endereco values(tp_endereco(2, '78555', 'RUA', '456'));
insert into tab_endereco values(tp_endereco(3, '78555', 'RUA', '456'));

insert into tab_diretor_executivo values (
tp_diretor_executivo(1, 'João das neves', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '', '', 
	'' , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 1), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 1),
	NULL
));




insert into TAB_FOTOGRAFO values (
TP_FOTOGRAFO(1, 'João das neves', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),
	666555, '', '', 
	'' , 
	(SELECT REF(P) FROM tab_contato P WHERE cod = 1), 
	(SELECT REF(P) FROM tab_endereco P WHERE cod = 1),
	((SELECT REF(P) FROM tab_diretor_executivo P WHERE id = 1))
));





-- INSERT DE REVENDEDORES


insert into tab_diretor_executivo values('João das neves', TO_DATE('1989/01/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 666555, '123123123', 'Direção', TO_DATE('2015/03/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), tp_contato('6666666', '7777777'), tp_endereco('7444444', 'Rual tal casa tal', '456456456') )



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

