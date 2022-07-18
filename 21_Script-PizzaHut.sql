USE master
GO

DROP DATABASE IF EXISTS DBPizzahut
go

CREATE DATABASE DBPizzahut
GO

USE DBPizzahut
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
    CODUBI char(6)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (IDCLI)
);
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
    CODUBI char(6)  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (IDEMP)
);
go

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int  NOT NULL IDENTITY(1, 1),
    NOMPRO varchar(30)  NOT NULL,
    PREPRO decimal(10,2)  NOT NULL,
    STOPRO int  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY  (IDPRO)
);
go

-- Table: SUCURSAL
CREATE TABLE SUCURSAL (
    IDSUC int  NOT NULL IDENTITY(1, 1),
    NOMSUC varchar(30)  NOT NULL,
    DIRSUC varchar(50)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    CONSTRAINT SUCURSAL_pk PRIMARY KEY  (IDSUC)
);
go

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DEPUBI varchar(25)  NOT NULL,
    PROVUBI varchar(25)  NOT NULL,
    DISTUBI varchar(25)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
);
go

-- Table: VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL IDENTITY(1, 1),
    FECVEN date  NOT NULL,
    IDCLI int  NOT NULL,
    IDEMP int  NOT NULL,
    IDSUC int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVEN)
);
go


-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET int  NOT NULL IDENTITY(1, 1),
    PRETOTVENDET decimal(10,2)  NOT NULL,
    IDPRO int  NOT NULL,
    IDVEN int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY  (IDVENDET)
);
go

-- foreign keys
-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: EMPLEADO_UBIGEO (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

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

-- Reference: VENTA_SUCURSAL (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_SUCURSAL
    FOREIGN KEY (IDSUC)
    REFERENCES SUCURSAL (IDSUC);

-- Reference: VENTA_VENDEDOR (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Insertamos datos en las tablas
SELECT * FROM UBIGEO;

INSERT INTO UBIGEO
(CODUBI,PROVUBI,DEPUBI,DISTUBI)
VALUES
('101010', 'Lima', 'Lima', 'Lima'),
('101011', 'Lima', 'Lima', 'Ancon'),
('101012', 'Lima', 'Lima', 'Ate'),
('101013', 'Lima', 'Lima', 'Breña'),
('101014', 'Lima', 'Lima', 'Carabayllo'),
('101015', 'Lima', 'Lima', 'Comas'),
('101016', 'Lima', 'Lima', 'Chaclacayo'),
('101017', 'Lima', 'Lima', 'Chorrillos'),
('101018', 'Lima', 'Lima', 'La Victoria'),
('101019', 'Lima', 'Lima', 'La Molina');
GO

-- Insertamos datos en las tablas
SELECT * FROM CLIENTE;

INSERT INTO CLIENTE
(NOMCLI,APECLI, DNICLI, DIRCLI,CELCLI,CODUBI)
VALUES
('Teresa','Maldini de Santos', '78524346', 'Av. Alfonso Ugarte','943385483','101010'),
('Mrian','Medina','12587648','Av. Emancipacion', '943385483','101010'),
('Amparo','Sebastian', '51236942','AV. Benavides','943385483','101010'),
('Hortensia','Hernando', '75416982','Av. Montalban','943385483','101010'),
('Zahara','Seco', '69428510','Av. Morales','943385483','101010'),
('Marco','de Castro', '37056984','Av. Argentina','943385483','101010'),
('Ibon','Riera', '20156987','Av.Aviacion','943385483','101010'),
('Rafael','Lopez Aliaga', '50139753','Av. Oscar Benavides','943385483','101010'),
('Marisol','Guillen', '98403612','Av.Teodoro','943385483','101010'),
('Rita','Capdevila', '45678013','Av. Santa Beatriz','943385483','101010');
GO

-- Insertamos datos en las tablas
SELECT * FROM EMPLEADO;


INSERT INTO EMPLEADO
(NOMEMP,APEEMP,DIREMP,CELEMP,DNIEMP,TIPEMP,CODUBI)
VALUES
('Jeferson','Palomino Flores','AV. Miraflores','943385483','72530657','V','101010'),
('Pool','Sanchez Rodriguez','AV. Larcomar','943385494','72530668','D','101011'),
('Robert','Linares Rojas','AV. Montalban','943385594','72530768','V','101011'),
('Julia','Quispe Mamani','AV. Benavides','943385666','72530894','V','101012'),
('Diego','Huapaya Rivera','AV. Valcomar','943385777','72530905','D','101012'),
('Elser','Huapaya Flores','AV. 9 DE DICIEMBRE','943385888','72530769','V','101012'),
('Mia','Torres Quispe','AV. Barrios altos','943385999','72530666','V','101013'),
('Jose','Correa Palomino','AV. Condoray','943399887','72530123','V','101014'),
('Jesus','Sanchez Games','AV. San Jose','943389635','72535648','V','101015'),
('Juan','Cabos','AV. Linda Rosa','943326548','72532643','D','101016');
GO


-- Insertamos datos en las tablas
SELECT * FROM SUCURSAL;

INSERT INTO SUCURSAL
(NOMSUC,DIRSUC,CODUBI)
VALUES
('Pizzahut','Av Manco Capac','101010'),
('Pizzahut 1','Av Larcomar','101011'),
('Pizzahut 3','Av Benavides','101012'),
('Pizzahut 4','Av Montalban','101013'),
('Pizzahut 5','Av Condoray','101014');
GO


-- Insertamos datos en las tablas
SELECT * FROM PRODUCTO;

INSERT INTO PRODUCTO
(NOMPRO,PREPRO,STOPRO)
VALUES
('Pizza Americana','35.00','10'),
('Pizza Mediana','36.00','15'),
('Pizza hut cheese','29.00','5'),
('Pizza doble o nada','70.00','6'),
('Pizza Jahuayana','27.00','10'),
('Pizza Americana mediana','45.00','13'),
('Pizza Americana grande','90.00','7'),
('Pizza hut mediana','45.00','2'),
('Pizza ht grande','80.00','8'),
('Pizza doble grande','99.00','5');
GO

-- Insertamos datos en las tablas
SELECT * FROM VENTA;
SET DATEFORMAT dmy;

INSERT INTO VENTA
(FECVEN, IDCLI, IDEMP, IDSUC) VALUES
('01/01/2021', '6', '1', '1'),
('02/02/2022', '7', '2', '2'),
('03/03/2020', '8', '3', '3'),
('04/04/2021', '9', '4', '4'),
('05/05/2022', '5', '5', '5');
GO

-- Insertamos datos en las tablas
SELECT * FROM VENTA_DETALLE;
SELECT * FROM PRODUCTO;

INSERT INTO VENTA_DETALLE
(PRETOTVENDET, IDPRO, IDVEN) VALUES
(90.00, '7', '6'),
(45.00, '8', '2'),
(70.00, '4', '3'),
(35.00, '1', '4'),
(36.00, '2', '5');
GO

CREATE VIEW vVenta as
SELECT CONCAT(cli.NOMCLI, ',',cli.APECLI) as CLIENTE, cli.DNICLI as DNI, pro.NOMPRO as PRODUCTO, pro.PREPRO as PRECIO, CONCAT(emp.NOMEMP, ',', emp.APEEMP) as EMPLEADO FROM VENTA v 
inner join CLIENTE cli on cli.IDCLI= v.IDCLI
inner join EMPLEADO emp on emp.IDEMP = v.IDEMP
inner join VENTA_DETALLE vd on vd.IDVEN = v.IDVEN
inner join PRODUCTO pro  on pro.IDPRO = vd.IDPRO