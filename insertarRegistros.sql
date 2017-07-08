-- En este ejercio, se ingresan registros --
-- Misma BD  --

USE agencia;

INSERT INTO cliente(idcliente,nombrecliente,ciudadcliente) VALUES (10026,"Juan","Toluca");
-- Al ingresar los datos en varchar utilizar comillas dobles--
-- Omitir la falta de ortografia :/--
INSERT INTO marca(idmarca,nombremarca)VALUES (139,"Marcaejemplo");
INSERT INTO coche(idcoche,nombrecoche,idmarca,color,modelo) VALUES (211,"fulanito",139,"Azul","21");
INSERT INTO consesionario(idconsesionario,nombreconsesionario,ciudadconsesionario) VALUES (50,"Ficticio","Toluca");
INSERT INTO ventas(idventa,idcoche,idcliente,idconsesionario) VALUES (34001,211,10026,50);
