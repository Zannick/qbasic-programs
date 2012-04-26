REM Benjamin Wolf
REM March 14, 2003
CLS
DIM mindless(1000)
OPEN "A:numbers.txt" FOR INPUT AS #34
OPEN "A:bubble.txt" FOR OUTPUT AS #45
strt = TIMER
FOR x = 1 TO 1000
   INPUT #34, mindless(x)
NEXT x
DO
   quip = 0
   FOR x = 1 TO 999
      IF mindless(x) > mindless(x + 1) THEN
         SWAP mindless(x), mindless(x + 1)
         quip = 1
      END IF
   NEXT x
LOOP UNTIL quip = 0
FOR x = 1 TO 1000
   PRINT #45, mindless(x); ",";
NEXT x
PRINT #45, ""
PRINT #45, "This sorting took "; TIMER - strt; " seconds."
CLOSE
END

