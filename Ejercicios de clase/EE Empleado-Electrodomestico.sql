SPOOL 'C:\Users\Samuel\Desktop';
ttitle left 'spool1';
set colsep '| * |'


DROP TABLE Empleado;
CREATE TABLE Empleado(
    nif NUMBER PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    nivel VARCHAR(50),
    ocupacion VARCHAR(50)
);

DROP TABLE Electrodomestico;
CREATE TABLE Electrodomestico(
    aparato NUMBER PRIMARY KEY,
    marca VARCHAR(20),
    modelo VARCHAR(20)
);

DROP TABLE Emp_Elec;
CREATE TABLE Emp_Elec(
    nif NUMBER CONSTRAINT nifpk PRIMARY KEY,
    aparato NUMBER,
    CONSTRAINT aparatofk FOREIGN KEY (aparato) REFERENCES
    Electrodomestico(aparato),
    ultima_fecha TIMESTAMP
);
 
INSERT INTO Empleado VALUES (1,'PEPE','Ramirez','alto','reparador');
SELECT * FROM Empleado;
INSERT INTO Electrodomestico VALUES (1, 'chanes','nuevo');
SELECT * FROM Electrodomestico;
INSERT INTO Emp_Elec VALUES(1,1,CURRENT_TIMESTAMP);
SELECT * FROM Emp_Elec;

SPOOL END;