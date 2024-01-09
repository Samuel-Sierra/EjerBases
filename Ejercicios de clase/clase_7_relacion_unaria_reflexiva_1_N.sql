rem spool 
set echo on
set pagesize 99
set linesize 150
set colsep '| * |'
Drop table EMP cascade constraints;

create table EMP
(empleado_id integer
		CONSTRAINT EMP_ID_PK PRIMARY KEY,
First_name varchar2(20),
Last_name varchar2(20),
Reporta_a integer);

PROMPT TUPLAS
insert into EMP Values(1,'Nancy','Devolio',NULL);
insert into EMP Values(2,'Andrès','Flores',1);
insert into EMP Values(3,'Janet','Lopez',1);
insert into EMP Values(4,'Margarita','Perez',1);
insert into EMP Values(5,'Steven','Rodriguez',3);
insert into EMP Values(6,'Rosy','Buchanan',5);
insert into EMP Values(7,'Maya','Sumaya',6);
insert into EMP Values(8,'Roberto','Martinez',3);
insert into EMP Values(9,'Raùl','Alvarado',3);
insert into EMP Values(10,'Arturo','Lopez',3);

rem 
rem despleagar las tuplas 
rem 
select * from emp;
PROMPT Despliega los empleados del jefe
select first_name,last_name
from EMP
where reporta_a=1;

select empleado_id,first_name,last_name,reporta_a
from EMP
where reporta_a=1;


PROMPT Despliega jefe
select first_name, last_name, reporta_a
from EMP
where empleado_id=1;

rem 
select empleado_id,first_name, last_name, reporta_a
from EMP
where reporta_a is NULL;

PROMPT Despliega jefe
column first_name format a12;
column last_name format a12;
column reporta format a12;
select first_name,last_name,
	NVL(TO_CHAR(REPORTA_A), 'SIN JEFE') REPORTA
from EMP
where reporta_a is NULL;


select first_name,last_name,
	NVL(TO_CHAR(REPORTA_A), 'SIN JEFE') REPORTA
from EMP;


select first_name,last_name
from emp
where reporta_a=NULL;

select first_name,last_name
from emp
where reporta_a IS NULL;

PROMPT Declara la llave foranea
alter table EMP
add constraint FK_EMP_REFLEXIVA foreign key
(REPORTA_A)
references EMP (EMPLEADO_ID);

PROMPT Habilita la llave foranea
alter table EMP
enable constraint
FK_EMP_REFLEXIVA;

PROMPT Intente borrar al jefe
delete from EMP
where empleado_id=1;

PROMPT Deshabilita la llave foranea
alter table EMP
disable constraint
FK_EMP_REFLEXIVA;

PROMPT Intente borrar al jefe
delete from EMP
where empleado_id=1;

PROMPT Inserta al jefe
insert into EMP Values (1,'Nancy','Delgado');

insert into EMP Values (1,'Nancy','Delgado',null);

PROMPT Despliega todas las tuplas
select * from EMP;
column table_name format a14
column owner format a14
COLUMN CONSTRAINT_NAME FORMAT A30
select owner,table_name,constraint_name,constraint_type,
deferrable,deferred
from user_constraints
where table_name='EMP';

COL status format a10
select owner,table_name,constraint_name,constraint_type,
deferrable,deferred,status
from user_constraints
where table_name='EMP';


rem damos de alta un nuevo jefe 

insert into EMP Values(1,'Juan','Rodriguez',NULL);


rem *****************
rem despliega con 
rem consultas Jerarquicas
rem *****************
select empleado_id,first_name
	last_name,reporta_a
	from emp
	where reporta_a is null;
	
select empleado_id,first_name
	last_name,reporta_a
	from emp
	where reporta_a is null;
	
rem    REVISAR
REM    REVISAR
REM REVISAR

select E.last_name "Empleado",	R.last_name "Jefe "
	from emp E,emp R
	where E.empleado_id = R.reporta_a;
	
REM NO ES CORRECTO HACER EST QUERY
REM *******************************

COL ID_EMP FORMAT 9999
COL "Empleado" FORMAT A12
COL "Emp_LM"   FORMAT A12
COL "ID_JEFE"  FORMAT 9999
COL "ID_SUB"   FORMAT 999999
COL "GERENTE"  FORMAT A12
select E.EMPLEADO_ID ID_EMP, 
	   E.FIRST_name "Empleado",
	   E.last_name "Emp_LM",
	   R.REPORTA_A ID_JEFE,
	   R.EMPLEADO_ID "ID_SUB",
       R.FIRST_name "GERENTE",
       R.last_name "Jefe_LM "
	from emp E,emp R
	where E.empleado_id = R.reporta_a;
	
REM *****************************
REM 
REM *****************************

col id_emp format 9999999;	

select E.EMPLEADO_ID ID_EMP, 
	   E.FIRST_name "Empleado",
	   E.last_name "Emp_LM",
	   R.REPORTA_A ID_JEFE
	from emp E,emp R
	where E.empleado_id = R.empleado_id
	order by 1;
	
