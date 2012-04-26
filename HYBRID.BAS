REM Benjamin Wolf
REM January 12, 2003
REM Hybrid Cross Genetic Ratios
REM
CLS
INPUT "How many traits are hybrid"; num
DIM x(3 ^ num + 2)
x(1) = 1
FOR y = 1 TO 3 ^ num - 1
   x(y + 1) = 2 * x(y)
   IF x(y) = 2 * x(y - 1) THEN x(y + 1) = x(y - 1)
   IF y > 1 THEN IF x(y) = x(y - 2) THEN x(y + 1) = 2 * x(y)
   IF y > 3 THEN IF x(y) = x(y - 2) AND x(y - 2) = x(y - 4) THEN x(y + 1) = 2 * x(y)
   IF y > 4 THEN IF x(y - 1) = 2 * x(y - 2) AND x(y - 2) = 2 * x(y - 3) THEN x(y + 1) = .5 * x(y)
   IF (y + 1) / 3 = (y + 1) \ 3 THEN x(y + 1) = .5 * x(y)
   PRINT x(y); ":";
NEXT y
PRINT x(y)

