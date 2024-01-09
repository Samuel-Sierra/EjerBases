spool "C:\Users\Samuel\Desktop\Bases\Ejercicios Oracle By Example\Capitulo 10\SPOOL_ejer_cap_10.txt"
REM ESTUDIANTES Sierra Fierro Samuel Isaac / Cesar Abraham
SET PAGESIZE 200
SET LINESIZE 500
set colsep '||'
set null Nulos
COLUMN timestamp_col NEW_VALUE timestamp_var

------------------------------------------------
REM (A.Rischert,2009,401)
REM ANSI Outer JOIN

SELECT c.course_no, c.description,
s.section_id, s.course_no
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
ORDER BY c.course_no;

REM El Outer JOIN muestra valores nulos para las columnas s.course_no y s.section_id donde no existe coincidencia.
REM Cambiando del libro 

SELECT c.course_no, c.description,
s.section_id, s.course_no
FROM course c RIGHT OUTER JOIN section s
ON c.course_no = s.course_no
ORDER BY c.course_no;

REM Se observa que con el rigth no se devuelven valores nulos

-------------------------------------------------------
REM (A.Rischert,2009,403)
REM The Outer Join and the UNION ALL Operator

SELECT c1.course_no, c1.description,
s.section_id, s.course_no
FROM course c1, section s
WHERE c1.course_no = s.course_no
UNION ALL
SELECT c2.course_no, c2.description,
TO_NUMBER(NULL), TO_NUMBER(NULL)
FROM course c2
WHERE NOT EXISTS
(SELECT 'X'
FROM section
WHERE c2.course_no = course_no);

REM El resultado que nos da el operador UNION ALL combina el resultado de la EQUIJOIN (todoscursos con secciones) 
REM con el resultado de la subconsulta correlacionada (cursos sin coincidencia en el tabla SECCIÓN). 
REM Se observa que no te devuelve los duplicados y no hay que evitarlos por nuestra cuenta como con UNION

---------------------------------------------------------
REM (A.Rischert,2009,406)
REM 10.1 Exercises
REM a) Explain why Oracle returns an error message when you execute the following SELECT statement.

SELECT c.course_no, s.course_no, s.section_id,
c.description, s.start_date_time
FROM course c, section s
WHERE c.course_no(+) = s.course_no(+);

REM El OUTERJOIN sólo se puede utilizar en un lado de la ecuación, no en ambos.
REM Una manera facil de arreglar esto es con el FULL OUTER JOIN

If you want to write such an outer join, use the ANSI join syntax instead.
SELECT c.course_no, s.course_no, s.section_id,
c.description, s.start_date_time
FROM course c FULL OUTER JOIN section s
ON c.course_no = s.course_no;

----------------------------------------------------------
REM (A.Rischert,2009,406)
REM 10.1 Exercises
REM b) Show the description of all courses with the prerequisite course number 350. Include in the resultthe location where the sections meet. 
REM Return course rows even if no corresponding row in the SECTION table is found.

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
WHERE c.prerequisite = 350;

REM También se puede escribir con el outer join externo (+)

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c, section s
WHERE c.course_no = s.course_no(+)
AND c.prerequisite = 350;

REM Otra forma de hacerlo es con condiciones WHERE y OUTER JOINS
SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON (c.course_no = s.course_no
AND location = 'L507')
WHERE c.prerequisite = 350;

-------------------------------------------------------------
REM (A.Rischert,2009,406)
REM 10.1 Exercises
REM c) Rewrite the following SQL statement using an outer join.

SELECT course_no, description
FROM course c
WHERE NOT EXISTS
(SELECT 'X'
FROM section
WHERE c.course_no = course_no);

REM Reescribiendo
SELECT course_no, description
FROM course LEFT OUTER JOIN section
USING (course_no)
WHERE section_id IS NULL;

-----------------------------------------------------
REM (A.Rischert,2009,420)
REM 10.2 Exercises

REM c) Display the student ID, last name, and street address of students living at the same address and zip code.

SELECT DISTINCT a.student_id, a.last_name,
a.street_address
FROM student a JOIN student b
ON (a.street_address = b.street_address
AND a.zip = b.zip)
WHERE a.student_id <> b.student_id
ORDER BY a.street_address;

spool off;
