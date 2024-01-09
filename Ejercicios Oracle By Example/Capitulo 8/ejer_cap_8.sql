spool "C:\Users\Samuel\Desktop\Bases\Ejercicios Oracle By Example\Capitulo 8\SPOOL_ejer_cap_8.txt"
REM ESTUDIANTES Sierra Fierro Samuel Isaac / Cesar Abraham
SET PAGESIZE 50
SET LINESIZE 130
set colsep '||'
set null Nulos
COLUMN timestamp_col NEW_VALUE timestamp_var

-----------------------------------------------------------------
REM (A.Rischert,2009,368-370)
REM SCALAR SUBQUERIES

SELECT MIN(cost)
FROM course

SELECT course_no, description, cost
FROM course
WHERE cost = 1095; 

SELECT course_no, description, cost
FROM course
WHERE cost = 
(SELECT MIN(cost)
FROM course); 

REM EJEMPLO DISTINTO AL LIBRO
SELECT course_no, description, cost
FROM course
WHERE cost =
(SELECT MIN(cost)
FROM course
WHERE cost > 1095);
REM ahi se muestra el curso mas barato que no sea el de 1095 juntando ambas consultas

-------------------------------------------------------------------------------------------
REM (A.Rischert,2009,368-370)

REM Subqueries That Return Multiple Rows
SELECT course_no, description, cost
FROM course
WHERE cost =
(SELECT MAX(cost)
FROM course); 

REM el siguiente segmento no debe funcionar
SELECT course_no, description, cost
FROM course
WHERE cost =
(SELECT cost
FROM course
WHERE prerequisite = 20); 
REM debido a que la subconsulta retorna mas de una fila
REM la correcta sintaxis es la siguiente

SELECT course_no, description, cost
FROM course
WHERE cost IN
(SELECT cost
FROM course
WHERE prerequisite = 20); 

SELECT course_no, description, cost
FROM course
WHERE cost NOT IN
(SELECT cost
FROM course
WHERE prerequisite = 20); 

----------------------------------------------------------------

REM (A.Rischert,2009,327-328);
REM Nesting Multiple Subqueries

SELECT last_name, first_name
FROM student 
WHERE student_id IN 
(SELECT student_id 
FROM enrollment
WHERE section_id IN 
(SELECT section_id 
FROM section
WHERE section_no = 8
AND course_no = 20)); 


REM ejemplo disinto del libro 
SELECT last_name, first_name
FROM student 
WHERE student_id IN
(SELECT student_id
FROM enrollment
WHERE section_id IN
(SELECT section_id
FROM section
WHERE section_no = 8
AND course_no IN (20, 30)));

------------------------------------------------------------------
REM (A.Rischert,2009,332)
REM 8.1 Exercises
REM a) Write a SQL statement that displays the first and last names of the students who registered first.
SELECT first_name, last_name
FROM student
WHERE registration_date =
(SELECT MIN(registration_date)
FROM student);

REM Ahora veamos que pasa con MAX
SELECT first_name, last_name
FROM student
WHERE registration_date =
(SELECT MAX(registration_date)
FROM student);

REM Vemos que despliega desde mayor hasta los menores tambien

-----------------------------------------------------------------------
REM (A.Rischert,2009,332)
REM 8.1 Exercises
REM b) Show the sections with the lowest course cost and a capacity equal to or lower than the average
REM capacity. Also display the course description, section number, capacity, and cost.

SELECT c.description, s.section_no, c.cost, s.capacity
FROM course c, section s
WHERE c.course_no = s.course_no
AND s.capacity <=
(SELECT AVG(capacity)
FROM section)
AND c.cost =
(SELECT MIN(cost) FROM course);
REM Hagamos lo mismo con MAX
SELECT c.description, s.section_no, c.cost, s.capacity
FROM course c, section s
WHERE c.course_no = s.course_no
AND s.capacity <=
(SELECT AVG(capacity)
FROM section)
AND c.cost =
(SELECT MAX(cost) FROM course);

---------------------------------------------------------------------
REM (A.Rischert,2009,332)
REM 8.1 Exercises
REM c) Select the course number and total capacity for each course. Show only the courses with a total capacity less than the average capacity of all the sections.
SELECT course_no, SUM(capacity)
FROM section
GROUP BY course_no
HAVING SUM(capacity) <
(SELECT AVG(capacity)
FROM section);
SELECT course_no, SUM(capacity)
FROM section
GROUP BY course_no;
REM Facilmente obtenemos el promedio con
SELECT AVG(capacity)
FROM section;
spool off;