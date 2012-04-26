REM Benjamin Wolf
REM April 8, 2003
REM
CLS
SCREEN 12
x = 1
DO
IF x = 25 THEN y = 2
IF x = 1 THEN y = 1
SELECT CASE y
   CASE 1
      x = x + .5
   CASE 2
      x = x - .5
END SELECT
CIRCLE (320, 240), 40, , , , x
FOR z = 1 TO 1000000 - x * 25000
NEXT z
CLS
LOOP

