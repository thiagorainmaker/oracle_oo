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

