CREATE TABLE alumno(
    tel VARCHAR(12) CONSTRAINT alumno_tel CHECK (REGEXP_LIKE(tel,'([[:digit:]]{3})-([[:digit:]]{3})-([[:digit:]]{4})'))
);
ALTER TABLE alumno ADD CONSTRAINT tel_pk PRIMARY KEY(tel);

INSERT INTO alumno VALUES (442-555-4556);
INSE


