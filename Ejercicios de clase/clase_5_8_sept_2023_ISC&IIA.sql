
rem **********************************
rem primera etapa sin restricciones
rem ********************************

drop table departments;
create table departments (
	department_id number (4,0),
	department_name varchar2(15),
	manager_id number(4,0),
	location_id number (5,0));
	
drop table employees;
create table employees(
	employee_id number (4,0),
	last_name   varchar2(15),
	email varchar2(12),
	hire_date  date,
	job_id varchar2(10),
	manager_id  number(4,0),
	department_id  number(2));
	
	
rem poblar la tabla  sin restricciones 
rem con datos validos 
rem con datos que no cumpliran las restricciones
rem 

REM POBLAR DEPARTAMENTS	
insert into departments values(60,'IT',103,1400);
insert into departments values(90,'Executive',100,1700);

REM POBLEMOS DOS VECES LA TABLA DE DEPARTMENTOS 
insert into departments values(60,'IT',103,1400);
insert into departments values(90,'Executive',100,1700);




REM POBLAR EMPLOYEES
insert into employees	 values
	(100,'King','SKING', TO_DATE('17-JUN-87','DD-MON-YY'),'AD-PRES',NULL,90);
insert into employees	 values
	(101,'Kochhar','NKOCHHAR', TO_DATE('21-SEP-89','DD-MON-YY'),'AD-VP',100,90);
insert into employees	 values
	(102,'De Hann','LDEHANN', TO_DATE('13-ENE-93','DD-MON-YY'),'AD-VP',100,90);
insert into employees	 values
	(103,'Hunold','AHUNOLD', TO_DATE('3-ENE-90','DD-MON-YY'),'IT_PROG',102,60);
	
rem cofigura linea y separación de columnas 

set colsep '| * |'
set linesize 250
set pagesize 99



rem desplegar las tablas
select * from departments;
select * from employees;
	
	
/*	
PROMPT Creating Primary Key on 'EMPLOYEE'

  ALTER TABLE 	EMPLOYEES
 ADD CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY 
  (EMPLOYEE_ID);
  
PROMPT Creating Primary Key on 'DEPARTMENTS'
ALTER TABLE 	DEPARTMENTS 
 ADD CONSTRAINT DEPARTMENTS_ID_PK PRIMARY KEY 
  (DEPARTMENT_ID);
  
ALTER TABLE 	EMPLOYEES
 ADD CONSTRAINT EMPLOYEE_DEPT_PK FOREIGN KEY 
  (department_id)  REFERENCES DEPARTMENTS
  (DEPARTMENT_ID);
*/ 
  
REM  *****************************************
REM SEGUNDA ETAPA
REM ******************************************

REM **********************************
REM BORREMOS LAS TABLAS CON TODO Y ESTRUCTURA
REM *************************************

DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENTS CASCADE CONSTRAINTS;


REM *******************************
REM ASEGUREMOS QUE ESTA EN ESPAÑOL
REM *****************************

alter session set nls_date_language = 'SPANISH';

create table departments (
	department_id number (4,0),
	department_name varchar2(15),
	manager_id number(4,0),
	location_id number (5,0));
	
create table employees(
	employee_id number (4,0),
	last_name   varchar2(15),
	email varchar2(12),
	hire_date  date,
	job_id varchar2(10),
	manager_id  number(4,0),
	department_id  number(2));
	
	


	
REM POBLAR DEPARTAMENTS	
insert into departments values(60,'IT',103,1400);
insert into departments values(90,'Executive',100,1700);

REM POBLAR EMPLOYEES
insert into employees	 values
	(100,'King','SKING', TO_DATE('17-JUN-87','DD-MON-YY'),'AD-PRES',NULL,90);
insert into employees	 values
	(101,'Kochhar','NKOCHHAR', TO_DATE('21-SEP-89','DD-MON-YY'),'AD-VP',100,90);
insert into employees	 values
	(102,'De Hann','LDEHANN', TO_DATE('13-ENE-93','DD-MON-YY'),'AD-VP',100,90);
