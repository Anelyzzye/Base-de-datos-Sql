CREATE DATABASE citas;
USE citas;

// primero creamos las tablas que NO hacen referencia a otras tablas

CREATE TABLE estado(
idestado INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
estado VARCHAR(15) NOT NULL
);

//Posteriormente las tablas que hacen referencia a las tablas que ya hemos creado

CREATE TABLE oficinas(
idoficinas INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombreoficinas VARCHAR(20) NOT NULL,
estatus VARCHAR(10) NOT NULL,
idestado INT NOT NULL,
CONSTRAINT c_estado FOREIGN KEY (idestado) REFERENCES
estado(idestado));

// inportante NO olvidar poner el PRIMARY KEY al id que es el identificador NO te dejara crear la tabla
// recuerda poner el campo antes de hacer la referencia

CREATE TABLE tipo_tramite(
idtipotramite INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipotramite VARCHAR(20) NOT NULL,
documento VARCHAR(20) NOT NULL,
idoficinas INT NOT NULL,
CONSTRAINT o_oficinas FOREIGN KEY (idoficinas) REFERENCES
oficinas(idoficinas) 
);

CREATE TABLE usuario(
idusuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
usuario VARCHAR(20) NOT NULL,
pass VARCHAR(20)NOT NULL);

CREATE TABLE identificacion(
id_identifica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo_identificación VARCHAR(20) NOT NULL,
clave_identificación VARCHAR(20) NOT NULL);

CREATE TABLE titular(
idtitular INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
titularnombre VARCHAR(20)NOT NULL,
titular_apaterno VARCHAR(20)NOT NULL,
titular_mpaterno VARCHAR(20) NOT NULL,
fecha_nacimiento DATE NOT NULL,
estatus BOOLEAN,
id_identifica INT NOT NULL,
CONSTRAINT i_identificacion FOREIGN KEY (id_identifica) REFERENCES
identificacion(id_identifica));

CREATE TABLE citas(
idcitas INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
horario VARCHAR(20)NOT NULL,
fecha DATE NOT NULL,
telefono VARCHAR(20)NOT NULL,
email VARCHAR(30) NOT NULL,
idtipotramite INT NOT NULL,
idusuario INT NOT NULL,
idtitular INT NOT NULL,
CONSTRAINT t_tipo_tramite FOREIGN KEY (idtipotramite) REFERENCES
tipo_tramite(idtipotramite),
CONSTRAINT u_usuario FOREIGN KEY (idusuario) REFERENCES
usuario(idusuario),
CONSTRAINT l_titular FOREIGN KEY (idtitular) REFERENCES
titular(idtitular)
);