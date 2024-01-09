spool "C:\Users\Samuel\Desktop\Bases\Ejercicios Oracle By Example\Capitulo 9\SPOOL_ejer_cap_9.txt"
REM CAP 2
REM ESTUDIANTES Sierra Fierro Samuel Isaac / Cesar Abraham
SET PAGESIZE 200
SET LINESIZE 500
set colsep '||'
set null Nulos
COLUMN timestamp_col NEW_VALUE timestamp_var

---------------------------------------------------------
REM (A.Rischert,2009,379)
REM UNION  OPERATOR
SELECT first_name, last_name, phone
FROM instructor
UNION
SELECT first_name, last_name, phone
FROM student; 

SELECT first_name, last_name, phone, COUNT(*)
FROM student
GROUP BY first_name, last_name, phone
HAVING COUNT(*) > 1; 

REM UNION ALL 

SELECT first_name, last_name, phone
FROM instructor
UNION ALL
SELECT first_name, last_name, phone
FROM student; 
REM EJEMPLO DISTINTO 
SELECT first_name, last_name, phone, COUNT(*)
FROM student
GROUP BY first_name, last_name, phone
HAVING COUNT(*) > 1
UNION ALL
SELECT first_name, last_name, phone, COUNT(*)
FROM instructor
GROUP BY first_name, last_name, phone
HAVING COUNT(*) > 1;

-------------------------------------------------------------------
REM (A.Rischert,2009,379)
REM ORDER BY

SELECT instructor_id id, first_name, last_name, phone
FROM instructor
UNION
SELECT student_id, first_name, last_name, phone
FROM student
ORDER BY 3; 

REM EJEMPLO DISTINTO

SELECT instructor_id AS id, first_name, last_name, phone
FROM instructor
UNION
SELECT student_id, first_name, last_name, phone
FROM student
WHERE first_name LIKE 'P%'
ORDER BY 2, 3;

----------------------------------------------------------------------
REM (A.Rischert,2009,390)
REM INTERSECT OPERATOR

SELECT created_by
FROM enrollment
INTERSECT
SELECT created_by
FROM course; 
REM Se ve claramente la interseccion entre las tablas

--------------------------------------------------------------------
REM (A.Rischert,2009,393)
REM 9.2 Exercises
REM b) Use the MINUS set operator to create a list of courses and sections with no students enrolled. Addto the result set a column with the title 
REM Status and display the text No Enrollments in each row. Order the results by the COURSE_NO and SECTION_NO columns.

SELECT course_no, section_no, 'No Enrollments' "Status"
FROM section
MINUS
SELECT course_no, section_no, 'No Enrollments'
FROM section s
WHERE EXISTS (SELECT section_id
FROM enrollment e
WHERE e.section_id = s.section_id)

ORDER BY 1, 2;

REM Esta declaración hace uso del literal "NO ENROLLMENTS" en la declaración SELECT.

------------------------------------------------------------------------------
REM (A.Rischert,2009,393)
REM 9.2 Exercises
REM c) Use the appropriate set operator to list all zip codes that are in both the STUDENT and INSTRUCTOR tables.

SELECT zip
FROM instructor
INTERSECT
SELECT zip
FROM student;

----------------------------------------------------------------------------------
REM (A.Rischert,2009,393)
REM 9.2 Exercises
REM Use the INTERSECT set operator to list student IDs for students who are enrolled.
SELECT student_id
FROM student
INTERSECT
SELECT student_id
FROM enrollment;
spool off;