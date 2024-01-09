drop table athlete_sport cascade constraints; 
drop table athlete cascade constraints;
drop table tennis cascade constraints;
drop table golf cascade constraints;
drop table football cascade constraints;

create table athlete(
    ssno varchar2(11), 
    weight number(3), 
    name varchar2(10), 
    gender varchar(1), 
    height number(4,2)
); 
create table athlete_sport(
    ssno varchar2(11), 
    sport varchar2(10)
);
create table tennis(
    ssno varchar2(11),
    state_ranking number(3)
); 
create table golf(
    ssno varchar2(11),
    handicap number(3)
); 
create table football(
    ssno varchar2(11), 
    position varchar2(11)
); 
-- ------------------------------------------------------------------
ALTER TABLE athlete
    ADD CONSTRAINT athlete_PK
    PRIMARY KEY (ssno); 

ALTER TABLE athlete_sport
    ADD CONSTRAINT athlete_sport_PK
    PRIMARY KEY (ssno, sport);

ALTER TABLE tennis 
    ADD CONSTRAINT tennis_PK
    PRIMARY KEY (ssno);

ALTER TABLE golf
    ADD CONSTRAINT golf_PK
    PRIMARY KEY (ssno);

ALTER TABLE football
    ADD CONSTRAINT football_PK
    PRIMARY KEY (ssno);
-- ------------------------------------------------------------------
ALTER TABLE athlete_sport 
    ADD CONSTRAINT athlete_sport_ssno_FK
    FOREIGN KEY (ssno)
    REFERENCES athlete (ssno); 
ALTER TABLE TENNIS 
    ADD CONSTRAINT tennis_ssno_FK
    FOREIGN KEY (ssno)
    REFERENCES athlete (ssno);
ALTER TABLE GOLF ADD CONSTRAINT golf_ssno_FK
    FOREIGN KEY (ssno)
    REFERENCES athlete (ssno);
ALTER TABLE FOOTBALL ADD CONSTRAINT football_ssno_FK
    FOREIGN KEY (ssno)
    REFERENCES athlete (ssno);
-- ------------------------------------------------------------------
ALTER TABLE ATHLETE 
ADD CONTRAINT ATHLETE_GENDER CHECK (GENDER IN ('M', 'F'));

ALTER TABLE ATHLETE 
ADD CONSTRAINT ATHLETE_HEIGHT CHECK (HEIGHT < 7); 

ALTER TABLE athlete_sport
ADD CONSTRAINT athlete_sport_sport CHECK (sport IN ('GOLF', 'FOOTBALL', 'TENNIS'));

ALTER TABLE TENNIS 
ADD CONSTRAINT TENNIS_RANKING CHECK (state_ranking in (1,2,3,4));

ALTER TABLE GOLF
ADD CONSTRAINT GOLF_HANDICAP CHECK (handicap < 7);

ALTER TABLE FOOTBALL
ADD CONSTRAINT FOOTBALL_POSITION CHECK (position IN ('TACKLE', 'QUARTERBACK', 'FULLBACK'));

-- ------------------------------------------------------------------
INSERT INTO athlete VALUES ('239-92-0993',140 ,  'Kumar', 'M', 5.95); 
INSERT INTO athlete VALUES ('398-08-0928',200, 'Kelvin', 'M', 5.95);
INSERT INTO athlete VALUES ('322-00-1234', 135, 'Sarah', 'F', 5.60);
INSERT INTO athlete VALUES ('873-97-9877', 165, 'Arjun', 'M', 6.01); 
INSERT INTO athlete VALUES ('876-09-9873', 145, 'Deesha', 'F', 5.5); 

INSERT INTO athlete_sport VALUES ('239-92-0993', 'GOLF');
INSERT INTO athlete_sport VALUES ('398-08-0928', 'FOOTBALL');
INSERT INTO athlete_sport VALUES ('322-00-1234', 'TENNIS');
INSERT INTO athlete_sport VALUES ('873-97-9877', 'GOLF');
INSERT INTO athlete_sport VALUES ('876-09-9873', 'TENNIS');
INSERT INTO athlete_sport VALUES ('876-09-9873', 'GOLF'); 

INSERT INTO tennis VALUES ('322-00-1234', 23); 
INSERT INTO tennis VALUES ('876-09-9873', 47); 
INSERT INTO tennis VALUES ('332-00-1234', 2);
INSERT INTO tennis VALUES ('876-09-9873', 4); 

INSERT INTO golf VALUES ('332-00-1234', 3);
INSERT INTO golf VALUES ('876-09-9873', 1);

INSERT INTO football VALUES ('398-08-0928', 'TACKLE');
INSERT INTO football VALUES ('239-92-0993', 'QUARTERBACK');
INSERT INTO football VALUES ('398-08-0928', 'FULLBACK'); -- ESTE NO DEBERIA DEJARLO PORQUE YA EXISTE EL SSNO

-- ------------------------------------------------------------------
SELECT * FROM athlete;
SELECT * FROM athlete_sport;
SELECT * FROM tennis;
SELECT * FROM golf;
SELECT * FROM football;

SELECT * FROM athlete_sport WHERE sport = 'GOLF';
SELECT * FROM athlete_sport WHERE sport = 'FOOTBALL';
SELECT * FROM athlete_sport WHERE sport = 'TENNIS';

SELECT * FROM athlete_sport WHERE ssno = '876-09-9873';

SELECT * FROM athlete_sport WHERE ssno = '876-09-9873' AND sport = 'GOLF';
SELECT * FROM athlete_sport WHERE ssno = '876-09-9873' AND sport = 'FOOTBALL';
SELECT * FROM athlete_sport WHERE ssno = '876-09-9873' AND sport = 'TENNIS';

SELECT * FROM athlete_sport WHERE ssno = '876-09-9873' AND sport = 'GOLF' OR sport = 'FOOTBALL';
SELECT * FROM athlete_sport WHERE ssno = '876-09-9873' AND sport = 'GOLF' OR sport = 'TENNIS';
-- ------------------------------------------------------------------