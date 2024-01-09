SPOOL 'C:\Users\Samuel\Desktop';
ttitle left 'Tablas de ';
set colsep '| * |'
set pagesize 2

DROP TABLE Editorial;
CREATE TABLE Editorial(
    nombre_editorial VARCHAR(50) CONSTRAINT nombre_editorialpk PRIMARY KEY,
    director VARCHAR(20),
    direccion VARCHAR(20)
);


DROP TABLE Revista;
CREATE TABLE Revista(
    titulo VARCHAR(50) PRIMARY KEY,
    editor VARCHAR(50),
    ejemplares VARCHAR(50),
    nombre_editorial VARCHAR(50),
    CONSTRAINT nombre_editorialfk FOREIGN KEY (nombre_editorial) REFERENCES Editorial(nombre_editorial)
);
 
INSERT INTO Editorial VALUES ('editorial1','calimba','alameda 13');
SELECT * FROM Editorial;
INSERT INTO Revista VALUES ('revista1', 'juan escutia','33 copias','editorial1');
SELECT * FROM Revista;

SPOOL END;