SET serveroutput ON
DROP TABLE temp;

CREATE TABLE temp (N NUMBER);

CREATE OR REPLACE TRIGGER temp_air
AFTER INSERT ON temp
FOR EACH ROW
BEGIN
dbms_output.put_line('executing temp_air');
dbms_output.put_line('==> ESTAMOS EN CLASE EN ESCOM !!!');
END;

INSERT INTO temp VALUES (10);
INSERT INTO temp VALUES (20);
INSERT INTO temp VALUES (30);
INSERT INTO temp VALUES (40);
INSERT INTO temp VALUES (50);

SELECT TABLE NAME FROM DICT;
WHERE TABLE_NAME LIKE '%TRIGG%';
------------------------------------------------------------------------------------------------------------------------


COL TABLE_NAME FORMAT a20
COL comments FORMAT a60
set colsep '||'
SELECT TABLE_NAME, COMMENTS FROM DICT
  WHERE TABLE_NAME LIKE '%TRIGGER%';

COL TRIGGER_NAME FORMAT A20
COL TRIGGER_TYPE FORMAT A20
COL TRIGGERING_EVENT FORMAT A20
COL TABLE_OWNER FORMAT A15
COL TABLE_NAME FORMAT A15

SELECT TRIGGER_NAME, TRIGGER_TYPE, STATUS, TRIGGERING_EVENT, TABLE_OWNER
FROM USER_TRIGGERS;

set serveroutput on



CREATE TABLE TEMP1(N NUMBER, M NUMBER DEFAULT 5);
CREATE OR REPLACE TRIGGER temp1_bur
BEFORE UPDATE ON TEMP1
FOR EACH ROW
BEGIN
 dbms_output.put_line('BUR old N:'||:old.n|| ' M:'||:old.M);
 dbms_output.put_line('BUR new N:'||:new.n|| ' M:'||:new.M);
END;
CREATE OR REPLACE TRIGGER temp_aur
AFTER UPDATE ON TEMP1
FOR EACH ROW
BEGIN
 dbms_output.put_line('AUR old N:'||:old.n|| ' M:'||:old.M);
 dbms_output.put_line('AUR new N:'||:new.n|| ' M:'||:new.M);
END;

Select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') fecha_actual from dual; --FECHA ACTUAL

CREATE TABLE TEMP2(X NUMBER, Y NUMBER, Z NUMBER DEFAULT 5);
drop trigger temp2_aiur; 
CREATE OR REPLACE TRIGGER temp2_aiur
AFTER INSERT OR UPDATE OF Y ON TEMP2
FOR EACH ROW
WHEN(OLD.Y IS NULL AND NEW.Y IS NOT NULL
    OR NEW.X BETWEEN 1 AND 10)
BEGIN 
  CASE 
  WHEN inserting THEN 
    dbms_output.put_line('X:='||:new.x||' Y:='||:new.y||' Z:='||:new.z||CHR(10)||'Estamos en el laboratorio de ESCOM');
    --dbms_output.put_line('Estamos en el laboratorio de ESCOM'); 
  WHEN updating THEN
    dbms_output.put_line('Y is reset from NULL'); 
  END CASE;
END;
INSERT INTO TEMP2 VALUES(1,2,3);
INSERT INTO TEMP2 VALUES(4,5,6);
INSERT INTO TEMP2 VALUES(7,8,9);

CREATE OR REPLACE TRIGGER temp2_adr
AFTER DELETE ON TEMP2
FOR EACH ROW
BEGIN 
  dbms_output.put_line(:old.x||''||:old.y||''||:old.z);
END;

-- use el usuario eer1