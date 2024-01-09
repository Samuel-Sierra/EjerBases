spool "C:\Users\Samuel\Desktop\Bases\Ejercicios Oracle By Example\Capitulo 6\SPOOL_ejer_cap_6.txt"
REM ESTUDIANTES Sierra Fierro Samuel Isaac / Cesar Abraham
SET PAGESIZE 200
SET LINESIZE 500
set colsep '||'
set null Nulos
COLUMN timestamp_col NEW_VALUE timestamp_var

----------------------------------------------------------------------------------------
REM (A.Rischert, 2009, 264) 
REM Function COUNT
SELECT COUNT(*)
FROM enrollment;
REM La funcion count cuenta el numero de tuplas de una tabla

SELECT COUNT(final_grade), COUNT(section_id), COUNT(*)
FROM enrollment;

------------------------------------------------------------------------------------------
REM (A.Rischert, 2009, 265) 
REM Function DISTINCT
SELECT COUNT(DISTINCT section_id), COUNT(section_id)
FROM enrollment;

REM la funcion Distinct se usa para saber que valores son distintos de esa tabla

------------------------------------------------------------------------------------------
REM (A.Rischert 2009, 265) 
REM Function SUM
REM LA FUNCION SUM CREA GRUPOS AL JUNTAR LAS TUPLAS DE UNA TABLA, LOS VALORES NULL SON IGNORADOS
SELECT SUM(capacity)
FROM section;

------------------------------------------------------------------------------------------
REM (A.Rischert 2009, 268) 
REM EJERCICIOS 6.1
REM a) Write a SELECT statement that determines how many courses do not have a prerequisite.
SELECT COUNT(*)
FROM COURSE
WHERE prerequisite IS NULL;

----------------------------------------------------------------------------------------------
REM (A.Rischert 2009, 268) 
REM EJERCICIOS 6.1
REM b) Write a SELECT statement that determines the total number of students enrolled. Count each student only once, 
REM no matter how many courses the student is enrolled in.

SELECT COUNT(DISTINCT STUDENT_ID)
FROM ENROLLMENT;

-----------------------------------------------------------------------------------------------
REM (A.Rischert 2009, 268) 
REM EJERCICIOS 6.1
REM c)Determine the average cost for all courses. If the course cost contains a null value, substitute the value 0.

SELECT AVG(COST), AVG(NVL(COST, 0)) 
FROM COURSE;
REM AVG(COST) HACE EL PROMEDIO DE LA TUPLA COST CON VALORES NULL MIENTRAS QUE LA OTRA FUNCION LE ASIGNA UN 0 A LOS VALORES NULL

-----------------------------------------------------------------------------------------------
REM (A.Rischert 2009, 268) 
REM EJERCICIOS 6.1
REM d) Write a SELECT statement that determines the date of the most recent enrollment.

SELECT MAX(registration_date) "Last"
FROM STUDENT;

SELECT MAX(ENROLLMENT) "Last"
FROM STUDENT;

SELECT MAX(ENROLL_DATE)
FROM ENROLLMENT;

spool off;