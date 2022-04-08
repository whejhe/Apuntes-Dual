------------------------------------------------------
-- Autor       : NTT Data Sevilla
-- Descripción : Script 2 MySQL - Formación SQL
-- Responsable : Juan Alejandro Téllez Rubio
------------------------------------------------------

-- Eliminación de esquema.
DROP SCHEMA NTTDATA_FPDUAL_2;

-- Creación de esquema.
CREATE SCHEMA NTTDATA_FPDUAL_2 DEFAULT CHARACTER SET utf8;

-- Uso de esquema.
USE NTTDATA_FPDUAL_2;

-- Creación de tabla para equipos.
CREATE TABLE FPD_SOCCER_TEAM (
	
	TEAM_ID INT NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(35),
	STADIUM VARCHAR(40),
	STADIUM_CAPACITY INT,
	FIRST_COLOR VARCHAR(10),
	SECOND_COLOR VARCHAR(10),
	THIRD_COLOR VARCHAR(10),
	CITY VARCHAR(15),
	DIVISION INT,
	NUM_NATIONAL_TROPHIES INT,
	NUM_INTERNATIONAL_TROPHIES INT,
	
	PRIMARY KEY(TEAM_ID)
);

-- Creación de tabla para jugadores.
CREATE TABLE FPD_SOCCER_PLAYER (
	
	PLAYER_ID INT NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(35),
	BIRTH_DATE DATE,
	FIRST_ROL VARCHAR(20),
	SECOND_ROL VARCHAR(20),
	TEAM_ID INT,
	
	PRIMARY KEY(PLAYER_ID),
	FOREIGN KEY(TEAM_ID) REFERENCES FPD_SOCCER_TEAM(TEAM_ID)
);

-- Añadido de equipos.
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Sevilla Fútbol Club", "Ramón Sánchez-Pizjuán", 47074, "Blanco", "Rojo", "Negro", "Sevilla", 1, 7, 6);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Real Betis Balompié", "Benito Villamarín", 67584, "Blanco", "Verde", "Gris", "Sevilla", 1, 3, 0);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Granada Club de Fútbol", "Nuevo Los Cármenes", 19336, "Rojo", "Azul", "Blanco", "Granada", 1, 0, 0);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Cádiz Club de Fútbol", "Ramón de Carranza", 20724, "Amarillo", "Azul", "Negro", "Cádiz", 1, 0, 0);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Málaga Club de Fútbol", "La Rosaleda", 30044, "Blanco", "Azul", "Morado", "Málaga", 2, 0, 1);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Real Club Recreativo de Huelva", "Nuevo Colombino", 21670, "Blanco", "Azul", "Naranja", "Huelva", 4, 0, 0);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Unión Deportiva Almería", "Estadio de los Juegos Mediterráneos", 15274, "Rojo", "Blanco", "Negro", "Almería", 2, 0, 0);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Real Jaén Club de Fútbol", "La Victoria", 15569, "Blanco", "Morado", "Verde", "Jaén", 4, 0, 0);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Xerez Club Deportivo", "Estadio de La Juventud", 2000, "Azul", "Blanco", "Rojo", "Cádiz", 5, 0, 0);
INSERT INTO FPD_SOCCER_TEAM (NAME, STADIUM, STADIUM_CAPACITY, FIRST_COLOR, SECOND_COLOR, THIRD_COLOR, CITY, DIVISION, NUM_NATIONAL_TROPHIES, NUM_INTERNATIONAL_TROPHIES) 
VALUES ("Córdoba Club de Fútbol", "El Arcángel", 21822, "Blanco", "Verde", "Rojo", "Córdoba", 4, 0, 0);

-- Añadido de futbolistas.
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Jesús Navas", 21/11/1985, "LAT-D", "EXT-D", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Sevilla Fútbol Club"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Jules Koundé", 12/11/1998, "CEN-D", "LAT-D", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Sevilla Fútbol Club"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Youssef En-Nesyri", 01/06/1997, "DEL", "EXT-I", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Sevilla Fútbol Club"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Joaquín Sánchez", 21/07/1981, "EXT-D", "DEL", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Real Betis Balompié"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Sergio Canales", 16/02/1991, "MEC", "PIV", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Real Betis Balompié"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Nabil Fekir", 18/07/1993, "MEP", "EXT-D", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Real Betis Balompié"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Genaro", 23/03/1998, "MEC", "CEN", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Málaga Club de Fútbol"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Jairo Samperio", 11/07/1993, "MEP", "EXT-D", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Málaga Club de Fútbol"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL, TEAM_ID) 
VALUES ("Antoñin", 16/04/2000, "DEL", "EXT", (SELECT TEAM_ID FROM FPD_SOCCER_TEAM WHERE NAME = "Málaga Club de Fútbol"));
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL) 
VALUES ("Portu", 21/05/1992, "DEL", "MEP");
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL) 
VALUES ("Carlos Fdz.", 24/05/1996, "DEL", "MEP");
INSERT INTO FPD_SOCCER_PLAYER (NAME, BIRTH_DATE, FIRST_ROL, SECOND_ROL) 
VALUES ("Illarramendi", 31/03/1990, "MEC", "PIV");

