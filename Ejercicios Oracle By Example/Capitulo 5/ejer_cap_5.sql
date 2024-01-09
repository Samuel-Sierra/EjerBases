spool "C:\Users\Samuel\Desktop\Bases\Ejercicios Oracle By Example\Capitulo 5\SPOOL_ejer_cap_5.txt"
REM CAP 5
REM ESTUDIANTES Sierra Fierro Samuel Isaac / Cesar Abraham
SET PAGESIZE 200
SET LINESIZE 500
set colsep '||'
set null Nulos
COLUMN timestamp_col NEW_VALUE timestamp_var

----------------------------------------------------------
REM rem (A.Rischert, 2009, 191) 
SELECT last_name, registration_date
    FROM student
WHERE student_id IN (123,161,190)
ORDER BY 1 asc;

SELECT last_name, registration_date,
    TO_CHAR(registration_date, 'MM/DD/YYYY')
    AS "Formatted"
FROM student
WHERE student_id IN (123,161,190);

REM La función TO_DATE hace justo lo contrario de la función TO_CHAR: convierte un texto, literalmente en un tipo de datos DATE.

-------------------------------------------------------------
REM rem (A.Rischert, 2009, 193) 
SELECT last_name,
    TO_CHAR(registration_date, 'Dy') AS "1.Day",
    TO_CHAR(registration_date, 'Dy') AS "2.Day",
    TO_CHAR(registration_date, 'Month DD, YYYY') 
        AS "Look at the Mont",
    TO_CHAR(registration_date, 'HH:MI PM') AS "Time"
FROM student
WHERE student_id IN (123, 161, 190);

------------------------------------------------------------
REM rem (A.Rischert, 2009, 194) 
SELECT last_name,
TO_CHAR(registration_date, 'fmMonth ddth, YYYY')
"Eliminating Spaces",
TO_CHAR(registration_date, 'Ddspth "of" fmMonth')
"Spelled out"
FROM student
WHERE student_id IN (123, 161, 190);

REM Consulta
SELECT last_name, registration_date
FROM student
WHERE registration_date = TO_DATE('22-JAN-2007', 'DD-MON-YYYY');

REM consulta con error de sintaxis
SELECT last_name, registration_date
FROM student
WHERE registration_date = TO_DATE('22/01/2007', 'DD-MON-YYYY');

---------------------------------------------------------------
REM rem (A.Rischert, 2009, 196) 
REM Exercises 5.1 
REM a) Display the course number, section ID, and starting date and time for sections taught on May 4, 2007.
SELECT course_no, section_id,
TO_CHAR(start_date_time, 'DD-MON-YYYY HH24:MI')
FROM section;

-----------------------------------------------------------------
REM rem (A.Rischert, 2009, 196) 
REM Exercises 5.1 
REM b) Show the student records that were modified on or before January 22, 2007. Display the date a record was modified and each student’s first and last name, 
REM concatenated in one column.

SELECT first_name||' '||last_name fullname,
TO_CHAR(modified_date, 'DD-MON-YYYY HH:MI P.M.')
"Modified Date and Time"
FROM student
WHERE modified_date < TO_DATE('01/23/2007','MM/DD/YYYY');

REM Tambien se puede con un TRUNC

SELECT first_name||' '||last_name fullname,
TO_CHAR(modified_date, 'DD-MON-YYYY HH:MI P.M.')
"Modified Date and Time"
FROM student
WHERE TRUNC(modified_date) <= TO_DATE('01/22/2007','MM/DD/YYYY');

---------------------------------------------------------------------
REM rem (A.Rischert, 2009, 196) 
REM Exercises 5.1 
REM e) Determine el día de la semana para el 31 de diciembre de 1899.
SELECT TO_CHAR(TO_DATE('31-DEC-1899', 'DD-MON-YYYY'),'Dy')
FROM dual;


SPOOL off