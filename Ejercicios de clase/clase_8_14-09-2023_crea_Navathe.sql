spool C:\Users\ssali\salida_nava.txt

rem ************************************
rem file: dropcompania.sql
rem descripción: utlizada para crear el esquema compania
rem              crea cada una de las entidades
rem              con sus restricciones 
rem           entre otras las de integridad  referencial
rem    creado el 10 de octubre de 2020
rem     actualizado el 28 de febrero de 2022
REM     actualizado el 14 de septiembre de 2023
rem ************************************
prompt  ******************************
rem reviar el formato de la fecha
COL PARAMETER FORMAT A29;
COL VALUE     FORMAT A29;

SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS
     ORDER BY 1;
	 
rem alterar el formato de la fecha 
alter session set nls_date_format = 'YYYY-MM-DD';	 
	 
drop table employee   cascade constraints;
drop table department cascade constraints ;
drop table dept_locations cascade constraints ;
drop table project    cascade constraints ;
drop table works_on   cascade constraints ;
drop table dependent  cascade constraints;

prompt  crea la tabla 



set linesize 300
set pagesize 90
set feddback on
set colsep ' ||'
rem   alt 176   sergio 
set colsep  '|=|'
set null s/Datos

clear screen 


CREATE TABLE EMPLOYEE
( Fname           VARCHAR2(8)      CONSTRAINT EMP_FNAME_NN NOT NULL,
  Minit           VARCHAR2(1),
  Lname           VARCHAR2(10)     CONSTRAINT EMP_LNAME_NN    NOT NULL,
  Ssn             VARCHAR2(9)      CONSTRAINT EMP_SSN_NN      NOT NULL,
  Bdate           DATE,
  Address         VARCHAR2(23),
  Sex             VARCHAR2(1),
  Salary          NUMBER (5,0),
  Super_ssn       VARCHAR2(9),
  Dno             NUMBER (2)       CONSTRAINT EMP_DNO_NN      NOT NULL);
--   ,
-- PRIMARY KEY   (Ssn));

prompt crea la tabla DEPARTMENT
CREATE TABLE DEPARTMENT
( Dname           VARCHAR(15)      CONSTRAINT DEP_DNAME_NN   NOT NULL,
  Dnumber         NUMBER(1)        CONSTRAINT DEP_DNUMBER_NN NOT NULL,
  Mgr_ssn         VARCHAR2(9)      CONSTRAINT DEP_MGR_SSN_NN NOT NULL,
  Mgr_start_date  DATE);
--  ,
--PRIMARY KEY (Dnumber),
--UNIQUE      (Dname),
-- KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn) );

PROMPT CREA LA TABLA dept_LOCATIONS 
CREATE TABLE DEPT_LOCATIONS
( Dnumber         NUMBER(1)       CONSTRAINT LOC_DNUM_NN NOT NULL,
  Dlocation       VARCHAR2(15)    CONSTRAINT LOC_LOC_NN  NOT NULL);
-- ,
-- PRIMARY KEY (Dnumber, Dlocation),
-- FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) );

PROMPT CREA  LA TABLA PROJECT 
CREATE TABLE PROJECT
( Pname           VARCHAR2(15),
  Pnumber         NUMBER(2),
  Plocation       VARCHAR2(15),
  Dnum            NUMBER(1));
--  ,
-- PRIMARY KEY (Pnumber),
-- UNIQUE      (Pname),
-- FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) );

PROMPT CREA LA TABLA WORKS_ON


CREATE TABLE WORKS_ON
( Essn            VARCHAR2(9)   CONSTRAINT WKSON_ESSN_NN    NOT NULL,
  Pno             NUMBER(2)     CONSTRAINT WKSON_PNO_NN     NOT NULL,
  Hours           NUMBER(4,1)   CONSTRAINT WKSON_HOURS_NN   NOT NULL);
-- ,
-- PRIMARY KEY (Essn, Pno),
--  FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
-- FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) );

PROMPT CREA LA TABLA DEPARTMENT 
CREATE TABLE DEPENDENT
( Essn            VARCHAR2(9)    CONSTRAINT DEPEN_ESSN_NN    NOT NULL,
  Dependent_name  VARCHAR2(15)   CONSTRAINT DEPEN_NAME_NN    NOT NULL,
  Sex             VARCHAR2(1),
  Bdate           DATE,
  Relationship    VARCHAR2(8));
--  ,
-- PRIMARY KEY (Essn, Dependent_name),
-- FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) );

