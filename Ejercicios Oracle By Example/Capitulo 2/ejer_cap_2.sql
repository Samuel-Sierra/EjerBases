
spool "C:\Users\Samuel\Desktop\Bases\Ejercicios Oracle By Example\Capitulo 2\SPOOL_ejer_cap_2.txt"
REM CAP 2
REM ESTUDIANTES Sierra Fierro Samuel Isaac / Cesar Abraham
SET PAGESIZE 200
SET LINESIZE 500
set colsep '||'
set null Nulos
COLUMN timestamp_col NEW_VALUE timestamp_var

-----------------------------------
REM (A.Rischert,2009,66-67)
REM "Como escribir un SQL Query?"

SELECT description
FROM course;

REM "Para recuperar varias columnas"

SELECT description, cost
FROM course;

REM "Para seleccionar todas las columnas"
SELECT *
FROM course;
-----------------------------------

REM (A.Rischert,2009,69-70)
REM "Eliminando duplicados con DISTINCT O UNIQUE"

SELECT last_name, zip
FROM instructor;

REM En la consulta se observan todos los datos aunque esten duplicados

SELECT DISTINCT zip
FROM instructor;

-----------------------------------------

REM (A.Rischert,2009,75)
REM 2.2 Exercises
REM a) Write a SELECT statement that lists the first and last names of all students.
SELECT first_name, last_name
FROM student;

-----------------------------------------

REM (A.Rischert,2009,75)
REM 2.2 Exercises
REM b) Write a SELECT statement that lists all cities, states, and zip codes.
SELECT city, state, zip
FROM zipcode;

------------------------------------------

REM (A.Rischert,2009,75)
REM 2.2 Exercises
REM c) Why are the results of the following two SQL statements the same?

SELECT letter_grade
FROM grade_conversion;

SELECT UNIQUE letter_grade
FROM grade_conversion;

REM porque todos los elementos de la columna letter_grade son distintos entre si

-----------------------------------------

REM (A.Rischert,2009,92)
REM Formato para numeros
COL cost FORMAT $9,999.99
SELECT DISTINCT cost
FROM course;

REM Cambiando el formato  de  nuevo
COL cost FORMAT 999.99
SELECT DISTINCT cost
FROM course;

REM Si hacemos otro cambio
COL cost FORMAT 9,999.99
SELECT DISTINCT cost
FROM course;

spool off;