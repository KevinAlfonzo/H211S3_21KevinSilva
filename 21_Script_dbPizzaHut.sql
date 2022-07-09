USE MASTER
GO
ALTER DATABASE dbPizzaHut
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE dbPizzaHut
GO

USE master;

/* Creamos la DB dbPizzaHut */
CREATE DATABASE dbPizzaHut;

/* Ponemos en uso dbPizzaHut */
USE dbPizzaHut;

-- Creamos la tabla CLIENTE
CREATE TABLE CLIENTE (
    IDCLI int  NOT NULL IDENTITY(1,1),
    NOMCLI varchar(30)  NOT NULL,
    APECLI varchar(30)  NOT NULL,
    DNICLI char(8)  NOT NULL,
    CELCLI char(9)  NOT NULL,
    DIRCLI varchar(50)  NOT NULL,
	ESTCLI char(1) NOT NULL ,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (IDCLI)
);

-- Creamos la tabla DESPACHADOR
CREATE TABLE DESPACHADOR (
    IDDESP int  NOT NULL IDENTITY(1,1),
    NOMDESP varchar(30)  NOT NULL,
    APEDESP varchar(30)  NOT NULL,
    DNIDESP char(8)  NOT NULL,
    CELDESP char(9)  NOT NULL,
    DIRDESP varchar(50)  NOT NULL,
    IDJEFSUC int  NOT NULL,
    IDSUC int  NOT NULL,
	ESTDESP char(1) NOT NULL ,
    CONSTRAINT DESPACHADOR_pk PRIMARY KEY  (IDDESP)
);

-- Creamos la tabla JEFE_SUCURSAL
CREATE TABLE JEFE_SUCURSAL (
    IDJEFSUC int  NOT NULL IDENTITY(1,1),
    NOMJEFSUC varchar(30)  NOT NULL,
    APEJEFSUC varchar(30)  NOT NULL,
    DNIJEFSUC char(8)  NOT NULL,
    CELJEFSUC char(9)  NOT NULL,
    DIRJEFSUC varchar(50)  NOT NULL,
	ESTJEFSUC char(1) NOT NULL ,
    CONSTRAINT JEFE_SUCURSAL_pk PRIMARY KEY  (IDJEFSUC)
);

-- Creamos la tabla PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int  NOT NULL IDENTITY(1,1),
    NOMPRO varchar(30)  NOT NULL,
    PREPRO decimal(10,2)  NOT NULL,
    STOPRO int  NOT NULL,
	ESTPRO char(1) NOT NULL ,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY  (IDPRO)
);

-- Creamos la tabla SUCURSAL
CREATE TABLE SUCURSAL (
    IDSUC int  NOT NULL IDENTITY(1,1),
    NOMSUC varchar(30)  NOT NULL,
    DIRSUC varchar(50)  NOT NULL,
    IDJEFSUC int  NOT NULL,
	ESTSUC char(1) NOT NULL ,
    CONSTRAINT SUCURSAL_pk PRIMARY KEY  (IDSUC)
);

-- Creamos la tabla VENDEDOR
CREATE TABLE VENDEDOR (
    IDVEND int  NOT NULL IDENTITY(1,1),
    NOMVEND varchar(30)  NOT NULL,
    APEVEND varchar(30)  NOT NULL,
    DNIVEND char(8)  NOT NULL,
    CELVEND char(9)  NOT NULL,
    DIRVEND varchar(50)  NOT NULL,
    IDJEFSUC int  NOT NULL,
    IDSUC int  NOT NULL,
	ESTVEND char(1) NOT NULL ,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY  (IDVEND)
);

-- Creamos la tabla VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL IDENTITY(1,1),
    FECVEN date  NOT NULL,
    IDCLI int  NOT NULL,
    IDVEND int  NOT NULL,
    IDSUC int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVEN)
);