PROMPT POBLANDO LAS TABLAS DEL ESQUEMA COMPANIA
REM ***************************************
REM MODIFICAR EL FORMATO FECHA DE LA SESSION 
alter session set nls_date_format = 'YYYY-MM-DD';
REM 
REM ****************************************
REM POBLAR LA TABLA EMPLOYEE
REM ****************************************
REM
INSERT INTO EMPLOYEE VALUES  ('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston TX','M',30000,333445555,5);
INSERT INTO EMPLOYEE VALUES  ('Franklin','T','Wong',333445555,'1965-12-08','638 Voss, Houston TX','M',40000,888665555,5);
INSERT INTO EMPLOYEE VALUES  ('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring TX','F',25000,987654321,4);
INSERT INTO EMPLOYEE VALUES  ('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire TX','F',43000,888665555,4);
INSERT INTO EMPLOYEE VALUES  ('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble TX','M',38000,333445555,5);
INSERT INTO EMPLOYEE VALUES  ('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston TX','F',25000,333445555,5);
INSERT INTO EMPLOYEE VALUES  ('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston TX','M',25000,987654321,4);
INSERT INTO EMPLOYEE VALUES  ('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston TX','M',55000,null,1);

REM **************************************
REM POBLAR LA TABLA DEPARTMENT
REM **************************************
INSERT INTO DEPARTMENT VALUES ('Research',5,333445555,'1988-05-22');
INSERT INTO DEPARTMENT VALUES ('Administration',4,987654321,'1995-01-01');
INSERT INTO DEPARTMENT VALUES ('Headquarters',1,888665555,'1981-06-19');

REM ******************************
REM POBLAR LA TABLA PROJECT 
REM 
INSERT INTO PROJECT VALUES ('ProductX',1,'Bellaire',5);
INSERT INTO PROJECT VALUES ('ProductY',2,'Sugarland',5);
INSERT INTO PROJECT VALUES ('ProductZ',3,'Houston',5);
INSERT INTO PROJECT VALUES ('Computerization',10,'Stafford',4);
INSERT INTO PROJECT VALUES ('Reorganization',20,'Houston',1);
INSERT INTO PROJECT VALUES ('Newbenefits',30,'Stafford',4);

REM ******************************************
REM POBLAR LA TABLA  WORKS_ON
REM ******************************************

INSERT INTO WORKS_ON VALUES (123456789,1,32.5);
INSERT INTO WORKS_ON VALUES (123456789,2,7.5);
INSERT INTO WORKS_ON VALUES (666884444,3,40.0);
INSERT INTO WORKS_ON VALUES (453453453,1,20.0);
INSERT INTO WORKS_ON VALUES (453453453,2,20.0);
INSERT INTO WORKS_ON VALUES (333445555,2,10.0);
INSERT INTO WORKS_ON VALUES (333445555,3,10.0);
INSERT INTO WORKS_ON VALUES (333445555,10,10.0);
INSERT INTO WORKS_ON VALUES (333445555,20,10.0);
INSERT INTO WORKS_ON VALUES (999887777,30,30.0);
INSERT INTO WORKS_ON VALUES (999887777,10,10.0);
INSERT INTO WORKS_ON VALUES (987987987,10,35.0);
INSERT INTO WORKS_ON VALUES (987987987,30,5.0);
INSERT INTO WORKS_ON VALUES (987654321,30,20.0);
INSERT INTO WORKS_ON VALUES (987654321,20,15.0);
INSERT INTO WORKS_ON VALUES (888665555,20,16.0);

REM *******************************************
REM POBLAR LA TABLA DEPENDENT
REM *******************************************

INSERT INTO DEPENDENT VALUES (333445555,'Alice','F','1986-04-04','Daughter');
INSERT INTO DEPENDENT VALUES (333445555,'Theodore','M','1983-10-25','Son');
INSERT INTO DEPENDENT VALUES (333445555,'Joy','F','1958-05-03','Spouse');
INSERT INTO DEPENDENT VALUES (987654321,'Abner','M','1942-02-28','Spouse');
INSERT INTO DEPENDENT VALUES (123456789,'Michael','M','1988-01-04','Son');
INSERT INTO DEPENDENT VALUES (123456789,'Alice','F','1988-12-30','Daughter');
INSERT INTO DEPENDENT VALUES (123456789,'Elizabeth','F','1967-05-05','Spouse');

REM *******************************************
REM POBLAR LA TABLA  DEP_LOCATIONS
REM *******************************************

INSERT INTO DEPT_LOCATIONS VALUES (1,'Houston');
INSERT INTO DEPT_LOCATIONS VALUES (4,'Stafford');
INSERT INTO DEPT_LOCATIONS VALUES (5,'Bellaire');
INSERT INTO DEPT_LOCATIONS VALUES (5,'Sugarland');
INSERT INTO DEPT_LOCATIONS VALUES (5,'Houston');

select * from employee;
select * from department;
select * from project;
select * from works_on;
select * from dependent;
select * from dept_LOCATIONS;

