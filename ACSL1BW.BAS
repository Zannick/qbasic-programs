DECLARE SUB bfigure ()
DECLARE SUB tfigure ()
DECLARE SUB lfigure ()
DECLARE SUB hfigure ()
DECLARE SUB sfigure ()
REM Benjamin Wolf
REM December 2, 2002
REM Intermediate Division
REM Cherokee High School
CLS
FOR fivetimes = 1 TO 5
   DO
   PRINT "Enter the type of figure first, then the numbers."
   INPUT "Type of figure"; fig$
   IF UCASE$(fig$) = "S" OR UCASE$(fig$) = "H" OR UCASE$(fig$) = "L" OR UCASE$(fig$) = "B" OR UCASE$(fig$) = "T" THEN EXIT DO
   PRINT "Please enter one of the following: s,h,l,b,t"
   SLEEP 1
   LOOP
   PRINT "Input numbers here (separated by commas) -> ";
   IF UCASE$(fig$) = "S" THEN CALL sfigure
   IF UCASE$(fig$) = "H" THEN CALL hfigure
   IF UCASE$(fig$) = "L" THEN CALL lfigure
   IF UCASE$(fig$) = "B" THEN CALL bfigure
   IF UCASE$(fig$) = "T" THEN CALL tfigure
NEXT fivetimes
END

SUB bfigure
INPUT "", l, w, n
PRINT
FOR x = 1 TO w
   FOR y = 1 TO l + (l - 1) * (n - 1)
      PRINT "* ";
   NEXT y
   PRINT
NEXT x
PRINT
END SUB

SUB hfigure
INPUT "", h, n
PRINT
FOR x = 1 TO h
   FOR y = 1 TO h + (n - 1) * (h - 1)
      z = y
      DO UNTIL z <= h
         z = z - h + 1
      LOOP
      IF z < x THEN PRINT "  ";
      IF z >= x THEN PRINT "* ";
  NEXT y
  PRINT
NEXT x
PRINT
END SUB

SUB lfigure
INPUT "", h, n
PRINT
FOR x = 1 TO h
   FOR y = 1 TO h + (n - 1) * (h - 1)
      z = y
      v = n + 1
      DO UNTIL z < h
         v = v - 1
         IF v = 1 THEN EXIT DO
         z = z - h + 1
      LOOP
      IF z <= x THEN PRINT "* ";
      IF z > x THEN PRINT "  ";
  NEXT y
  PRINT
NEXT x
PRINT
END SUB

SUB sfigure
INPUT "", h, n
PRINT
FOR x = 1 TO h
   FOR y = 1 TO h + (n - 1) * (h - 1)
      PRINT "* ";
   NEXT y
   PRINT
NEXT x
PRINT
END SUB

SUB tfigure
INPUT "", h, n
PRINT
FOR x = 1 TO 3 * h - 2
   FOR y = 1 TO 7 + 6 * (n - 1)
      z = y
      DO UNTIL z <= 7
         z = z - 6
      LOOP
      IF x = h OR x = 2 * h - 1 THEN
         PRINT "* ";
      ELSE
         IF z < 3 THEN PRINT "  ";
         IF z >= 3 AND z < 6 THEN PRINT "* ";
         IF z >= 6 THEN PRINT "  ";
      END IF
   NEXT y
   PRINT
NEXT x
PRINT
END SUB

