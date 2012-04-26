DECLARE SUB shift (ptcol!())
DECLARE SUB findrange (ptcol!(), fcol!, frow!, lcol!, lrow!)
DECLARE SUB birthdeath (ptcol!(), fcol!, frow!, lcol!, lrow!)
DECLARE SUB reprint (ptcol!(), fcol!, frow!, lcol!, lrow!)
DECLARE SUB lacplate (ccol!, crow!, pcol!, prow!, ptcol!())
DECLARE SUB cycle (ptcol!())
REM Benjamin Wolf
REM May 5, 2003
REM Game of Life
REM
DIM cursor(8)
DIM ptcol(127, 92)
CLS
SCREEN 12
LINE (320, 240)-(324, 244), 6, BF
GET (320, 240)-(324, 244), cursor
CLS
FOR x = 0 TO 635 STEP 5
   LINE (x, 0)-(x, 460)
NEXT x
FOR x = 0 TO 460 STEP 5
   LINE (0, x)-(635, x)
NEXT x
pcol = 64
prow = 47
ccol = 316
crow = 231
DO
   PUT (ccol, crow), cursor, OR
   oldc = ccol
   oldr = crow
   w$ = INPUT$(1)
   SELECT CASE w$
   CASE IS = "w"
      prow = prow - 1
      crow = crow - 5
   CASE IS = "a"
      pcol = pcol - 1
      ccol = ccol - 5
   CASE IS = "s"
      prow = prow + 1
      crow = crow + 5
   CASE IS = "d"
      pcol = pcol + 1
      ccol = ccol + 5
   CASE IS = "p"
      CALL lacplate(ccol, crow, pcol, prow, ptcol())
   CASE IS = "g"
      PAINT (oldc, oldr), 0, 15
      CALL cycle(ptcol())
   END SELECT
   IF ccol > 630 THEN
      ccol = 630
      pcol = 127
   END IF
   IF ccol < 0 THEN
      ccol = 0
      pcol = 1
   END IF
   IF crow > 455 THEN
      crow = 455
      prow = 92
   END IF
   IF crow < 0 THEN
      crow = 0
      prow = 1
   END IF
   PAINT (oldc, oldr), 0, 15
LOOP

SUB birthdeath (ptcol(), fcol, frow, lcol, lrow)
REDIM temp(127, 92)
FOR x = fcol TO lcol
   FOR y = frow TO lrow
      temp(x, y) = ptcol(x, y)
   NEXT y
NEXT x

FOR x = fcol TO lcol
   FOR y = frow TO lrow
      nbor = 0
      FOR a = x - 1 TO x + 1
         FOR b = y - 1 TO y + 1
            IF a > 0 AND a < 128 AND b > 0 AND b < 93 AND NOT (a = x AND b = y) THEN
               IF ptcol(a, b) = 15 THEN nbor = nbor + 1
            END IF
         NEXT b
      NEXT a
      SELECT CASE nbor
      CASE IS < 2
         temp(x, y) = 0
      CASE IS = 3
         temp(x, y) = 15
      CASE IS > 3
         temp(x, y) = 0
      END SELECT
   NEXT y
NEXT x

FOR x = fcol TO lcol
   FOR y = frow TO lrow
      ptcol(x, y) = temp(x, y)
   NEXT y
NEXT x
END SUB

SUB cycle (ptcol())
FOR x = 0 TO 635 STEP 5
   LINE (x, 0)-(x, 460), 0
NEXT x
FOR x = 0 TO 460 STEP 5
   LINE (0, x)-(635, x), 0
NEXT x
DO
   w$ = INPUT$(1)
   SELECT CASE w$
   CASE IS = "n"
      CALL findrange(ptcol(), fcol, frow, lcol, lrow)
      CALL birthdeath(ptcol(), fcol, frow, lcol, lrow)
      CALL reprint(ptcol(), fcol, frow, lcol, lrow)
   CASE IS = "q"
      END
   CASE IS = "d"
      FOR x = 0 TO 635 STEP 5
         LINE (x, 0)-(x, 460)
      NEXT x
      FOR x = 0 TO 460 STEP 5
         LINE (0, x)-(635, x)
      NEXT x
      EXIT DO
   CASE IS = "s"
      CALL shift(ptcol())
   END SELECT