-- Creamos la tabla VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET int  NOT NULL IDENTITY(1,1),
    PRETOTVENDET decimal(10,2)  NOT NULL,
    IDPRO int  NOT NULL,
    IDVEN int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY  (IDVENDET)
);


-- Reference: DESPACHADOR_JEFE_SUCURSAL (table: DESPACHADOR)
ALTER TABLE DESPACHADOR ADD CONSTRAINT DESPACHADOR_JEFE_SUCURSAL
    FOREIGN KEY (IDJEFSUC)
    REFERENCES JEFE_SUCURSAL (IDJEFSUC);

-- Reference: DESPACHADOR_SUCURSAL (table: DESPACHADOR)
ALTER TABLE DESPACHADOR ADD CONSTRAINT DESPACHADOR_SUCURSAL
    FOREIGN KEY (IDSUC)
    REFERENCES SUCURSAL (IDSUC);

-- Reference: SUCURSAL_JEFE_SUCURSAL (table: SUCURSAL)
ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_JEFE_SUCURSAL
    FOREIGN KEY (IDJEFSUC)
    REFERENCES JEFE_SUCURSAL (IDJEFSUC);

-- Reference: VENDEDOR_JEFE_SUCURSAL (table: VENDEDOR)
ALTER TABLE VENDEDOR ADD CONSTRAINT VENDEDOR_JEFE_SUCURSAL
    FOREIGN KEY (IDJEFSUC)
    REFERENCES JEFE_SUCURSAL (IDJEFSUC);

-- Reference: VENDEDOR_SUCURSAL (table: VENDEDOR)
ALTER TABLE VENDEDOR ADD CONSTRAINT VENDEDOR_SUCURSAL
    FOREIGN KEY (IDSUC)
    REFERENCES SUCURSAL (IDSUC);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI);

-- Reference: VENTA_DETALLE_PRODUCTO (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (IDPRO)
    REFERENCES PRODUCTO (IDPRO);

-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVEN)
    REFERENCES VENTA (IDVEN);

