------------------------------------------------------
-- Autor       : NTT Data Sevilla
-- Descripción : Script 1 Oracle - Formación SQL
-- Responsable : Juan Alejandro Téllez Rubio
------------------------------------------------------

-- Eliminación de tablespace.
alter session set "_ORACLE_SCRIPT"=true;
DROP USER USERFPDUAL CASCADE;
DROP TABLESPACE NTTDATA_FPDUAL_ORACLE_TS INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;

-- Creación de tablespace.
CREATE TABLESPACE NTTDATA_FPDUAL_ORACLE_TS DATAFILE 'C:\Users\jtellezr\Desktop\DESARROLLO\TOOLS\Oracle\product\18.0.0\oradata\XE\nttdatadual.dbf' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

-- Generación de usuario, asignación de permisos sobre tablespace.
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER USERFPDUAL IDENTIFIED BY rootroot DEFAULT TABLESPACE NTTDATA_FPDUAL_ORACLE_TS;
GRANT CREATE SESSION, ALTER SESSION, CREATE TABLE, CREATE SEQUENCE,
CREATE TABLESPACE, UNLIMITED TABLESPACE TO USERFPDUAL;

-- Comando para conectar con nuevo usuario (NO FUNCIONA EN ORACLE SQL DEVELOPER)
CONNECT USERFPDUAL/rootroot;

-- Ver usuario activo.
SELECT USER FROM DUAL;

-- Creación de tabla para personas.
CREATE TABLE FPD_NTTDATA_PEOPLE(
	
	PERSON_ID INT NOT NULL,
	NAME VARCHAR(40),
	IS_TRAINER NUMBER(1,0),
	MOBILE_NUMBER VARCHAR(9)

);

COMMENT ON TABLE FPD_NTTDATA_PEOPLE IS 'TABLA DE PERSONAS';
COMMENT ON COLUMN FPD_NTTDATA_PEOPLE.PERSON_ID IS 'PK - ID PERSONA';
COMMENT ON COLUMN FPD_NTTDATA_PEOPLE.NAME IS 'NOMBRE DE LA PERSONA';
COMMENT ON COLUMN FPD_NTTDATA_PEOPLE.IS_TRAINER IS 'INDICADOR DE FORMADOR/A';
COMMENT ON COLUMN FPD_NTTDATA_PEOPLE.MOBILE_NUMBER IS 'TELEFONO MOVIL';

-- Secuencia para la tabla de personas.
CREATE SEQUENCE "SEQ_FPD_NTTDATA_PEOPLE" INCREMENT BY 1 MAXVALUE 9999999999 NOCACHE MINVALUE 1;

-- Creación de tabla para alumnos.
CREATE TABLE FPD_NTTDATA_STUDENT (
	
	STUDENT_ID INT NOT NULL,
	SCHOOL_ID INT NOT NULL,
	NAME VARCHAR(40)

);

COMMENT ON TABLE FPD_NTTDATA_PEOPLE IS 'TABLA DE ESTUDIANTES';
COMMENT ON COLUMN FPD_NTTDATA_STUDENT.STUDENT_ID IS 'PK - ID ALUMNO/A';
COMMENT ON COLUMN FPD_NTTDATA_STUDENT.SCHOOL_ID IS 'FK - ID CENTRO EDUCATIVO';
COMMENT ON COLUMN FPD_NTTDATA_STUDENT.NAME IS 'NOMBRE CENTRO EDUCATIVO';

-- Secuencia para la tabla de alumnos.
CREATE SEQUENCE "SEQ_FPD_NTTDATA_STUDENT" INCREMENT BY 1 MAXVALUE 9999999999 NOCACHE MINVALUE 1;

-- Creación de tabla para institutos.
CREATE TABLE FPD_NTTDATA_SCHOOL (
	
	SCHOOL_ID INT NOT NULL,
	NAME VARCHAR(40)

);

COMMENT ON TABLE FPD_NTTDATA_SCHOOL IS 'TABLA DE CENTROS EDUCATIVOS';
COMMENT ON COLUMN FPD_NTTDATA_SCHOOL.SCHOOL_ID IS 'PK - ID CENTRO EDUCATIVO';
COMMENT ON COLUMN FPD_NTTDATA_SCHOOL.NAME IS 'NOMBRE CENTRO EDUCATIVO';