LOOP
END SUB

SUB findrange (ptcol(), fcol, frow, lcol, lrow)
FOR x = 1 TO 127
   FOR y = 1 TO 92
      IF ptcol(x, y) = 15 THEN
         fcol = x - 1
         GOTO 10
      END IF
   NEXT y
NEXT x

10

FOR x = 1 TO 92
   FOR y = 1 TO 127
      IF ptcol(y, x) = 15 THEN
         frow = x - 1
         GOTO 20
      END IF
   NEXT y
NEXT x

20

FOR x = 127 TO 1 STEP -1
   FOR y = 1 TO 92
      IF ptcol(x, y) = 15 THEN
         lcol = x + 1
         GOTO 30
      END IF
   NEXT y
NEXT x

30

FOR x = 92 TO 1 STEP -1
   FOR y = 1 TO 127
      IF ptcol(y, x) = 15 THEN
         lrow = x + 1
         GOTO 40
      END IF
   NEXT y
NEXT x

40
END SUB

SUB lacplate (ccol, crow, pcol, prow, ptcol())
SELECT CASE ptcol(pcol, prow)
CASE IS = 0
   PSET (pcol * 5 - 2, prow * 5 - 3)
   PSET (pcol * 5 - 3, prow * 5 - 3)
   PSET (pcol * 5 - 2, prow * 5 - 2)
   PSET (pcol * 5 - 3, prow * 5 - 2)
   ptcol(pcol, prow) = 15
CASE IS = 15
   PSET (pcol * 5 - 2, prow * 5 - 3), 0
   PSET (pcol * 5 - 3, prow * 5 - 3), 0
   PSET (pcol * 5 - 2, prow * 5 - 2), 0
   PSET (pcol * 5 - 3, prow * 5 - 2), 0
   ptcol(pcol, prow) = 0
END SELECT
END SUB

SUB reprint (ptcol(), fcol, frow, lcol, lrow)
FOR x = fcol TO lcol
   FOR y = frow TO lrow
      PSET (x * 5 - 2, y * 5 - 3), ptcol(x, y)
      PSET (x * 5 - 3, y * 5 - 3), ptcol(x, y)
      PSET (x * 5 - 2, y * 5 - 2), ptcol(x, y)
      PSET (x * 5 - 3, y * 5 - 2), ptcol(x, y)
   NEXT y
NEXT x
END SUB

SUB shift (ptcol())
s$ = INPUT$(1)
SELECT CASE s$
CASE IS = "l"
   FOR x = 1 TO 126
      FOR y = 1 TO 92
         ptcol(x, y) = ptcol(x + 1, y)
      NEXT y
   NEXT x
   FOR y = 1 TO 92
      ptcol(127, y) = 0
   NEXT y
CASE IS = "r"
   FOR x = 127 TO 2 STEP -1
      FOR y = 1 TO 92
         ptcol(x, y) = ptcol(x - 1, y)
      NEXT y
   NEXT x
   FOR y = 1 TO 92
      ptcol(1, y) = 0
   NEXT y
CASE IS = "u"
   FOR x = 1 TO 91
      FOR y = 1 TO 127
         ptcol(y, x) = ptcol(y, x + 1)
      NEXT y
   NEXT x
   FOR y = 1 TO 127
      ptcol(y, 92) = 0
   NEXT y
CASE IS = "d"
   FOR x = 92 TO 2 STEP -1
      FOR y = 1 TO 127
         ptcol(y, x) = ptcol(y, x - 1)
      NEXT y
   NEXT x
   FOR y = 1 TO 127
      ptcol(y, 1) = 0
   NEXT y
END SELECT
CALL reprint(ptcol(), 1, 1, 127, 92)
END SUB