rem 

select E.EMPLEADO_ID ID_EMP, 
	   E.FIRST_name "Empleado",
	   E.last_name "Emp_LM",
	   R.REPORTA_A ID_JEFE
	from emp E,emp R
	where E.empleado_id = R.empleado_id
	order by 1;
	
	
rem DESPLEGAR LOS EMPLEDOS QUE 
REM   NO TIENEN SUBORDINADOS 


select E.EMPLEADO_ID ID_EMP, 
	   E.FIRST_name "Empleado",
	   E.last_name "Emp_LM",
	   E.REPORTA_A ID_JEFE
			FROM EMP E
	   where E.EMPLEADO_ID NOT IN
		(SELECT REPORTA_A FROM EMP
		WHERE REPORTA_A IS NOT NULL);
		
REMARKS (Mishra  Beaulieu, 202  ,162)
REMARKS "Libro Mastering Oracle ed O'Really"
 		
SELECT REPORTA_A FROM EMP
		WHERE REPORTA_A IS NOT NULL;
	
	
select E_TOP.FIRST_name, E_2.FIRST_name,
       E_3.FIRST_name,   E_4.FIRST_name,
	   E_5.FIRST_name
	   FROM EMP E_TOP,EMP E_2,EMP E_3, EMP E_4, EMP E_5
	   WHERE E_TOP.REPORTA_A IS NULL
	   AND E_TOP.EMPLEADO_ID = E_2.REPORTA_A (+)
	   AND E_2.EMPLEADO_ID   = E_3.REPORTA_A (+)
	   AND E_3.EMPLEADO_ID   = E_4.REPORTA_A (+)
	   AND E_4.EMPLEADO_ID   = E_5.REPORTA_A (+);
	   
REM DESPLEGUEMOS  LAS TUPLAS DEL PRODUCTO CARTESIANO  
select E_TOP.FIRST_name, E_2.FIRST_name,
       E_3.FIRST_name,   E_4.FIRST_name,
	   E_5.FIRST_name
	   FROM EMP E_TOP,EMP E_2,EMP E_3, EMP E_4, EMP E_5;
REM CONTEMOS LAS TUPLAS DEL PRODUCTO CARTESIANO
select COUNT(*)
	   FROM EMP E_TOP,EMP E_2,EMP E_3, EMP E_4, EMP E_5;	   
	   
REM LAS SIGUIENTES SON INSTRUCCIONES 
REM COMO EXTENSIONES DE ORACLE

SELECT empleado_id,FIRST_name,REPORTA_A
	FROM EMP
	START WITH REPORTA_A IS NULL
	CONNECT BY PRIOR EMPLEADO_ID = REPORTA_A;
	
REM PSEUDOCOLUMNA LEVEL
REM (Mishra  Beaulieu,2002, 167)

SELECT LEVEL, FIRST_name, EMPLEADO_ID, REPORTA_A
	FROM EMP
	START WITH REPORTA_A IS NULL
	CONNECT BY REPORTA_A = PRIOR EMPLEADO_ID;
	
SELECT LEVEL, FIRST_name, EMPLEADO_ID,
		REPORTA_A
	FROM EMP
	START WITH REPORTA_A IS NULL
	CONNECT BY REPORTA_A = PRIOR EMPLEADO_ID;
 
 SELECT COUNT(DISTINCT LEVEL)
	FROM EMP
	START WITH REPORTA_A IS NULL
	CONNECT BY PRIOR EMPLEADO_ID = REPORTA_A;
	
	
 SELECT LEVEL, COUNT(EMPLEADO_ID)
	FROM EMP
	START WITH REPORTA_A IS NULL
	CONNECT BY PRIOR EMPLEADO_ID = REPORTA_A
	GROUP BY LEVEL;
	
REM DESPLEGAR LAS TUPLAS EN ORDEN JERARQUICO
SELECT LEVEL, 
	LPAD('   ', 2*(LEVEL - 1))||FIRST_name "EMPLEADO", EMPLEADO_ID, REPORTA_A
	FROM EMP
	START WITH REPORTA_A IS NULL
	CONNECT BY PRIOR EMPLEADO_ID = REPORTA_A;
	
REM ORDER BY LEVEL

SELECT LEVEL, 
	LPAD('   ', 2*(LEVEL - 1))||FIRST_name "EMPLEADO", EMPLEADO_ID, REPORTA_A
	FROM EMP
	START WITH REPORTA_A IS NULL
	CONNECT BY PRIOR EMPLEADO_ID = REPORTA_A
	ORDER BY LEVEL;
	
	
 	


PROMPT Habilita la llave foranea
alter table EMP
enable constraint
FK_EMP_REFLEXIVA;

rem apliquemos los queries de 
rem libro mastering oracle 
rem  
	
	
rem spool off