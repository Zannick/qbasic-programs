REM Benjamin Wolf
REM March 14, 2003
CLS
DIM powerless(1000)
OPEN "A:numbers.txt" FOR INPUT AS #13
OPEN "A:shell.txt" FOR OUTPUT AS #109
strt = TIMER
FOR x = 1 TO 1000
   INPUT #13, powerless(x)
NEXT x
number = 1000
gap = number \ 2
DO WHILE gap > 0
   limit = number
   DO
      madman = 0
      FOR x = 1 TO limit - gap
         IF powerless(x) > powerless(x + gap) THEN
            SWAP powerless(x), powerless(x + gap)
            madman = 1
            last = x
         END IF
      NEXT x
      limit = last
   LOOP UNTIL madman = 0
   gap = gap \ 2
LOOP
FOR x = 1 TO 1000
   PRINT #109, powerless(x); ",";
NEXT x
PRINT #109, ""
PRINT #109, "This sorting took "; TIMER - strt; " seconds."
CLOSE
END

