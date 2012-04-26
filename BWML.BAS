REM Benjamin Wolf
REM February 20, 2003
REM Madlib
REM
CLS
OPEN "A:madlib.txt" FOR INPUT AS #152
OPEN "A:endlib.txt" FOR OUTPUT AS #9
INPUT #152, num
DIM theword$(num)
INPUT "Enter your name, please: ", nam$
PRINT #9, "The Story of Xyzzilaus"
PRINT #9, "   by "; nam$
PRINT #9,
FOR x = 1 TO num
   INPUT #152, z$
   PRINT "Enter a";
   y$ = UCASE$(LEFT$(z$, 1))
   IF y$ = "A" OR y$ = "E" OR y$ = "I" OR y$ = "O" OR y$ = "U" THEN PRINT "n ";  ELSE PRINT " ";
   PRINT z$; ": ";
   INPUT "", theword$(x)
NEXT x
xyzzy = 1
DO
   INPUT #152, piece$
   IF piece$ = "xyzzy" THEN
      PRINT #9, theword$(xyzzy);
      xyzzy = xyzzy + 1
   ELSE
      IF piece$ = ";" THEN
         PRINT #9, "'";
      ELSE
         IF piece$ = "EOL" THEN PRINT #9, "" ELSE PRINT #9, piece$;
      END IF
   END IF
LOOP UNTIL EOF(152)
CLOSE
PRINT
PRINT "Open A:endlib.txt to view your madlib."
END

