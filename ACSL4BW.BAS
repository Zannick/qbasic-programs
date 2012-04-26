DECLARE SUB deleteman (x!, digits$, d$(), y!, con!)
DECLARE SUB smithman (x!, digits$, d$(), y!, con!)
DECLARE SUB compman (x!, con!)
DECLARE SUB cyclicman (x!, digits$, d$(), y!, con!)
DECLARE SUB primeman (x!, con!)
DECLARE SUB primetest (x!, y!)
REM Benjamin Wolf
REM March 31, 2003
REM Intermediate Division
REM Cherokee High School
CLS
FOR times = 1 TO 5
   con = 0
   INPUT "A number: ", x
   CALL primetest(x, y)
   SELECT CASE y
      CASE 1
         CALL primeman(x, con)
      CASE 2
         CALL compman(x, con)
   END SELECT
   IF con = 0 THEN PRINT "NONE" ELSE PRINT
NEXT times

SUB compman (x, con)
digits$ = LTRIM$(RTRIM$(STR$(x)))
REDIM d$(LEN(digits$))
FOR f = 1 TO LEN(digits$)
   d$(f) = MID$(digits$, f, 1)
NEXT f
CALL smithman(x, digits$, d$(), y, con)
END SUB

SUB cyclicman (x, digits$, d$(), y, con)
FOR z = 1 TO LEN(digits$)
   num$ = ""
   FOR a = z TO LEN(digits$) + z - 1
      b = a
      IF b > LEN(digits$) THEN b = b - LEN(digits$)
      num$ = num$ + d$(b)
   NEXT a
   cylce = VAL(num$)
   CALL primetest(cylce, y)
   IF y = 2 THEN EXIT FOR
NEXT z
IF y = 1 THEN
   PRINT "Circular";
   con = 1
END IF
END SUB

SUB deleteman (x, digits$, d$(), y, con)
ret = 0
FOR z = 1 TO LEN(digits$)
   IF ret = 1 THEN z = LEN(digits$)
   num$ = ""
   FOR a = 1 TO LEN(digits$)
      IF a <> z THEN num$ = num$ + d$(a)
   NEXT a
   dleted = VAL(num$)
   IF dleted <> 1 THEN CALL primetest(dleted, y)
   IF y = 1 THEN
      IF z = 1 THEN
         IF con = 1 THEN PRINT ", ";
         PRINT "Left";
         con = 1
      ELSEIF z = LEN(digits$) THEN
         IF con = 1 THEN PRINT ", ";
         PRINT "Right";
         con = 1
      ELSE
         IF con = 1 THEN PRINT ", ";
         PRINT "Interior";
         con = 1
         ret = 1
      END IF
   END IF
NEXT z
END SUB

SUB primeman (x, con)
digits$ = LTRIM$(RTRIM$(STR$(x)))
REDIM d$(LEN(digits$))
FOR z = 1 TO LEN(digits$)
   d$(z) = MID$(digits$, z, 1)
NEXT z
CALL cyclicman(x, digits$, d$(), y, con)
CALL deleteman(x, digits$, d$(), y, con)
END SUB

SUB primetest (x, y)
y = 0
d = 3
c = x / 2
IF INT(c) = c THEN
   IF c = 1 THEN y = 1 ELSE y = 2
END IF
DO
   IF y <> 0 THEN EXIT DO
   c = x / d
   IF INT(c) = c THEN
      IF c = 1 THEN y = 1 ELSE y = 2
   END IF
   IF c < d THEN y = 1 ELSE d = d + 2
LOOP
END SUB

SUB smithman (x, digits$, d$(), y, con)
REDIM facto(1)
FOR b = 1 TO 2
   z = x
   a = 0
   DO
      c = z / 2
      IF INT(c) = c THEN
         a = a + 1
         IF b = 2 THEN facto(a) = 2
         z = c
      END IF
   LOOP UNTIL INT(c) <> c
   d = 3
   DO
      DO
         c = z / d
         IF INT(c) = c THEN
            a = a + 1
            IF b = 2 THEN facto(a) = d
            z = c
         END IF
      LOOP UNTIL INT(c) <> c
      d = d + 2
   LOOP UNTIL z = 1
   IF b = 1 THEN REDIM facto(a)
NEXT b
FOR g = 1 TO LEN(digits$)
   sumnum = sumnum + VAL(d$(g))
NEXT g
FOR h = 1 TO a
   lenght$ = LTRIM$(RTRIM$(STR$(facto(h))))
   FOR k = 1 TO LEN(lenght$)
      sumfact = sumfact + VAL(MID$(lenght$, k, 1))
   NEXT k
NEXT h
IF sumnum = sumfact THEN
   PRINT "Smith"
   con = 1
END IF
END SUB

