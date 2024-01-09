spool "C:\Users\Samuel\Desktop\Bases\Ejercicios Oracle By Example\Capitulo 7\SPOOL_ejer_cap_7.txt"
REM CAP 7

SET COLSEP '| * |'
SET PAGESIZE 170
SET LINESIZE 170
SET NULL 's/Datos'

-----------------------------------------------------------------------
REM (A.Rischert, 2009, 287)
REM Course
SELECT course.course_no, section_no, description,
location, instructor_id
FROM course, section
WHERE course.course_no = section.course_no;

REM ahora hacemos la consulta con los alias
SELECT c.course_no, s.section_no, c.description,
s.location, s.instructor_id
FROM course c, section s
WHERE c.course_no = s.course_no;

--------------------------------------------------------------------------
REM (A.Rischert, 2009, 288) 
REM REDUCCION DEL CONJUNTO DE RESULTADOS

SELECT c.course_no, s.section_no, c.description,
s.location, s.instructor_id
FROM course c, section s
WHERE c.course_no = s.course_no
AND c.description LIKE 'Intro to%';

-----------------------------------------------------------------------
REM (A.Rischert, 2009, 305) 
REM ANSI Join Syntax for Joining Three or More Tables

SELECT c.course_no, s.section_no, c.description, s.location,
s.instructor_id, i.last_name, i.first_name
FROM course c JOIN section s
ON (c.course_no = s.course_no)
JOIN instructor i
ON (s.instructor_id = i.instructor_id);

REM Una manera alternativa es con la clausula USING

SELECT course_no, s.section_no, c.description, s.location,
instructor_id, i.last_name, i.first_name
FROM course c JOIN section s
USING (course_no)
JOIN instructor i
USING (instructor_id);

-----------------------------------------------------------------
REM (A.Rischert,2009,310)
REM 7.2 Exercises
REM a) Display the student ID, course number, and section number of enrolled students where the instructor of the section lives in zip code 10025. 
REM In addition, the course should not have any prerequisites.

SELECT c.course_no, s.section_no, e.student_id
FROM course c, section s, instructor i, enrollment e
WHERE c.prerequisite IS NULL
AND c.course_no = s.course_no
AND s.instructor_id = i.instructor_id
AND i.zip = '10025'
AND s.section_id = e.section_id;

-------------------------------------------------------------------
REM (A.Rischert,2009,310)
REM 7.2 Exercises
REM b) Produce the mailing addresses for instructors who taught sections that started in June 2007.

SELECT first_name || ' ' ||last_name name,
street_address, city || ', ' || state
|| ' ' || zip "City State Zip",
TO_CHAR(start_date_time, 'MM/DD/YY') start_dt,
section_id sect
FROM instructor JOIN section s
USING (instructor_id)
JOIN zipcode
USING (zip)
WHERE start_date_time >=TO_DATE('01-JUN-2007','DD-MON-YYYY')
AND start_date_time < TO_DATE('01-JUL-2007','DD-MON-YYYY');

-------------------------------------------------------------------
REM (A.Rischert,2009,310)
REM 7.2 Exercises
rem c) List the student IDs of enrolled students living in Connecticut.

SELECT s.student_id
FROM student s, enrollment e, zipcode z
WHERE s.student_id = e.student_id
AND s.zip = z.zip
AND z.state = 'CT';
spool off;

