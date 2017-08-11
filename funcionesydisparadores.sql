CREATE DATABASE Atest;
USE Atest;

CREATE TABLE record(
idrecord INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombreparticipante VARCHAR(30) NOT NULL,
record1 INT(10) NOT NULL,
record2 INT(10) NOT NULL,
record3 INT(10) NOT NULL,
record4 INT(10) NOT NULL,
categoria VARCHAR(30) NOT NULL,
total INT(10)NOT NULL 
)ENGINE=INNODB;


DELIMITER $$
CREATE FUNCTION sumapuntaje(a INT(10),b INT(10),c INT(10),d INT(10))RETURNS INT(10)
BEGIN
DECLARE sumatotal INT;
SET sumatotal = (a+b+c+d);
RETURN sumatotal;
END;
$$

SELECT sumapuntaje(150,360,271,200)


DELIMITER $$
CREATE FUNCTION mensajepuntaje(resultado INT(10))RETURNS VARCHAR(20)
BEGIN
DECLARE mensaje VARCHAR(20);
IF (resultado < 500) THEN
SET mensaje = "Bronze";
RETURN mensaje;
END IF;
END;
$$

SELECT mensajepuntaje(200)

DELIMITER $$
CREATE FUNCTION mensajes(resultado INT(10))RETURNS VARCHAR(20)
BEGIN
DECLARE mensaje VARCHAR(20);
IF (resultado < 501) THEN
SET mensaje = "Bronze";
ELSEIF (resultado > 501) THEN
SET mensaje = "Silver";
ELSEIF (resultado < 800) THEN
SET mensaje = "Silver";
ELSEIF (resultado > 801) THEN
SET mensaje = "Golden";
ELSEIF (resultado < 1001) THEN
SET mensaje = "Golden";
END IF;
RETURN mensaje;
END;
$$

SELECT mensajes(400)

DELIMITER $$
CREATE TRIGGER eldispara BEFORE INSERT ON record
FOR EACH ROW 
BEGIN
SET new.total=(SELECT sumapuntaje(new.record1,new.record2,new.record3,new.record4));
SET new.categoria=(SELECT mensajes(new.total));
END;
$$