REM(employee, department, project, works_on, dependent, REM dept_LOCATIONS);


REM ********************************************
REM DECLARA LAS RESTRICCIONES 
REM ********************************************

PROMPT CREA LA PRIMARY KEY EN EMPLOYEE 

ALTER TABLE EMPLOYEE 
		ADD CONSTRAINT EMPLOYEE_PK
				PRIMARY KEY	 (SSN);
	  
PROMPT CREA LA PRIMARY KEY, 
promp 		FOREING KEY y UNIQUE EN DEPARTMENT

ALTER TABLE DEPARTMENT 
		ADD CONSTRAINT DEPARTMENT_PK	    
		PRIMARY KEY (Dnumber);
		
ALTER TABLE DEPARTMENT		
		ADD CONSTRAINT DEPARTMENT_UNIQUE	 UNIQUE        (Dname);

ALTER TABLE DEPARTMENT		
		ADD CONSTRAINT DEPART_EMPLO_FK	 	
		FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn);

PROMPT CREA LA PRIMARY KEY y FOREING KEY EN DEPT_LOCATIONS
ALTER TABLE DEPT_LOCATIONS
		ADD CONSTRAINT DEPT_LOCATIONS_PK	 
		PRIMARY KEY (Dnumber, Dlocation);
ALTER TABLE DEPT_LOCATIONS
		ADD CONSTRAINT DEPT_LOCATIONS_DEPT_FK    
		FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber);
PROMPT CREA PRIMARY KEY FOREING KEY y UNIQUE EN PROJECT 
ALTER TABLE PROJECT
		ADD CONSTRAINT PROJECT_PK	  	
		PRIMARY KEY (Pnumber);
ALTER TABLE PROJECT
		ADD CONSTRAINT PROJECT_UNIQUE	 	
		UNIQUE      (Pname);
ALTER TABLE PROJECT
		ADD CONSTRAINT PROJECT_DEPART_FK  	FOREIGN KEY (Dnum) 
		    REFERENCES DEPARTMENT(Dnumber)
		ADD CONSTRAINT PNAME_NN            CHECK (PNAME IS NOT NULL)
		ADD CONSTRAINT PNUMBER_NN          CHECK (PNUMBER IS NOT NULL)
		ADD CONSTRAINT DNUM_NN             CHECK (DNUM IS NOT NULL);    



PROMPT CREA LA PRIMARY KEY EN WORKS_ON
ALTER TABLE WORKS_ON
		ADD CONSTRAINT WORKS_ON_PK 		  	PRIMARY KEY (Essn, Pno)
		ADD CONSTRAINT WORKS_ON_EMP_FK 	  	FOREIGN KEY (Essn) 
		    REFERENCES EMPLOYEE(Ssn)
		ADD CONSTRAINT WORKS_ON_PROJ_FK       FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber);

PROMPT CREA LA PRIMARY KEY EN DEPENDENT
ALTER TABLE DEPENDENT
		ADD CONSTRAINT DEPENDENT_PK           PRIMARY KEY (Essn, Dependent_name)
		ADD CONSTRAINT DEPENDENT_EMP_FK       FOREIGN KEY (Essn) 
		    REFERENCES EMPLOYEE(Ssn);		


PROMPT DESPLIEGA CIFRAS DE CONTROL
col "Entidad"  format   a55
select 'Dependent' "Entidad", count(*) total from DEPENDENT;     
select 'Works_on' "Entidad", count(*) total 
	from WORKS_ON;      
select 'Project' "Entidad", count(*) total 
	from PROJECT;       
select 'Dept_Locations' "Entidad", count(*) total 
	from DEPT_LOCATIONS;
select 'Department' "Entidad", count(*) total 
	from DEPARTMENT;    
select 'Employee' "Entidad", count(*) total 
	from EMPLOYEE; 


rem despliega los atributos de cada entidad


select ' ',essn,pno,hours 
		from works_on;

select ' ',pname,pnumber, plocation, dnum
		from project;

select  ' ',dnumber, dlocation
	from dept_locations;
	
select  ' ', dname, dnumber,
	mgr_ssn, mgr_start_date
	from department;
		
select ' ', ssn,fname, lname, bdate,
	super_ssn
	from employee;
	
select ' ',Essn, Dependent_name,Sex 
          Bdate, Relationship 
		from dependent;
		
column table_name format a14
column owner format a14		
COLUMN status format a10
COLUMN CONSTRAINT_NAME FORMAT A23
select owner,table_name,constraint_name,constraint_type,
deferrable,deferred,status
from user_constraints
where table_name IN 
('EMPLOYEE','DEPARTMENT','PROJECT','WORKS_ON','DEPENDENT','DEPT_LOCATIONS');


 spool off 	
