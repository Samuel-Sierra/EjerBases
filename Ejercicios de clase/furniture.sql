
CREATE TABLE Employee(
    ssno VARCHAR(11) NOT NULL CONSTRAINT Employee_pk PRIMARY KEY,
    fname VARCHAR(12),
    mint VARCHAR(1),
    lname VARCHAR(12),
    bdate DATE,
    addressE VARCHAR(12),
    job_type VARCHAR (12),
    UNIQUE(ssno, job_type)
);

CREATE TABLE secretary(
    ssno VARCHAR(11) NOT NULL CONSTRAINT Secretary_pk PRIMARY KEY,
    typing_speed NUMBER(5),
    FOREIGN KEY(ssno) REFERENCES Employee(ssno)
);

CREATE TABLE technician(
    ssno VARCHAR(11) NOT NULL CONSTRAINT Technician_pk PRIMARY KEY,
    tgrade NUMBER(2),
    FOREIGN KEY(ssno) REFERENCES Employee(ssno)
);

CREATE TABLE engineer(
    ssno VARCHAR(11) NOT NULL CONSTRAINT Enginner_pk PRIMARY KEY,
    eng_type VARCHAR(12),
    FOREIGN KEY(ssno) REFERENCES Employee(ssno)
);

ALTER TABLE Employee ADD CONSTRAINT Employee_ssno CHECK  (REGEXP_LIKE(ssno,'([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{4})'));
ALTER TABLE secretary ADD CONSTRAINT secretary_ssno CHECK  (REGEXP_LIKE(ssno,'([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{4})'));
ALTER TABLE technician ADD CONSTRAINT technician_ssno CHECK  (REGEXP_LIKE(ssno,'([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{4})'));
ALTER TABLE engineer ADD CONSTRAINT engineer_ssno CHECK  (REGEXP_LIKE(ssno,'([[:digit:]]{3})-([[:digit:]]{2})-([[:digit:]]{4})'));

ALTER TABLE Employee ADD CONSTRAINT Employee_jobtype CHECK(job_type IN ('secretary','technician','engineer'));
ALTER TABLE Employee ADD CONSTRAINT Employee_bdate CHECK(bdate > TO_DATE('31-12-2000','DD-MM-YYYY'));

INSERT INTO Employee VALUES ('001-01-0001','Pepe','P','Perez',TO_DATE('31-12-2002','DD-MM-YYYY'),'El Pepe','secretary');
INSERT INTO secretary VALUES ('001-01-0001',12345);

SELECT * FROM Employee;
SELECT * FROM secretary;

SELECT e.ssno, fname, lname, typing_speed FROM Employee e, secretary s WHERE e.ssno = s.ssno;