-- Secuencia para la tabla de institutos.
CREATE SEQUENCE "SEQ_FPD_NTTDATA_SCHOOL" INCREMENT BY 1 MAXVALUE 9999999999 NOCACHE MINVALUE 1;

-- Eliminación de la columna número de teléfono.
ALTER TABLE FPD_NTTDATA_PEOPLE DROP COLUMN MOBILE_NUMBER;

-- Añadido de la columna nivel tecnológico.
ALTER TABLE FPD_NTTDATA_PEOPLE ADD EMPLOYEE_RANK VARCHAR(30);
COMMENT ON COLUMN FPD_NTTDATA_PEOPLE.EMPLOYEE_RANK IS 'CATEGORÍA';

-- Insercciones de datos.
INSERT INTO FPD_NTTDATA_PEOPLE (PERSON_ID, NAME, IS_TRAINER, EMPLOYEE_RANK) VALUES (SEQ_FPD_NTTDATA_PEOPLE.NEXTVAL, 'Alejandro Téllez', 1, 'CLD');

-- Creación de tabla para formadores. | Si se quiere no traer información igualar a condición falsa ej.: 1 = 2.
CREATE TABLE FPD_NTTDATA_TRAINER AS 
	SELECT NAME FROM FPD_NTTDATA_PEOPLE WHERE IS_TRAINER = 1;
	
-- Eliminación de la tabla de personas y su secuencia.
DROP TABLE FPD_NTTDATA_PEOPLE;
DROP SEQUENCE SEQ_FPD_NTTDATA_PEOPLE;

-- Vaciar la tabla de formadores.
TRUNCATE TABLE FPD_NTTDATA_TRAINER;

-- Añadido de claves primarias.
ALTER TABLE FPD_NTTDATA_STUDENT ADD PRIMARY KEY(STUDENT_ID);

-- Añadido de constraints.
ALTER TABLE FPD_NTTDATA_SCHOOL ADD CONSTRAINT PK_SCHOOLID PRIMARY KEY (SCHOOL_ID);
ALTER TABLE FPD_NTTDATA_STUDENT ADD CONSTRAINT FK_SCHOOLID FOREIGN KEY (SCHOOL_ID) REFERENCES FPD_NTTDATA_SCHOOL(SCHOOL_ID);

-- Insercciones de datos.
INSERT INTO FPD_NTTDATA_STUDENT (STUDENT_ID, SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_STUDENT.NEXTVAL,1,'Ainara');
INSERT INTO FPD_NTTDATA_STUDENT (STUDENT_ID, SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_STUDENT.NEXTVAL,1,'Ainara');

-- Restricciones.
ALTER TABLE FPD_NTTDATA_STUDENT ADD CONSTRAINT UN_NAME UNIQUE(NAME);

-- Insercciones de datos.
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'I.E.S. ALIXAR');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'I.E.S. CAMPANILLAS');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'I.E.S. HERMANOS MACHADO');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'I.E.S. PABLO PICASSO');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'I.E.S. SOTERO HERÁNDEZ');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'NTT DATA#1');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'CESUR (SEVILLA)');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'SALESIANAS DE MARÍA AUXILIDADORA');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'SANTA JOAQUINA DE VEDRUNA');
INSERT INTO FPD_NTTDATA_SCHOOL (SCHOOL_ID, NAME) VALUES (SEQ_FPD_NTTDATA_SCHOOL.NEXTVAL,'NTT DATA#2');

-- Actualización de datos.
UPDATE FPD_NTTDATA_SCHOOL SET NAME = 'CESUR (MÁLAGA)' WHERE SCHOOL_ID = (SELECT SCHOOL_ID FROM FPD_NTTDATA_SCHOOL WHERE NAME = 'NTT DATA#1');

-- Eliminación de datos.
DELETE FROM FPD_NTTDATA_SCHOOL WHERE name = 'NTT DATA' AND SCHOOL_ID = (SELECT SCHOOL_ID FPD_NTTDATA_SCHOOL WHERE NAME = 'NTT DATA#2');