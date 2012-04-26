DECLARE SUB placecheck (active!, pcol!(), cnum!, hole!(), row!)
DECLARE SUB wincheck (active!, hole!(), cnum!, row!, pnam$())
REM Benjamin Wolf, Arnold Diblasi
REM April 28, 2003
REM Connect Four
REM
DIM hole(7, 7)
' hole(column, row)
' column counts from left to right
' row counts from bottom to top
CLS
SCREEN 12
PRINT
PRINT "Welcome to Connect Four"
PRINT
INPUT "Player 1 enter your name: ", pnam$(1)
INPUT "Player 2 enter your name: ", pnam$(2)
CLS
PRINT
PRINT
FOR x = 1 TO 7
   PRINT , x
NEXT x
COLOR 10
LINE (110, 30)-(210, 142), , B
DRAW "BM 110,30 D16 R100 D16 L100 D16 R100 D16 L100 D16 R100 D16 L100 BM 130,30 D112"
FOR x = 1 TO 7
   PAINT (135, 29 + x * 16), x, 10
NEXT x
LOCATE 11, 1:
COLOR 14
pcol(1) = 0
pcol(2) = 0
FOR x = 1 TO 2
   DO
      PRINT pnam$(x); " select a color number: ";
      INPUT "", pcol(x)
      pcol(x) = INT(pcol(x))
      SELECT CASE pcol(x)
         CASE IS < 1
             PRINT "Choose a number between 1 and 7 only!"
         CASE IS > 7
             PRINT "Choose a number between 1 and 7 only!"
         CASE ELSE
             IF pcol(1) = pcol(2) THEN PRINT "Choose a color that "; pnam$(1); " did not pick!" ELSE EXIT DO
      END SELECT
   LOOP
NEXT x
CLS
LOCATE 4, 21: PRINT "1     2      3     4     5     6      7"
FOR x = 1 TO 8
   DRAW "BM 140," + LTRIM$(RTRIM$(STR$(13 + x * 50))) + " R350"
NEXT x
FOR y = 1 TO 8
   DRAW "BM " + LTRIM$(RTRIM$(STR$(90 + y * 50))) + ",63 D350"
NEXT y
active = 0
turn = 0
DO
   turn = turn + 1
   active = active MOD 2 + 1
   DO
      'LOCATE 26 + active, 10: PRINT "                                                                                   "
      LOCATE 26 + active, 10: PRINT pnam$(active); ",";
      INPUT " select a column number to place a checker: ", cnum
      cnum = INT(cnum)
      SELECT CASE cnum
         CASE IS < 1
            LOCATE 26 + active, 10: PRINT "Choose only a specified column!"
         CASE IS > 7
            LOCATE 26 + active, 10: PRINT "Choose only a specified column!"
         CASE ELSE
            z = 0
            DO
               z = z + 1
               IF z > 7 THEN
                  LOCATE 26 + active, 10: PRINT "That column is full. Please choose another."
                  GOTO 10
               END IF
               IF hole(cnum, z) = 0 THEN EXIT DO
            LOOP
            row = z
            CALL placecheck(active, pcol(), cnum, hole(), row)
            EXIT DO
      END SELECT
10    SLEEP 1
  LOOP
IF turn > 6 THEN CALL wincheck(active, hole(), cnum, row, pnam$())
LOOP

SUB placecheck (active, pcol(), cnum, hole(), row)
CIRCLE (115 + cnum * 50, 438 - row * 50), 20, 14
PAINT (115 + cnum * 50, 438 - row * 50), pcol(active), 14
hole(cnum, row) = active
END SUB

SUB wincheck (active, hole(), cnum, row, pnam$())
col = cnum
DO
   IF col <> 1 THEN
      col = col - 1
      IF hole(col, row) <> active THEN
         col = col + 1
         EXIT DO
      END IF
   ELSE
      EXIT DO
   END IF
LOOP
num = 0
DO
   IF col > 7 THEN EXIT DO
   IF hole(col, row) <> active THEN EXIT DO
   col = col + 1
   num = num + 1
   IF num = 4 THEN
      LINE (115 + (col - 4) * 50, 438 - row * 50)-(115 + (col - 1) * 50, 438 - row * 50), 15
      LOCATE 28, 10: PRINT "                                                         "
      LOCATE 28, 10: PRINT pnam$(active); " wins!! "; pnam$(active MOD 2 + 1); " loses!!"
      END
   END IF
LOOP
rot = row
DO
   IF rot <> 1 THEN
      rot = rot - 1
      IF hole(cnum, rot) <> active THEN
         rot = rot + 1
         EXIT DO
      END IF
   ELSE
      EXIT DO
   END IF
LOOP
num = 0
DO
   IF rot > 7 THEN EXIT DO
   IF hole(cnum, rot) <> active THEN EXIT DO
   rot = rot + 1
   num = num + 1
   IF num = 4 THEN
      LINE (115 + cnum * 50, 438 - (rot - 4) * 50)-(115 + cnum * 50, 438 - (rot - 1) * 50), 15
      LOCATE 28, 10: PRINT "                                                         "
      LOCATE 28, 10: PRINT pnam$(active); " wins!! "; pnam$(active MOD 2 + 1); " loses!!"
      END
   END IF
LOOP
col = cnum
rot = row
DO
   IF col <> 1 AND rot <> 1 THEN
      col = col - 1
      rot = rot - 1
      IF hole(col, rot) <> active THEN
         col = col + 1
         rot = rot + 1
         EXIT DO
      END IF
   ELSE
      EXIT DO
   END IF
LOOP
num = 0
DO
   IF col > 7 OR rot > 7 THEN EXIT DO
   IF hole(col, rot) <> active THEN EXIT DO
   col = col + 1
   rot = rot + 1
   num = num + 1
   IF num = 4 THEN
      LINE (115 + (col - 4) * 50, 438 - (rot - 4) * 50)-(115 + (col - 1) * 50, 438 - (rot - 1) * 50), 15
      LOCATE 28, 10: PRINT "                                                         "
      LOCATE 28, 10: PRINT pnam$(active); " wins!! "; pnam$(active MOD 2 + 1); " loses!!"
      END
   END IF
LOOP
col = cnum
rot = row
DO
   IF col <> 1 AND rot <> 7 THEN
      col = col - 1
      rot = rot + 1
      IF hole(col, rot) <> active THEN
         col = col + 1
         rot = rot - 1
         EXIT DO
      END IF
   ELSE
      EXIT DO
   END IF
LOOP
num = 0
DO
   IF col > 7 OR rot < 1 THEN EXIT DO
   IF hole(col, rot) <> active THEN EXIT DO
   col = col + 1
   rot = rot - 1
   num = num + 1
   IF num = 4 THEN
      LINE (115 + (col - 4) * 50, 438 - (rot + 4) * 50)-(115 + (col - 1) * 50, 438 - (rot + 1) * 50), 15
      LOCATE 28, 10: PRINT "                                                         "
      LOCATE 28, 10: PRINT pnam$(active); " wins!! "; pnam$(active MOD 2 + 1); " loses!!"
      END
   END IF
LOOP
END SUB

