USE master
GO 

CREATE DATABASE dbPizzaHutt
GO

USE dbPizzaHutt
GO 

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    IDCLI int  NOT NULL IDENTITY(1, 1),
    NOMCLI varchar(30)  NOT NULL,
    APECLI varchar(30)  NOT NULL,
    DNICLI char(8)  NOT NULL,
    CELCLI char(9)  NOT NULL,
    DIRCLI varchar(50)  NOT NULL,
    ESTCLI char(1)  NOT NULL,
	CODUBI char(6)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (IDCLI)
);

INSERT INTO CLIENTE
(NOMCLI, APECLI, DNICLI, CELCLI, DIRCLI, ESTCLI, CODUBI)
VALUES
('Teresa','Maldini de Santos','15647818','943385483','Av. Alfonso Ugarte','A','140401'),
('Mrian','Medina Castro','20215848','943385483','Av. Emancipacion','A','140403'),
('Amparo','Campos Fausto','30188964','943385483','AV. Benavides','A','140405'),
('Hortensia','Hernandez Portuguez','10846416','943385483','Av. Montalban','A','140406'),
('Zahara','Seco Arizaga','41464186','943385483','Av. Morales','A','140407'),
('Marco','de Castro Aguilar','45874187','943385483','Av. Argentina','A','140409'),
('Ibon','Rivera Soto','12478915','943385483','Av.Aviacion','A','140411'),
('Rafael','Lopez Aliaga','98413418','943385483','Av. Oscar Benavides','A','140413'),
('Marisol','Guillen Martinez','35487845','943385483','Av.Teodoro','A','140401'),
('Rita','Capdevila Gutierrez','22487971','943385483','Av. Santa Beatriz','A','140406');
GO

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DEPUBI varchar(25)  NOT NULL,
    PROVUBI varchar(25)  NOT NULL,
    DISTUBI varchar(25)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
);

INSERT INTO UBIGEO
(CODUBI,DEPUBI,PROVUBI, DISTUBI)
VALUES
('140401', 'Lima', 'Cañete', 'San Vicente de Cañete'),
('140403', 'Lima', 'Cañete', 'Cerro Azul'),
('140405', 'Lima', 'Cañete', 'Chilca'),
('140406', 'Lima', 'Cañete', 'Imperial'),
('140407', 'Lima', 'Cañete', 'Lunahuana'),
('140409', 'Lima', 'Cañete', 'Nuevo Imperial'),
('140411', 'Lima', 'Cañete', 'Quilmana'),
('140412', 'Lima', 'Cañete', 'San Antonio'),
('140413', 'Lima', 'Cañete', 'San Luis'),
('140408', 'Lima', 'Cañete', 'Mala');
go

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    IDEMP int  NOT NULL IDENTITY(1, 1),
    NOMEMP varchar(30)  NOT NULL,
    APEEMP varchar(30)  NOT NULL,
    DNIEMP char(8)  NOT NULL,
    CELEMP char(9)  NOT NULL,
    DIREMP varchar(50)  NOT NULL,
    TIPEMP char(1)  NOT NULL,
	ESTEMP char(1)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (IDEMP)
);


INSERT INTO EMPLEADO
(NOMEMP,APEEMP,DNIEMP,CELEMP,DIREMP,TIPEMP,ESTEMP,CODUBI)
VALUES
('Jeferson','Palomino Flores','72530657','943385483','AV. Miraflores','V','A','140403'),
('Pool','Sanchez Rodriguez','72530668','943385494','AV. Larcomar','D','A','140405'),
('Robert','Linares Rojas','72530768','943385594','AV. Montalban','J','A','140401'),
('Julia','Quispe Mamani','72530894','943385666','AV. Benavides','V','A','140407'),
('Diego','Huapaya Rivera','72530905','943385777','AV. Valcomar','D','A','140408'),
('Elser','Huapaya Flores','72530769','943385888','AV. 9 DE DICIEMBRE','V','A','140411'),
('Mia','Torres Quispe','72530666','943385999','AV. Barrios altos','J','A','140406'),
('Jose','Correa Palomino','72530123','943399887','AV. Condoray','D','A','140412'),
('Jesus','Sanchez Games','72535648','943389635','AV. San Jose','V','A','140413'),
('Juan','Cabos Muertos','72532643','943326548','AV. Linda Rosa','J','A','140409');
GO

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int  NOT NULL IDENTITY(1, 1),
    NOMPRO varchar(30)  NOT NULL,
    PREPRO decimal(10,2)  NOT NULL,
    STOPRO int  NOT NULL,
    ESTPRO char(1)  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY  (IDPRO)
);

INSERT INTO PRODUCTO
(NOMPRO,PREPRO,STOPRO,ESTPRO)
VALUES
('Pizza Americana','35.00','10','A'),
('Pizza Mediana','36.00','15','A'),
('Pizza hut cheese','29.00','5','A'),
('Pizza doble o nada','70.00','6','A'),
('Pizza Jahuayana','27.00','10','A'),
('Pizza Americana mediana','45.00','13','A'),
('Pizza Americana grande','90.00','7','A'),
('Pizza hut mediana','45.00','2','A'),
('Pizza ht grande','80.00','8','A'),
('Pizza doble grande','99.00','5','A');
GO

-- Table: SUCURSAL
CREATE TABLE SUCURSAL (
    IDSUC int  NOT NULL IDENTITY(1, 1),
    NOMSUC varchar(30)  NOT NULL,
    DIRSUC varchar(50)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    IDEMP int  NOT NULL,
    CONSTRAINT SUCURSAL_pk PRIMARY KEY  (IDSUC)
);

