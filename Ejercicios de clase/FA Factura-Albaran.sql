SPOOL 'C:\Users\Samuel\Desktop';
ttitle left 'Tablas de Factura_Albaran';
set colsep '| * |'
set pagesize 2

DROP TABLE Factura;
CREATE TABLE Factura(
    numero_factura INTEGER CONSTRAINT numero_facturapk PRIMARY KEY,
    fecha_emision TIMESTAMP,
    total_factura FLOAT
);


DROP TABLE Albaran;
CREATE TABLE Albaran(
    numero_albaran INTEGER PRIMARY KEY,
    fecha_venta TIMESTAMP,
    total_albaran FLOAT
);

DROP TABLE Fac_Alba;
CREATE TABLE Fac_Alba(
    numero_albaran INTEGER CONSTRAINT numero_albaranafk PRIMARY KEY,
    numero_factura INTEGER,
    CONSTRAINT numero_facturafk FOREIGN KEY (numero_factura) REFERENCES Factura(numero_factura),
    descuento FLOAT
);
 
INSERT INTO Editorial VALUES ('editorial1','calimba','alameda 13');
SELECT * FROM Editorial;
INSERT INTO Revista VALUES ('revista1', 'juan escutia','33 copias','editorial1');
SELECT * FROM Revista;

SPOOL END;