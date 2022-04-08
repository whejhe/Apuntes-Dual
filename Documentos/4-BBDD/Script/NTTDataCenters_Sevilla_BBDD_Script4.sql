------------------------------------------------------
-- Autor       : NTT Data Sevilla
-- Descripción : Script 4 Oracle - Formación SQL
-- Responsable : Juan Alejandro Téllez Rubio
------------------------------------------------------

-- PL/SQL
DECLARE

-- Variables normales
variable1 VARCHAR(20);
variable7 VARCHAR(20);
variable8 BOOLEAN := false;
variable9 NUMBER;

-- Conversión implícita posible.
variable2 NUMBER := 2;
variable3 VARCHAR(5) := variable2;

-- Uso de %TYPE (conversión implícita)
variable4 variable2%TYPE := 10;

-- Uso de %ROWTYPE (conversión implícita)
CURSOR jnavasRol IS SELECT FIRST_ROL FROM FPD_SOCCER_PLAYER WHERE NAME LIKE '%Navas';
variable6 jnavasRol%ROWTYPE;

-- Conversión implícita imposible (descomentar da error).
-- variable5 DATE := variable2;

-- Cursores (estructura de datos)
CURSOR soccerPlayersNames IS SELECT NAME FROM FPD_SOCCER_PLAYER;

BEGIN

    -- Asignación directa.
    variable1 := 'Asignación 1';
    dbms_output.put_line('Variable 1: ' || variable1);
	
	-- Variables.
	dbms_output.put_line('Variable 2: ' || variable2);
    dbms_output.put_line('Variable 3: ' || variable3);
    dbms_output.put_line('Variable 4: ' || variable4);
    
    SELECT FIRST_ROL INTO variable7 FROM FPD_SOCCER_PLAYER WHERE NAME LIKE '%Navas';
    dbms_output.put_line('Variable 7: ' || variable7);
    
    -- Asignación por SELECT.
    SELECT 'Asignación 2' INTO variable1 FROM DUAL;
    dbms_output.put_line('Variable 1: ' || variable1);
    
    -- Printa cursor (1).
    FOR soccerPlayerName IN soccerPlayersNames
    LOOP
    dbms_output.put_line('Jugador: ' || soccerPlayerName.name);
    --updatePlayerRol(soccerPlayerName.name,'Desconocido');
    END LOOP;
    
    --Realizar commit para guardar cambios tras UPDATE, INSERT O DELETE.
    --COMMIT;
    
	-- Llamada a función.
    dbms_output.put_line(checkIfAreEquals('Alex','Alex'));
    
    -- Ejemplo de bucle.
    FOR cont IN 0..10 LOOP
        dbms_output.put_line('Iteración: ' || cont);
        EXIT WHEN cont = 5;
    END LOOP;
    
    -- Ejemplo de bucle.
    variable9 := 0;
    WHILE variable8 = false LOOP
        dbms_output.put_line(variable9);
        variable9 := variable9 + 1;
        
        IF variable9 = 10 THEN
            variable8 := true;
        END IF;
    END LOOP;
END;

-- Procedimiento.
CREATE OR REPLACE
PROCEDURE updatePlayerRol(playerName VARCHAR, secondRol VARCHAR)
IS
  -- Declaracion de variables locales
BEGIN
  UPDATE FPD_SOCCER_PLAYER
    SET SECOND_ROL = secondRol WHERE name = playerName;
END updatePlayerRol;

-- Función 1.
CREATE OR REPLACE
FUNCTION checkIfAreEquals(var1 VARCHAR, var2 VARCHAR) RETURN VARCHAR
IS
	checkResult VARCHAR(25) := var1 || ' y ' || var2;
BEGIN
	IF var1 = var2 THEN
		checkResult := checkResult || ' son iguales ';
	ELSE
		checkResult := checkResult || ' son diferentes ';
	END IF;
	
	RETURN checkResult;
END checkIfAreEquals;