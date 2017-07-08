CREATE DATABASE agencia;
USE agencia;

CREATE TABLE marca(
idmarca INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombremarca VARCHAR(30)
)ENGINE = INNODB ;

CREATE TABLE cliente(
idcliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombrecliente VARCHAR (30) NOT NULL,
ciudadcliente VARCHAR (30) NOT NULL
)ENGINE = INNODB;

CREATE TABLE consecionario(
idconsesionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombreconsesionario VARCHAR (30) NOT NULL,
ciudadconsesionario VARCHAR (30) NOT NULL
)ENGINE = INNODB;

CREATE TABLE coche(
idcoche INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombrecoche VARCHAR (30) NOT NULL,
idmarca INT,
color VARCHAR(30) NOT NULL,
modelo VARCHAR(30),
CONSTRAINT a_marcar FOREIGN KEY (idmarca) REFERENCES
marca (idmarca)
)ENGINE =INNODB;

CREATE TABLE ventas(
idventa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idcoche INT,
idcliente INT,
idconsesionario INT,
CONSTRAINT b_coche FOREIGN KEY (idcoche) REFERENCES
coche(idcoche),
CONSTRAINT b_cliente FOREIGN KEY (idcliente) REFERENCES
cliente(idcliente),
CONSTRAINT b_consecionario FOREIGN KEY (idconsesionario) REFERENCES
consecionario (idconsesionario)
)ENGINE = INNODB;