INSERT INTO SUCURSAL
(NOMSUC,DIRSUC,CODUBI,IDEMP)
VALUES
('Pizzahut NV','Jr. Manchego Muñoz','140409', '10'),
('Pizzahut IP','Av. La Mar','140406', '7'),
('Pizzahut SV','Av. Benavides','140401', '3');
GO

-- Table: VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL IDENTITY(1, 1),
    FECVEN date  NOT NULL,
    IDCLI int  NOT NULL,
    IDEMP int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVEN)
);

-- Creamos un SP para inserción de datos en la tabla VENTA
CREATE PROCEDURE spInsertVenta
(
	@IDVEN INT,
	@FECVEN DATE,
	@IDCLI INT,
	@IDEMP INT
)
AS 
BEGIN
    SET NOCOUNT ON
    BEGIN TRAN /* TRANSACCIONES */
    BEGIN TRY
        IF (SELECT COUNT(*) FROM VENTA WHERE VENTA.FECVEN = @FECVEN) = 1
            ROLLBACK TRAN;
        ELSE 
            INSERT INTO VENTA
            (FECVEN,IDCLI,IDEMP)
            VALUES
            (@FECVEN, @IDCLI, @IDEMP)
            COMMIT TRAN
    END TRY
    BEGIN CATCH
        SELECT 'Esta venta ya ha sido registrada' AS ERROR
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
    END CATCH
END
GO

-- Insertamos datos en el SP
EXEC spInsertVenta '1', '20/07/2022', '1', '2';
EXEC spInsertVenta '2', '19/07/2022', '2','4';
EXEC spInsertVenta '4', '18/07/2022', '3','6';
EXEC spInsertVenta '5', '17/07/2022', '4','9';
EXEC spInsertVenta '6', '16/07/2022', '5','1';
EXEC spInsertVenta '7', '15/07/2022', '6','4';
EXEC spInsertVenta '8', '14/07/2022', '7','9';
EXEC spInsertVenta '9', '13/07/2022', '8','6';
EXEC spInsertVenta '10', '12/07/2022', '9','1';
EXEC spInsertVenta '3', '11/07/2022', '10', '2';

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET int  NOT NULL IDENTITY(1, 1),
    CANTVENTDET int  NOT NULL,
    IDPRO int  NOT NULL,
    IDVEN int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY  (IDVENDET)
);

-- Creamos un SP para inserción de datos en la tabla VENTA_DETALLE
CREATE PROCEDURE spInsertDetalle
(
	@IDVENDET INT,
	@CANTVENDET INT,
	@IDPRO INT,
	@IDVEN INT
)
AS 
BEGIN
    SET NOCOUNT ON
    BEGIN TRAN /* TRANSACCIONES */
    BEGIN TRY
        IF (SELECT COUNT(*) FROM VENTA_DETALLE WHERE VENTA_DETALLE.IDVENDET = @IDVENDET) = 1
            ROLLBACK TRAN;
        ELSE 
            INSERT INTO VENTA_DETALLE
            (CANTVENTDET, IDPRO, IDVEN)
            VALUES
            (@CANTVENDET, @IDPRO, @IDVEN)
            COMMIT TRAN
    END TRY
    BEGIN CATCH
        SELECT 'Esta ventadetalle ya ha sido registrada' AS ERROR
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
    END CATCH
END
GO

-- Insertamos datos en el SP
EXEC spInsertDetalle '1', '2', '10', '2';
EXEC spInsertDetalle '2', '5', '9', '4';
EXEC spInsertDetalle '3', '3', '8', '6';
EXEC spInsertDetalle '4', '1', '7', '8';
EXEC spInsertDetalle '5', '6', '6', '10';
EXEC spInsertDetalle '6', '4', '5', '9';
EXEC spInsertDetalle '7', '2', '4', '7';
EXEC spInsertDetalle '8', '1', '3', '5';
EXEC spInsertDetalle '9', '3', '2', '3';
EXEC spInsertDetalle '10', '5', '1', '1';

-- foreign keys
-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: EMPLEADO_UBIGEO (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: SUCURSAL_EMPLEADO (table: SUCURSAL)
ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_EMPLEADO
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Reference: SUCURSAL_UBIGEO (table: SUCURSAL)
ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

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

-- Reference: VENTA_VENDEDOR (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Creamos una vista
CREATE VIEW vVenta as
SELECT v.IDVEN, CONCAT(cli.NOMCLI, ', ',cli.APECLI)as CLIENTE, pro.NOMPRO as PRODUCTO,
pro.PREPRO as PRECIO, vd.CANTVENTDET as CANTIDAD,CONCAT(emp.NOMEMP, ', ',emp.APEEMP) as EMPLEADO, 
TOTAL=pro.PREPRO*vd.CANTVENTDET FROM VENTA v
inner join CLIENTE cli on cli.IDCLI = v.IDCLI
inner join EMPLEADO emp on emp.IDEMP = v.IDEMP
inner join VENTA_DETALLE vd on vd.IDVEN = v.IDVEN
inner join PRODUCTO pro on pro.IDPRO = vd.IDPRO

-- Creamos una vista
CREATE VIEW vEmpleado as
SELECT emp.IDEMP, CONCAT(emp.NOMEMP, ', ',emp.APEEMP) as EMPLEADO, emp.DNIEMP as DNI, emp.TIPEMP as ROL, 
emp.DIREMP as DIRECCIÓN, CONCAT(u.DEPUBI, ' - ',u.PROVUBI, ' - ',u.DISTUBI) as UBICACIÓN, suc.NOMSUC as SUCURSAL,
suc.DIRSUC FROM EMPLEADO emp
inner join UBIGEO u on u.CODUBI = emp.CODUBI
inner join SUCURSAL suc on emp.IDEMP = suc.IDEMP