-- Reference: VENTA_SUCURSAL (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_SUCURSAL
    FOREIGN KEY (IDSUC)
    REFERENCES SUCURSAL (IDSUC);

-- Reference: VENTA_VENDEDOR (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR
    FOREIGN KEY (IDVEND)
    REFERENCES VENDEDOR (IDVEND);

-- Inserción de datos en la tabla JEFE_SUCURSAL
INSERT INTO JEFE_SUCURSAL
(NOMJEFSUC, APEJEFSUC, DNIJEFSUC, CELJEFSUC, DIRJEFSUC, ESTJEFSUC) VALUES
('Kevin', 'Farre Ibañez', '83202843', '981482733', 'Av. Los Portales', 'A'),
('Amaya', 'Herrera Torres', '48647729', '980793259', 'Jr. Benavides', 'A'),
('Jose', 'Arce Rios', '67529079', '913920567', 'Fundo Santa Adela', 'A'),
('Pedro', 'Leon Pozo', '15904225', '997345618', 'Av. La Mar', 'A'),
('Samir', 'Mata Andreu', '20894758', '918097412', 'Jr. Ohiggins', 'A'),
('Rosario', 'Vega Porras', '31348000', '904696742', 'Av. Ayacucho', 'A'),
('Enrique', 'Bonet Calderon', '17918519', '954198750', 'Jr. Manchego Muñoz', 'A'),
('Carlos', 'Carrera Aguirre', '31592681', '907216058', 'Av. Miguel Grau', 'A'),
('Santiago', 'Viera Valle', '57991125', '923382067', 'Fundo Los Reyes', 'A'),
('Cristina', 'Gonzales Peralta', '36937739', '908527493', 'Av. Libertadores', 'A');


-- Inserción de datos en la tabla SUCURSAL
INSERT INTO SUCURSAL
(NOMSUC, DIRSUC, IDJEFSUC, ESTSUC) VALUES
('PizzaHut San Vicente', 'Av. Los Portales', '1', 'A'),
('PizzaHut Imperial', 'Jr. Benavides', '2', 'A'),
('PizzaHut Nuevo Imperial', 'Av. La Mar', '3', 'A'),
('PizzaHut Surco', 'Jr. Ohiggins', '4', 'A'),
('PizzaHut Barranco', 'Jr. Manchego Muñoz', '5', 'A'),
('PizzaHut Miraflores', 'Av. Libertadores', '6', 'A'),
('PizzaHut Cerro Azul', 'Fundo Los Reyes', '7', 'A'),
('PizzaHut Quilmana', 'Av. Ayacucho', '8', 'A'),
('PizzaHut Asia', 'Av. Miguel Grau', '9', 'A'),
('PizzaHut Chilca', 'Fundo Santa Adela', '10', 'A');


-- Inserción de datos en la tabla VENDEDOR
INSERT INTO VENDEDOR
(NOMVEND, APEVEND, DNIVEND, CELVEND, DIRVEND, IDSUC, IDJEFSUC, ESTVEND) VALUES
('Rafaela', 'Carrera Villar', '46537434', '976134894', 'Av. Los Precursores', '6', '1', 'A'),
('Rocio', 'Garrido Naupari', '16036352', '942391198', 'Jr. Los Cerezos', '1', '6', 'A'),
('Marcos', 'Jimenez Gascon', '25267000', '941599854', 'Av. Las Rocas', '7', '2', 'A'),
('Marina', 'Puente Sierra', '39164717', '941364844', 'Av. Benavides', '2', '7', 'A'),
('Gonzalo', 'Garca Cañas', '50961664', '926756876', 'Jr. Aviación', '8', '3', 'A'),
('Angelina', 'Grande Campos', '70400037', '980230125', 'Av. Peú', '3', '8', 'A'),
('Felipe', 'Cardenas Corrales', '47730657', '920867241', 'Jr. Venezuela', '9', '4', 'A'),
('Jose', 'Sevilla Trinidad', '39884971', '969335922', 'Av. Brazil', '4', '9', 'A'),
('Rosa', 'LaTorre Canovas', '37567508', '934068180', 'Jr. Los Portales', '10', '5', 'A'),
('Diego', 'Valles Gales', '52486169', '969455280', 'Fundo Almenares', '5', '10', 'A');


-- Inserción de datos en la tabla DESPACHADOR
INSERT INTO DESPACHADOR
(NOMDESP, APEDESP, DNIDESP, CELDESP, DIRDESP, IDSUC, IDJEFSUC, ESTDESP) VALUES
('Marco', 'Amado Vargas', '15791640', '923904644', 'Av. Miraflores', '5', '1', 'A'),
('Antonio', 'Aragon Aitana', '45653643', '924944264', 'Jr. Los Portales', '8', '2', 'A'),
('Sara', 'Cordon', '63100086', '905718449', 'Fundo Las Rocas', '1', '3', 'A'),
('Gustavo', 'Murcia Moyano', '45604184', '907907361', 'Fundo Santa Luisa', '6', '4', 'A'),
('Maria', 'Aguirre Saldaña', '49394859', '900405822', 'Av. Benavides', '2', '5', 'A'),
('Angela', 'Costas Rose', '14580901', '973544499', 'Jr. Los Cerezos', '10', '6', 'A'),
('Airan', 'Coronel Zegarra', '19503164', '954045881', 'Av. Carrisales', '3', '7', 'A'),
('Francisco', 'Melendes Gutierres', '82017956', '911751343', 'Jr. Los Duraznos', '7', '8', 'A'),
('Marcela', 'Torregrosa Vereau', '42363722', '942097546', 'Av. La Mar', '4', '9', 'A'),
('Pedro', 'Sancho Aparicio', '13904964', '990304893', 'Jr. Ohiggins', '9', '10', 'A');


-- Inserción de datos en la tabla CLIENTE
INSERT INTO CLIENTE
(NOMCLI, APECLI, DNICLI, CELCLI, DIRCLI, ESTCLI) VALUES
('Samuel', 'Leyva Luque', '35278477', '949707118', 'Av. Los Portales', 'A'),
('Dylan', 'Araujo Casas', '65644387', '925406091', 'Jr. El Porvenir', 'A'),
('Elena', 'Portales Camacho', '50343635', '970906867', 'Av. Argentina', 'A'),
('Pedro', 'Nogales Moron', '55558175', '990270082', 'Jr. 28 de Julio', 'A'),
('Marcelo', 'Samaniego Ciprian', '12609264', '901852551', 'Av. Primavera', 'A'),
('Luis', 'Valeriano Girado', '23308432', '924414100', 'Fundo Camacho', 'A'),
('Abraham', 'Tudela Acedo', '36352807', '948676775', 'Jr. Los Manzanos', 'A'),
('Gemma', 'Barroso Becerra', '15216577', '980875031', 'Av. Grau', 'A'),
('Olga', 'Sola Simon', '94965205', '954506916', 'Fundo Las Rocas', 'A'),
('Ignacio', 'Lima Sanchez', '49330965', '924982669', 'Av. Asia', 'A');
select * from CLIENTE;

-- Inserción de datos en la tabla PRODUCTO
INSERT INTO PRODUCTO
(NOMPRO, PREPRO, STOPRO, ESTPRO) VALUES 
('Pizza con Piña', '20', '50', 'A'),
('Pizza Familiar', '30', '50', 'A'),
('Pizza Carnivora', '35', '40', 'A'),
('Pizza con Peperoni', '30', '55', 'A'),
('Pizza FullChesse', '40', '45', 'A'),
('Pizza Italiana', '40', '50', 'A'),
('Pizza Vegana', '30', '50', 'A'),
('Pizza Francesa', '35', '40', 'A'),
('Pizza con Jamón', '35', '40', 'A'),
('Pizza Mundial', '40', '55', 'A');



SET DATEFORMAT dmy;
-- Insercion de datos
INSERT INTO VENTA
(FECVEN, IDCLI, IDVEND, IDSUC) VALUES
('07-08-2022', '9' , '8', '7'),
('05-08-2022', '2' , '2', '2'),
('03-08-2022', '3' , '3', '3'),
('01-08-2022', '4' , '4', '4'),
('06-08-2022', '5' , '5', '5'),
('04-08-2022', '6' , '6', '6'),
('02-08-2022', '7' , '7', '7'),
('01-08-2022', '8' , '8', '8'),
('05-08-2022', '9' , '9', '9'),
('07-08-2022', '10' , '10', '10');


INSERT INTO VENTA_DETALLE
(IDPRO, IDVEN, PRETOTVENDET) VALUES 
('1', '1', '100'),
('2', '2', '75'),
('3', '3', '50'),
('4', '4', '25'),
('5', '5', '65'),
('6', '6', '45'),
('7', '7', '55'),
('8', '8', '35'),
('9', '9', '60');
/*
-- SP inserción de Venta
CREATE PROCEDURE spInsertVenta
(
	@IDVEN INT,
	@FECVEN DATE,
	@IDCLI INT,
	@IDVEND INT,
	@IDSUC INT
)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRAN
	BEGIN TRY
		IF (SELECT COUNT (*) FROM VENTA WHERE VENTA.IDVEN = @IDVEN) = 1
		ROLLBACK TRAN;
		ELSE
		INSERT INTO VENTA
		(IDVEN, FECVEN, IDCLI, IDVEND, IDSUC) VALUES
		(@IDVEN, @FECVEN, @IDCLI, @IDVEND, @IDSUC)
		COMMIT TRAN
	END TRY 
	BEGIN CATCH
		SELECT 'Esta venta ya ha sido registrada' AS ERROR
		IF @@TRANCOUNT > 0 ROLLBACK TRAN
	END CATCH
END
GO
*/