insert into employees	 values
	(103,'Hunold','AHUNOLD', TO_DATE('3-ENE-90','DD-MON-YY'),'IT_PROG',102,60);
	
select * from departments;

select * from employees;

REM ******************************************
REM PROBEMOS DECLARAR LAS RESTRICCIONES DE PK  &  FK
REM ******************************************

PROMPT Creating Primary Key on 'EMPLOYEE'

  ALTER TABLE 	EMPLOYEES
 ADD CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY 
  (EMPLOYEE_ID);
  
PROMPT Creating Primary Key on 'DEPARTMENTS'
ALTER TABLE 	DEPARTMENTS 
 ADD CONSTRAINT DEPARTMENTS_ID_PK PRIMARY KEY 
  (DEPARTMENT_ID);
 
PROMPT Creating FOREIGN Key on 'EMPLOYEES'
PROMPT HACIENDO REFERENCIA A DEPARMENTS
PROMPT ****************************
 
ALTER TABLE 	EMPLOYEES
 ADD CONSTRAINT EMPLOYEE_DEPT_PK FOREIGN KEY 
  (department_id)  REFERENCES DEPARTMENTS
  (DEPARTMENT_ID);
 
insert into employees	 values
	(207,'Ashdown','AASHDOWN', TO_DATE('17-DIC-07','DD-MON-RR'),'MK_MAN',100,99);
	
	
insert into employees	 values
	(208,'Green','BGRENN', TO_DATE('17-DIC-07','DD-MON-YY'),'AC_MGR',101,NULL);

REM *************************************
REM TERCERA ETAPA 
REM *************************************

REM DROP TABLES Y DECLAREMOS RESTRICCIONES
REM 
REM **********************************
REM BORREMOS LAS TABLAS CON TODO Y ESTRUCTURA
REM *************************************

DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENTS CASCADE CONSTRAINTS;

alter session set nls_date_language = 'SPANISH';

create table departments (
	department_id number (4,0),
	department_name varchar2(15),
	manager_id number(4,0),
	location_id number (5,0));
	
create table employees(
	employee_id number (4,0),
	last_name   varchar2(15),
	email varchar2(12),
	hire_date  date,
	job_id varchar2(10),
	manager_id  number(4,0),
	department_id  number(2));
	

 
 
  
PROMPT Creating Primary Key on 'DEPARTMENTS'
ALTER TABLE 	DEPARTMENTS 
 ADD CONSTRAINT DEPARTMENTS_ID_PK PRIMARY KEY 
  (DEPARTMENT_ID);
 
PROMPT Creating Primary Key on 'EMPLOYEES' 
 ALTER TABLE 	EMPLOYEES
 ADD CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY 
  (EMPLOYEE_ID);

PROMPT Creating FOREIGN Key on 'EMPLOYEES'
PROMPT HACIENDO REFERENCIA A DEPARMENTS
PROMPT ****************************
  
ALTER TABLE 	EMPLOYEES
 ADD CONSTRAINT EMPLOYEE_DEPT_PK FOREIGN KEY 
  (department_id)  REFERENCES DEPARTMENTS
  (DEPARTMENT_ID);
  
REM DECLAREMOS LAS RESTRICCIONES DE NOT NULL & DE CHECK

ALTER TABLE 	EMPLOYEES
 MODIFY (LAST_NAME CONSTRAINT EMP_LAST_NAME_NN NOT NULL)
 MODIFY (EMAIL     CONSTRAINT EMP_EMAIL_NN NOT NULL)
 MODIFY (JOB_ID    CONSTRAINT EMP_JOB_ID_NN NOT NULL);
 
ALTER TABLE 	DEPARTMENTS
 MODIFY (DEPARTMENT_NAME CONSTRAINT EMP_DEPT_NAME_NN NOT NULL)
 MODIFY (MANAGER_ID     CONSTRAINT EMP_MANAG_NN NOT NULL)
 MODIFY (LOCATION_ID     CONSTRAINT EMP_LOC_ID_NN NOT NULL);
 
 

ALTER TABLE DEPARTMENTS 
ADD CONSTRAINT DEP_ID_RANGO CHECK ( DEPARTMENT_ID BETWEEN 60 AND 95 ) DEFERRABLE
;
 