-- Consulta básica.
SELECT * FROM FPD_SOCCER_TEAM;

-- Consulta básica (DISTINCT)
SELECT DISTINCT FIRST_COLOR FROM FPD_SOCCER_TEAM;

-- Consulta básica (ORDER BY)
SELECT * FROM FPD_SOCCER_TEAM ORDER BY NAME;
SELECT * FROM FPD_SOCCER_TEAM ORDER BY NAME DESC;

-- Consulta básica (WHERE)
SELECT * FROM FPD_SOCCER_TEAM WHERE CITY = "Sevilla";

-- Consulta básica (AND)
SELECT * FROM FPD_SOCCER_TEAM WHERE FIRST_COLOR = "Blanco" AND SECOND_COLOR = "Rojo";

-- Consulta básica (OR)
SELECT * FROM FPD_SOCCER_TEAM WHERE FIRST_COLOR = "Negro" OR FIRST_COLOR = "Amarillo";

-- Consulta básica (NOT)
SELECT * FROM FPD_SOCCER_TEAM WHERE NOT CITY = "Sevilla";

-- Consulta básica (IN)
SELECT * FROM FPD_SOCCER_TEAM WHERE CITY IN ('Sevilla', 'Cádiz');

-- Consulta básica (BETWEEN)
SELECT * FROM FPD_SOCCER_TEAM WHERE STADIUM_CAPACITY BETWEEN 30000 AND 70000;

-- Consulta básica (LIKE)
SELECT * FROM FPD_SOCCER_TEAM WHERE NAME LIKE '%Club de%';

-- Consulta básica (COUNT)
SELECT COUNT(TEAM_ID) FROM FPD_SOCCER_TEAM WHERE DIVISION = 1;

-- Consulta básica (SUM)
SELECT SUM(NUM_NATIONAL_TROPHIES) FROM FPD_SOCCER_TEAM;

-- Consulta básica (AVG)
SELECT AVG(STADIUM_CAPACITY) FROM FPD_SOCCER_TEAM;

-- Consulta básica (MAX)
SELECT MAX(STADIUM_CAPACITY) FROM FPD_SOCCER_TEAM;

-- Consulta básica (MIN)
SELECT MIN(STADIUM_CAPACITY) FROM FPD_SOCCER_TEAM;

-- Consulta media (subconsulta)
SELECT NAME, STADIUM_CAPACITY FROM FPD_SOCCER_TEAM WHERE STADIUM_CAPACITY = (SELECT max(STADIUM_CAPACITY) from FPD_SOCCER_TEAM);

-- Consulta media (GROUP BY)
SELECT FIRST_COLOR, COUNT(FIRST_COLOR) FROM FPD_SOCCER_TEAM GROUP BY FIRST_COLOR;

-- Consulta media (HAVING)
SELECT FIRST_COLOR, COUNT(FIRST_COLOR) FROM FPD_SOCCER_TEAM GROUP BY FIRST_COLOR HAVING count(FIRST_COLOR) > 1;

-- Consulta compleja (INNER JOIN / JOIN)
SELECT st.NAME, sp.NAME FROM FPD_SOCCER_PLAYER sp
INNER JOIN FPD_SOCCER_TEAM st ON sp.TEAM_ID = st.TEAM_ID;

-- Consulta compleja (LEFT JOIN)
SELECT st.NAME, sp.NAME FROM FPD_SOCCER_TEAM st
LEFT JOIN FPD_SOCCER_PLAYER sp ON st.TEAM_ID = sp.TEAM_ID;

SELECT st.NAME, sp.NAME FROM FPD_SOCCER_TEAM st
LEFT JOIN FPD_SOCCER_PLAYER sp ON st.TEAM_ID = sp.TEAM_ID WHERE sp.TEAM_ID IS NULL;

-- Consulta compleja (RIGHT JOIN)
SELECT st.NAME, sp.NAME FROM FPD_SOCCER_TEAM st
RIGHT JOIN FPD_SOCCER_PLAYER sp ON st.TEAM_ID = sp.TEAM_ID;

SELECT st.NAME, sp.NAME FROM FPD_SOCCER_TEAM st
RIGHT JOIN FPD_SOCCER_PLAYER sp ON st.TEAM_ID = sp.TEAM_ID WHERE st.TEAM_ID IS NULL;

-- Consulta compleja (OUTER JOIN)
SELECT st.NAME, sp.NAME FROM FPD_SOCCER_TEAM st
FULL OUTER JOIN FPD_SOCCER_PLAYER sp ON st.TEAM_ID = sp.TEAM_ID;

SELECT st.NAME, sp.NAME FROM FPD_SOCCER_TEAM st
RIGHT JOIN FPD_SOCCER_PLAYER sp ON st.TEAM_ID = sp.TEAM_ID WHERE st.TEAM_ID IS NULL;