ALTER TABLE EMPLOYEES
 ADD ( CONSTRAINT EMP_EMAIL_UK UNIQUE 
  (EMAIL));
  

REM POBLAR DEPARTAMENTS	
insert into departments values(60,'IT',103,1400);
insert into departments values(90,'Executive',100,1700);

REM POBLAR EMPLOYEES
insert into employees	 values
	(100,'King','SKING', TO_DATE('17-JUN-87','DD-MON-YY'),'AD-PRES',NULL,90);
insert into employees	 values
	(101,'Kochhar','NKOCHHAR', TO_DATE('21-SEP-89','DD-MON-YY'),'AD-VP',100,90);
insert into employees	 values
	(102,'De Hann','LDEHANN', TO_DATE('13-ENE-93','DD-MON-YY'),'AD-VP',100,90);
insert into employees	 values
	(103,'Hunold','AHUNOLD', TO_DATE('3-ENE-90','DD-MON-YY'),'IT_PROG',102,60);
	
select * from departments;

select * from employees;

insert into employees	 values
	(207,'Ashdown','AASHDOWN', TO_DATE('17-DIC-07','DD-MON-RR'),'MK_MAN',100,99);

insert into employees	 values	
    (207,'Ashdown', 'AASHDOWN', TO_DATE('01-DIC-07', 'DD-MON,YY'), 'IT_PROG', 400, 60);	
	
	
	
	
  

REM ESTA TUPLA VIOLA LA INTEGRIDAD REFERENCIAL 
REM PORQUE EL 99 NO ESTA PRESENTE EN
REM LA TABLA REFERENCIADA COMO LLAVE PRIMARIA

alter session set nls_date_language = 'SPANISH';
alter session set nls_date_language = 'ENGLISH';
alter session set nls_date_language = 'FRENCH';


insert into employees	 values
	(207,'Ashdown','AASHDOWN', TO_DATE('17-DIC-07','DD-MON-RR'),'MK_MAN',100,99);
	
	
insert into employees	 values
	(208,'Green','BGRENN', TO_DATE('17-DIC-07','DD-MON-YY'),'AC_MGR',101,NULL);

insert into employees	 values	
    (207,'Ashdown', 'AASHDOWN', TO_DATE('01-DIC-07', 'DD-MON,YY'), 'IT_PROG', 400, 60);
	
	
	
REM REVISAR LAS RESTRICCIONES DE NULL & NOT NULL

SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES ORDER BY 1;
SELECT * FROM DEPARTMENTS;

REM ***************************************
REM ***************************************
REM 

/*
REM CONSULTEMOS EL DICCIONARIO DE DATOS 
REM EN LAS TABLAS DE CONSTRAINTS 
REM 
COL TABLE_NAME FORMAT A30
SELECT TABLE_NAME FROM DICT 
	WHERE TABLE_NAME LIKE '%CONS%';
	
DESC USER_CONS_COLUMNS
DESC USER_CONSTRAINTS
*/
REM ***********************
REM DESPLEGAR USER_CONS_COLUMNS
REM ***********************
COLUMN     OWNER FORMAT A10
COLUMN     CONSTRAINT_NAME FORMAT A20
COLUMN     TABLE_NAME   FORMAT A12
COLUMN     COLUMN_NAME  FORMAT A14
COLUMN     POSITION     FORMAT 99
SELECT OWNER, CONSTRAINT_NAME, TABLE_NAME,
	COLUMN_NAME, POSITION
	FROM USER_CONS_COLUMNS
	WHERE TABLE_NAME IN ('EMPLOYEES','DEPARTMENTS');

REM ***********************
REM DESPLEGAR USER_CONS_COLUMNS
REM ***********************
	
COLUMN CONSTRAINT_NAME FORMAT A19
column table_name format a12
column owner format a9
select owner,table_name,constraint_name,constraint_type,
	deferrable,deferred
	from user_constraints
	where table_name IN ('EMPLOYEES','DEPARTMENTS');
	

	





  



	
	
	
	
