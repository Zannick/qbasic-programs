DECLARE SUB resigned (pcon!)
DECLARE SUB record (f!, g!, x!, y!)
DECLARE SUB stalecheck (whatshere!(), whosehere!(), kingx!(), kingy!(), pcon!)
DECLARE SUB intercept (whatshere!(), whosehere!(), x!, y!, mate!, pcon!)
DECLARE SUB matecheck (whatshere!(), whosehere!(), kingx!(), kingy!(), pcon!, chksx!, chksy!, chknx!, chkny!, chkdx!, chkdy!, chkpx!, chkpy!)
DECLARE SUB checkcheck (whatshere!(), whosehere!(), kingx!(), kingy!(), pcon!, check!, nnn!)
DECLARE SUB queenie (whatshere!(), whosehere!(), hgigh!(), y!, x!, f!, g!, pcon!, moved!, kingx!(), kingy!(), castlek!(), castleq!())
DECLARE SUB digestion (whatshere!(), x!, y!)
DECLARE SUB kingpinnie (whatshere!(), whosehere!(), hgigh!(), y!, x!, f!, g!, pcon!, moved!, kingx!(), kingy!(), castlek!(), castleq!())
DECLARE SUB bishopie (whatshere!(), whosehere!(), hgigh!(), y!, x!, f!, g!, pcon!, moved!, kingx!(), kingy!(), castlek!(), castleq!())
DECLARE SUB nightie (whatshere!(), whosehere!(), hgigh!(), y!, x!, f!, g!, pcon!, moved!, kingx!(), kingy!(), castlek!(), castleq!())
DECLARE SUB transform (whatshere!(), whosehere!(), x!, y!, pcon!, e!)
DECLARE SUB rookie (whatshere!(), whosehere!(), hgigh!(), y!, x!, f!, g!, pcon!, moved!, kingx!(), kingy!(), castlek!(), castleq!())
DECLARE SUB movepiece (whatshere!(), whosehere!(), hgigh!(), y!, x!, pcon!, moved!, kingx!(), kingy!(), castlek!(), castleq!())
DECLARE SUB canitgohere (whatshere!(), whosehere!(), hgigh!(), y!, x!, f!, g!, pcon!, moved!, kingx!(), kingy!(), castlek!(), castleq!())
DECLARE SUB pawnie (whatshere!(), whosehere!(), hgigh!(), y!, x!, f!, g!, pcon!, moved!, kingx!(), kingy!(), castlek!(), castleq!())
DECLARE SUB selectit (whatshere!(), whosehere!(), hgigh!(), pcon!, kingx!(), kingy!(), castler!(), castleq!())
DECLARE SUB makeboard ()
DECLARE SUB polymorphism (whatshere!(), whosehere!(), kingx!(), kingy!())
REM Benjamin Wolf
REM June 2, 2003 - June 11, 2003
REM Chess
REM
DIM whatshere(8, 8)
DIM whosehere(8, 8)
DIM kingx(2)
DIM kingy(2)
DIM hgigh(4 + 50 * INT((2 * 50 + 7) / 8))
DIM castlek(2)
DIM castleq(2)
CLS
PRINT " Welcome to Chess"
PRINT "    by Benjamin Wolf"
PRINT
OPEN "A:chess.txt" FOR APPEND AS #1
PRINT "to move:        |  Rules: You may deselect a selected"
PRINT "                |     piece by putting the cursor on"
PRINT " w              |    it and pressing space.  "
PRINT "a≈d             |      "
PRINT " s              |    If you are stalemated, select"
PRINT "                |    your king and press t while "
PRINT "Space to select |    it is still selected."
PRINT "                      To resign, select your king and"
PRINT "                     press r three times."
PRINT #1,
PRINT
 INPUT "Who will play as white"; N$
PRINT #1, DATE$
PRINT #1, " "; N$, "   vs.   ";
INPUT "Who will play as black"; N$
PRINT #1, N$;
SCREEN 12
CALL makeboard
CALL polymorphism(whatshere(), whosehere(), kingx(), kingy())
LINE (562, 12)-(610, 60), 9, BF
GET (561, 11)-(611, 61), hgigh
PUT (561, 11), hgigh
LOCATE 25, 4: PRINT "w"
LOCATE 26, 3: PRINT "a≈d"
LOCATE 27, 4: PRINT "s"
LOCATE 28, 1: PRINT "Space = select"
pcon = 1
turn = 0
DO
   pcon = pcon MOD 2 + 1
   IF pcon = 2 THEN
      turn = turn + 1
      PRINT #1,
      PRINT #1, RTRIM$(STR$(turn)); ". ";
   ELSE
      PRINT #1, "",
   END IF
   LOCATE 1, 38:
   IF pcon = 1 THEN PRINT "Black" ELSE PRINT "White"
   CALL selectit(whatshere(), whosehere(), hgigh(), pcon, kingx(), kingy(), castlek(), castleq())
LOOP

SUB bishopie (whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
nope = 0
IF ABS(x - f) = ABS(y - g) THEN
   FOR a = f + (x - f) / ABS(x - f) TO x - (x - f) / ABS(x - f) STEP (x - f) / ABS(x - f)
      FOR b = g + (y - g) / ABS(y - g) TO y - (y - g) / ABS(y - g) STEP (y - g) / ABS(y - g)
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN nope = 1
         END IF
      NEXT b
   NEXT a
   IF whosehere(x, y) = pcon THEN nope = 1
   IF nope = 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      h = whatshere(x, y)
      p = whosehere(x, y)
      whatshere(x, y) = 4
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 4
      whosehere(f, g) = pcon
      whatshere(x, y) = h
      whosehere(x, y) = p
      IF check = 0 THEN
         PUT (65 + f * 50, g * 50 - 12), hgigh
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PAINT (80 + f * 50, 24 + g * 50), c, c
         IF whatshere(x, y) <> 0 THEN CALL digestion(whatshere(), x, y)
         LINE (77 + x * 50, 25 + y * 50)-(90 + x * 50, y * 50), pcon * 8 - 1
         LINE -(102 + x * 50, 25 + y * 50), pcon * 8 - 1
         LINE -(77 + x * 50, 25 + y * 50), pcon * 8 - 1
         PAINT (80 + x * 50, 24 + y * 50), pcon * 8 - 1, pcon * 8 - 1
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 4
         whosehere(x, y) = pcon
         moved = 1
      END IF
   END IF
END IF
IF moved = 1 THEN
   CALL record(f, g, x, y)
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon MOD 2 + 1, check, pcon)
   LOCATE 13, 70:
   IF check = 1 THEN
      PRINT #1, "ch";
      PRINT "Check"
   ELSE
      PRINT "     "
   END IF
END IF
END SUB

SUB canitgohere (whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
SELECT CASE whatshere(f, g)
CASE IS = 1
   CALL pawnie(whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
CASE IS = 2
   CALL rookie(whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
CASE IS = 3
   CALL nightie(whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
CASE IS = 4
   CALL bishopie(whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
CASE IS = 5
   CALL queenie(whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
CASE IS = 6
   CALL kingpinnie(whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
END SELECT
END SUB

SUB checkcheck (whatshere(), whosehere(), kingx(), kingy(), pcon, check, nnn)
check = 0
x = kingx(pcon)
y = kingy(pcon)
'Check for checking by rook/queen
IF x < 8 THEN
   FOR a = x + 1 TO 8 STEP 1
      IF whatshere(a, y) <> 0 THEN
         IF (whatshere(a, y) = 2 OR whatshere(a, y) = 5) AND whosehere(a, y) = pcon MOD 2 + 1 THEN
            chksx = a
            chksy = y
            check = 1
            GOTO 3
         ELSE
            chksx = 0
            chksy = 0
            EXIT FOR
         END IF
      END IF
   NEXT a
END IF
IF x > 1 THEN
   FOR a = x - 1 TO 1 STEP -1
      IF whatshere(a, y) <> 0 THEN
         IF (whatshere(a, y) = 2 OR whatshere(a, y) = 5) AND whosehere(a, y) = pcon MOD 2 + 1 THEN
            chksx = a
            chksy = y
            check = 1
            GOTO 3
         ELSE
            chksx = 0
            chksy = 0
            EXIT FOR
         END IF
      END IF
   NEXT a
END IF
IF y < 8 THEN
   FOR a = y + 1 TO 8 STEP 1
      IF whatshere(x, a) <> 0 THEN
         IF (whatshere(x, a) = 2 OR whatshere(x, a) = 5) AND whosehere(x, a) = pcon MOD 2 + 1 THEN
            chksx = x
            chksy = a
            check = 1
            GOTO 3
         ELSE
            chksx = 0
            chksy = 0
            EXIT FOR
         END IF
      END IF
   NEXT a
END IF
IF y > 1 THEN
   FOR a = y - 1 TO 1 STEP -1
      IF whatshere(x, a) <> 0 THEN
         IF (whatshere(x, a) = 2 OR whatshere(x, a) = 5) AND whosehere(x, a) = pcon MOD 2 + 1 THEN
            chksx = x
            chksy = a
            check = 1
            GOTO 3
         ELSE
            chksx = 0
            chksy = 0
            EXIT FOR
         END IF
      END IF
   NEXT a
END IF

3

'Check for checking by knight
IF x > 1 AND y > 2 THEN
   IF whatshere(x - 1, y - 2) = 3 AND whosehere(x - 1, y - 2) = pcon MOD 2 + 1 THEN
      chknx = x - 1
      chkny = y - 2
      check = 1
      GOTO 5
   ELSE
      chknx = 0
      chkny = 0
   END IF
END IF
IF x > 1 AND y < 7 THEN
   IF whatshere(x - 1, y + 2) = 3 AND whosehere(x - 1, y + 2) = pcon MOD 2 + 1 THEN
      chknx = x - 1
      chkny = y + 2
      check = 1
      GOTO 5
   ELSE
      chknx = 0
      chkny = 0
   END IF
END IF
IF x > 2 AND y > 1 THEN
   IF whatshere(x - 2, y - 1) = 3 AND whosehere(x - 2, y - 1) = pcon MOD 2 + 1 THEN
      chknx = x - 2
      chkny = y - 1
      check = 1
      GOTO 5
   ELSE
      chknx = 0
      chkny = 0
   END IF
END IF
IF x > 2 AND y < 8 THEN
   IF whatshere(x - 2, y + 1) = 3 AND whosehere(x - 2, y + 1) = pcon MOD 2 + 1 THEN
      chknx = x - 2
      chkny = y + 1
      check = 1
      GOTO 5
   ELSE
      chknx = 0
      chkny = 0
   END IF
END IF
IF x < 7 AND y > 1 THEN
   IF whatshere(x + 2, y - 1) = 3 AND whosehere(x + 2, y - 1) = pcon MOD 2 + 1 THEN
      chknx = x + 2
      chkny = y - 1
      check = 1
      GOTO 5
   ELSE
      chknx = 0
      chkny = 0
   END IF
END IF
IF x < 7 AND y < 8 THEN
   IF whatshere(x + 2, y + 1) = 3 AND whosehere(x + 2, y + 1) = pcon MOD 2 + 1 THEN
      chknx = x + 2
      chkny = y + 1
      check = 1
      GOTO 5
   ELSE
      chknx = 0
      chkny = 0
   END IF
END IF
IF x < 8 AND y > 2 THEN
   IF whatshere(x + 1, y - 2) = 3 AND whosehere(x + 1, y - 2) = pcon MOD 2 + 1 THEN
      chknx = x + 1
      chkny = y - 2
      check = 1
      GOTO 5
   ELSE
      chknx = 0
      chkny = 0
   END IF
END IF
IF x < 8 AND y < 7 THEN
   IF whatshere(x + 1, y + 2) = 3 AND whosehere(x + 1, y + 2) = pcon MOD 2 + 1 THEN
      chknx = x + 1
      chkny = y + 2
      check = 1
      GOTO 5
   ELSE
      chknx = 0
      chkny = 0
   END IF
END IF

5

'Check for checking by bishop/queen
IF x > 1 AND y > 1 THEN
   FOR a = x - 1 TO 1 STEP -1
      FOR b = y - 1 TO 1 STEP -1
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN
               IF (whatshere(a, b) = 4 OR whatshere(a, b) = 5) AND whosehere(a, b) = pcon MOD 2 + 1 THEN
                  chkdx = a
                  chkdy = b
                  check = 1
                  GOTO 40
               ELSE
                  GOTO 10
               END IF
            END IF
         END IF
      NEXT b
   NEXT a
END IF
10
IF x > 1 AND y < 8 THEN
   FOR a = x - 1 TO 1 STEP -1
      FOR b = y + 1 TO 8
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN
               IF (whatshere(a, b) = 4 OR whatshere(a, b) = 5) AND whosehere(a, b) = pcon MOD 2 + 1 THEN
                  chkdx = a
                  chkdy = b
                  check = 1
                  GOTO 40
               ELSE
                  GOTO 20
               END IF
            END IF
         END IF
      NEXT b
   NEXT a
END IF
20
IF x < 8 AND y > 1 THEN
   FOR a = x + 1 TO 8
      FOR b = y - 1 TO 1 STEP -1
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN
               IF (whatshere(a, b) = 4 OR whatshere(a, b) = 5) AND whosehere(a, b) = pcon MOD 2 + 1 THEN
                  chkdx = a
                  chkdy = b
                  check = 1
                  GOTO 40
               ELSE
                  GOTO 30
               END IF
            END IF
         END IF
      NEXT b
   NEXT a
END IF
30
IF x < 8 AND y < 8 THEN
   FOR a = x + 1 TO 8
      FOR b = y + 1 TO 8
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN
               IF (whatshere(a, b) = 4 OR whatshere(a, b) = 5) AND whosehere(a, b) = pcon MOD 2 + 1 THEN
                  chkdx = a
                  chkdy = b
                  check = 1
               END IF
               GOTO 40
            END IF
         END IF
      NEXT b
   NEXT a
END IF
40

'Check for checking by pawn
IF y < 7 AND pcon = 1 THEN
   IF x > 1 THEN
      IF whatshere(x - 1, y + 1) = 1 AND whosehere(x - 1, y + 1) = 2 THEN
         chkpx = x - 1
         chkpy = y + 1
         check = 1
         GOTO 50
      END IF
   END IF
   IF x < 8 THEN
      IF whatshere(x + 1, y + 1) = 1 AND whosehere(x + 1, y + 1) = 2 THEN
         chkpx = x + 1
         chkpy = y + 1
         check = 1
         GOTO 50
      END IF
   END IF
ELSEIF y > 2 AND pcon = 2 THEN
   IF x > 1 THEN
      IF whatshere(x - 1, y - 1) = 1 AND whosehere(x - 1, y - 1) = 1 THEN
         chkpx = x - 1
         chkpy = y - 1
         check = 1
         GOTO 50
      END IF
   END IF
   IF x < 8 THEN
      IF whatshere(x + 1, y - 1) = 1 AND whosehere(x + 1, y - 1) = 1 THEN
         chkpx = x + 1
         chkpy = y - 1
         check = 1
         GOTO 50
      END IF
   END IF
END IF
50

'check for checking by king
IF y < 8 THEN
   IF x > 1 THEN
      IF whatshere(x - 1, y + 1) = 6 AND whosehere(x - 1, y + 1) = pcon MOD 2 + 1 THEN check = 1
   END IF
   IF whatshere(x, y + 1) = 6 AND whosehere(x, y + 1) = pcon MOD 2 + 1 THEN check = 1
   IF x < 8 THEN
      IF whatshere(x + 1, y + 1) = 6 AND whosehere(x + 1, y + 1) = pcon MOD 2 + 1 THEN check = 1
   END IF
ELSEIF y > 2 AND pcon = 2 THEN
   IF x > 1 THEN
      IF whatshere(x - 1, y - 1) = 6 AND whosehere(x - 1, y - 1) = pcon MOD 2 + 1 THEN check = 1
   END IF
   IF whatshere(x, y - 1) = 6 AND whosehere(x, y - 1) = pcon MOD 2 + 1 THEN check = 1
   IF x < 8 THEN
      IF whatshere(x + 1, y - 1) = 6 AND whosehere(x + 1, y - 1) = 1 THEN check = 1
   END IF
END IF


LOCATE 13, 70:
IF check = 1 AND nnn <> pcon THEN CALL matecheck(whatshere(), whosehere(), kingx(), kingy(), pcon, chksx, chksy, chknx, chkny, chkdx, chkdy, chkpx, chkpy)
END SUB

SUB digestion (whatshere(), x, y)
IF (x + y) MOD 2 = 0 THEN c = 4 ELSE c = 0
IF whatshere(x, y) = 2 THEN
   PAINT (76 + x * 50, y * 50), c, c
ELSEIF whatshere(x, y) = 5 THEN
   FOR z = 15 TO 1 STEP -1
      CIRCLE (90 + x * 50, 13 + y * 50), z, c
   NEXT z
ELSE
   PAINT (90 + x * 50, 13 + y * 50), c, c
END IF
END SUB

SUB intercept (whatshere(), whosehere(), x, y, mate, pcon)
'Check for intercepting by rook/queen
IF x < 8 THEN
   FOR a = x + 1 TO 8 STEP 1
      IF whatshere(a, y) <> 0 THEN
         IF (whatshere(a, y) = 2 OR whatshere(a, y) = 5) AND whosehere(a, y) = pcon THEN
            mate = 0
            GOTO 60
         ELSE
            EXIT FOR
         END IF
      END IF
   NEXT a
END IF
IF x > 1 THEN
   FOR a = x - 1 TO 1 STEP -1
      IF whatshere(a, y) <> 0 THEN
         IF (whatshere(a, y) = 2 OR whatshere(a, y) = 5) AND whosehere(a, y) = pcon THEN
            mate = 0
            GOTO 60
         ELSE
            EXIT FOR
         END IF
      END IF
   NEXT a
END IF
IF y < 8 THEN
   FOR a = y + 1 TO 8 STEP 1
      IF whatshere(x, a) <> 0 THEN
         IF (whatshere(x, a) = 2 OR whatshere(x, a) = 5) AND whosehere(x, a) = pcon THEN
            mate = 0
            GOTO 60
         ELSE
            EXIT FOR
         END IF
      END IF
   NEXT a
END IF
IF y > 1 THEN
   FOR a = y - 1 TO 1 STEP -1
      IF whatshere(x, a) <> 0 THEN
         IF (whatshere(x, a) = 2 OR whatshere(x, a) = 5) AND whosehere(x, a) = pcon THEN
            mate = 0
            GOTO 60
         ELSE
            EXIT FOR
         END IF
      END IF
   NEXT a
END IF

'Check for intercepting by knight
IF x > 1 AND y > 2 THEN
   IF whatshere(x - 1, y - 2) = 3 AND whosehere(x - 1, y - 2) = pcon THEN
      mate = 0
      GOTO 60
   END IF
END IF
IF x > 1 AND y < 7 THEN
   IF whatshere(x - 1, y + 2) = 3 AND whosehere(x - 1, y + 2) = pcon THEN
      mate = 0
      GOTO 60
   END IF
END IF
IF x > 2 AND y > 1 THEN
   IF whatshere(x - 2, y - 1) = 3 AND whosehere(x - 2, y - 1) = pcon THEN
      mate = 0
      GOTO 60
   END IF
END IF
IF x > 2 AND y < 8 THEN
   IF whatshere(x - 2, y + 1) = 3 AND whosehere(x - 2, y + 1) = pcon THEN
      mate = 0
      GOTO 60
   END IF
END IF
IF x < 7 AND y > 1 THEN
   IF whatshere(x + 2, y - 1) = 3 AND whosehere(x + 2, y - 1) = pcon THEN
      mate = 0
      GOTO 60
   END IF
END IF
IF x < 7 AND y < 8 THEN
   IF whatshere(x + 2, y + 1) = 3 AND whosehere(x + 2, y + 1) = pcon THEN
      mate = 0
      GOTO 60
   END IF
END IF
IF x < 8 AND y > 2 THEN
   IF whatshere(x + 1, y - 2) = 3 AND whosehere(x + 1, y - 2) = pcon THEN
      mate = 0
      GOTO 60
   END IF
END IF
IF x < 8 AND y < 7 THEN
   IF whatshere(x + 1, y + 2) = 3 AND whosehere(x + 1, y + 2) = pcon THEN
      mate = 0
      GOTO 60
   END IF
END IF

'Check for intercepting by bishop/queen
IF x > 1 AND y > 1 THEN
   FOR a = x - 1 TO 1 STEP -1
      FOR b = y - 1 TO 1 STEP -1
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN
               IF (whatshere(a, b) = 4 OR whatshere(a, b) = 5) AND whosehere(a, b) = pcon THEN
                  mate = 0
                  GOTO 60
               ELSE
                  GOTO 53
               END IF
            END IF
         END IF
      NEXT b
   NEXT a
END IF
53
IF x > 1 AND y < 8 THEN
   FOR a = x - 1 TO 1 STEP -1
      FOR b = y + 1 TO 8
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN
               IF (whatshere(a, b) = 4 OR whatshere(a, b) = 5) AND whosehere(a, b) = pcon THEN
                  mate = 0
                  GOTO 60
               ELSE
                  GOTO 55
               END IF
            END IF
         END IF
      NEXT b
   NEXT a
END IF
55
IF x < 8 AND y > 1 THEN
   FOR a = x + 1 TO 8
      FOR b = y - 1 TO 1 STEP -1
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN
               IF (whatshere(a, b) = 4 OR whatshere(a, b) = 5) AND whosehere(a, b) = pcon THEN
                  mate = 0
                  GOTO 60
               ELSE
                  GOTO 57
               END IF
            END IF
         END IF
      NEXT b
   NEXT a
END IF
57
IF x < 8 AND y < 8 THEN
   FOR a = x + 1 TO 8
      FOR b = y + 1 TO 8
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN
               IF (whatshere(a, b) = 4 OR whatshere(a, b) = 5) AND whosehere(a, b) = pcon THEN
                  mate = 0
                  GOTO 60
               ELSE
                  GOTO 59
               END IF
            END IF
         END IF
      NEXT b
   NEXT a
END IF
59
'Check for intercepting by pawn
IF y < 8 AND pcon = 2 THEN
   IF x > 1 THEN
      IF whatshere(x - 1, y + 1) = 1 AND whosehere(x - 1, y + 1) = 2 AND whosehere(x, y) = 1 THEN
         mate = 0
         GOTO 60
      END IF
   END IF
   IF whatshere(x, y + 1) = 1 AND whosehere(x, y + 1) = 2 AND whosehere(x, y) = 0 THEN
      mate = 0
      GOTO 60
   END IF
   IF x < 8 THEN
      IF whatshere(x + 1, y + 1) = 1 AND whosehere(x + 1, y + 1) = 2 AND whosehere(x, y) = 1 THEN
         mate = 0
         GOTO 60
      END IF
   END IF
ELSEIF y > 1 AND pcon = 1 THEN
   IF x > 1 THEN
      IF whatshere(x - 1, y - 1) = 1 AND whosehere(x - 1, y - 1) = 1 AND whosehere(x, y) = 2 THEN
         mate = 0
         GOTO 60
      END IF
   END IF
   IF whatshere(x, y - 1) = 1 AND whosehere(x, y - 1) = 1 AND whosehere(x, y) = 0 THEN
      mate = 0
      GOTO 60
   END IF
   IF x < 8 THEN
      IF whatshere(x + 1, y - 1) = 1 AND whosehere(x + 1, y - 1) = 1 AND whosehere(x, y) = 2 THEN
         mate = 0
         GOTO 60
      END IF
   END IF
END IF
60

END SUB

SUB kingpinnie (whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
s = 0
IF ABS(x - f) < 2 AND ABS(y - g) < 2 THEN
   kingx(pcon) = x
   kingy(pcon) = y
   d = whatshere(x, y)
   e = whosehere(x, y)
   whatshere(f, g) = 0
   whosehere(f, g) = 0
   whatshere(x, y) = 6
   whosehere(x, y) = pcon
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
   kingx(pcon) = f
   kingy(pcon) = g
   whatshere(f, g) = 6
   whosehere(f, g) = pcon
   whatshere(x, y) = d
   whosehere(x, y) = e
   IF check = 0 THEN
      IF whosehere(x, y) <> pcon THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         FOR z = 1 TO 25 STEP .5
            CIRCLE (90 + f * 50, 13 + g * 50), 11, c, , , z
         NEXT z
         IF whatshere(x, y) <> 0 THEN CALL digestion(whatshere(), x, y)
         FOR z = 1 TO 25 STEP .5
            CIRCLE (90 + x * 50, 13 + y * 50), 11, pcon * 8 - 1, , , z
         NEXT z
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         kingx(pcon) = x
         kingy(pcon) = y
         moved = 1
      END IF
   END IF
ELSEIF x - f = 2 AND y = g AND castlek(pcon) = 0 THEN
   IF whatshere(x - 1, y) = 0 AND whatshere(x, y) = 0 THEN
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      a = check
      kingx(pcon) = x - 1
      kingy(pcon) = y
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      whatshere(x - 1, y) = 6
      whosehere(x - 1, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      b = check
      kingx(pcon) = f
      kingy(pcon) = g
      whatshere(f, g) = 6
      whosehere(f, g) = pcon
      whatshere(x - 1, y) = 0
      whosehere(x - 1, y) = 0
      kingx(pcon) = x
      kingy(pcon) = y
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      whatshere(x, y) = 6
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      d = check
      kingx(pcon) = f
      kingy(pcon) = g
      whatshere(f, g) = 6
      whosehere(f, g) = pcon
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      IF a = 0 AND b = 0 AND d = 0 THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         FOR z = 1 TO 25 STEP .5
            CIRCLE (90 + f * 50, 13 + g * 50), 11, c, , , z
         NEXT z
         FOR z = 1 TO 25 STEP .5
            CIRCLE (90 + x * 50, 13 + y * 50), 11, pcon * 8 - 1, , , z
         NEXT z
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         kingx(pcon) = x
         kingy(pcon) = y
         f = 8
         g = pcon * 7 - 6
         x = 6
         y = g
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PAINT (76 + f * 50, g * 50), c, c
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 2
         whosehere(x, y) = pcon
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         LINE (75 + x * 50, y * 50 - 2)-(105 + x * 50, 28 + y * 50), pcon * 8 - 1, B
         PAINT (76 + x * 50, y * 50), pcon * 8 - 1, pcon * 8 - 1
         moved = 1
         s = 2
      END IF
   END IF
ELSEIF f - x = 2 AND y = g AND castleq(pcon) = 0 THEN
   IF whatshere(f - 1, y) = 0 AND whatshere(f - 3, y) = 0 AND whatshere(x, y) = 0 THEN
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      a = check
      kingx(pcon) = f - 1
      kingy(pcon) = y
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      whatshere(f - 1, y) = 6
      whosehere(f - 1, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      b = check
      kingx(pcon) = f
      kingy(pcon) = g
      whatshere(f, g) = 6
      whosehere(f, g) = pcon
      whatshere(f - 1, y) = 0
      whosehere(f - 1, y) = 0
      kingx(pcon) = f - 3
      kingy(pcon) = y
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      whatshere(f - 3, y) = 6
      whosehere(f - 3, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      d = check
      kingx(pcon) = f
      kingy(pcon) = g
      whatshere(f, g) = 6
      whosehere(f, g) = pcon
      whatshere(f - 3, y) = 0
      whosehere(f - 3, y) = 0
      kingx(pcon) = x
      kingy(pcon) = y
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      whatshere(x, y) = 6
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      e = check
      kingx(pcon) = f
      kingy(pcon) = g
      whatshere(f, g) = 6
      whosehere(f, g) = pcon
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      IF a = 0 AND b = 0 AND d = 0 AND e = 0 THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         FOR z = 1 TO 25 STEP .5
            CIRCLE (90 + f * 50, 13 + g * 50), 11, c, , , z
         NEXT z
         FOR z = 1 TO 25 STEP .5
            CIRCLE (90 + x * 50, 13 + y * 50), 11, pcon * 8 - 1, , , z
         NEXT z
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         kingx(pcon) = x
         kingy(pcon) = y
         f = 1
         g = pcon * 7 - 6
         x = 4
         y = g
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PAINT (76 + f * 50, g * 50), c, c
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 2
         whosehere(x, y) = pcon
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         LINE (75 + x * 50, y * 50 - 2)-(105 + x * 50, 28 + y * 50), pcon * 8 - 1, B
         PAINT (76 + x * 50, y * 50), pcon * 8 - 1, pcon * 8 - 1
         moved = 1
         s = 1
      END IF
   END IF
END IF
IF moved = 1 THEN
   castlek(pcon) = 1
   castleq(pcon) = 1
END IF
IF moved = 1 THEN
   IF s = 0 THEN
      CALL record(f, g, x, y)
   ELSEIF s = 1 THEN
      PRINT #1, "O-O-O"
   ELSEIF s = 2 THEN
      PRINT #1, "O-O"
   END IF
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon MOD 2 + 1, check, pcon)
   LOCATE 13, 70:
   IF check = 1 THEN
      PRINT #1, "ch";
      PRINT "Check"
   ELSE
      PRINT "     "
   END IF
END IF
END SUB

SUB makeboard
FOR x = 1 TO 9
   DRAW "BM 115," + LTRIM$(RTRIM$(STR$(x * 50 - 12))) + " R400"
NEXT x
FOR y = 1 TO 9
   DRAW "BM " + LTRIM$(RTRIM$(STR$(65 + y * 50))) + ",38 D400"
NEXT y
FOR x = 1 TO 8
   FOR y = 1 TO 8
      IF (x + y) MOD 2 = 0 THEN PAINT (66 + y * 50, x * 50 - 11), 4, 15
   NEXT y
NEXT x
LOCATE 2, 18: PRINT "A     B      C     D      E     F     G     H"
LOCATE 5, 67: PRINT "8"
LOCATE 8, 67: PRINT "7"
LOCATE 11, 67: PRINT "6"
LOCATE 14, 67: PRINT "5"
LOCATE 17, 67: PRINT "4"
LOCATE 20, 67: PRINT "3"
LOCATE 23, 67: PRINT "2"
LOCATE 26, 67: PRINT "1"
END SUB

SUB matecheck (whatshere(), whosehere(), kingx(), kingy(), pcon, chksx, chksy, chknx, chkny, chkdx, chkdy, chkpx, chkpy)
mate = 1
x = kingx(pcon)
y = kingy(pcon)
IF x > 1 THEN
   IF y > 1 THEN
      IF whosehere(x - 1, y - 1) <> pcon THEN
         kingx(pcon) = x - 1
         kingy(pcon) = y - 1
         d = whatshere(x - 1, y - 1)
         e = whosehere(x - 1, y - 1)
         whatshere(x, y) = 0
         whosehere(x, y) = 0
         whatshere(x - 1, y - 1) = 6
         whosehere(x - 1, y - 1) = pcon
         CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
         kingx(pcon) = x
         kingy(pcon) = y
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         whatshere(x - 1, y - 1) = d
         whosehere(x - 1, y - 1) = e
         IF check = 0 THEN mate = 0
      END IF
   END IF
   IF whosehere(x - 1, y) <> pcon THEN
      kingx(pcon) = x - 1
      kingy(pcon) = y
      d = whatshere(x - 1, y)
      e = whosehere(x - 1, y)
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      whatshere(x - 1, y) = 6
      whosehere(x - 1, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      kingx(pcon) = x
      kingy(pcon) = y
      whatshere(x, y) = 6
      whosehere(x, y) = pcon
      whatshere(x - 1, y) = d
      whosehere(x - 1, y) = e
      IF check = 0 THEN mate = 0
   END IF
   IF y < 8 THEN
      IF whosehere(x - 1, y + 1) <> pcon THEN
         kingx(pcon) = x - 1
         kingy(pcon) = y + 1
         d = whatshere(x - 1, y + 1)
         e = whosehere(x - 1, y + 1)
         whatshere(x, y) = 0
         whosehere(x, y) = 0
         whatshere(x - 1, y + 1) = 6
         whosehere(x - 1, y + 1) = pcon
         CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
         kingx(pcon) = x
         kingy(pcon) = y
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         whatshere(x - 1, y + 1) = d
         whosehere(x - 1, y + 1) = e
         IF check = 0 THEN mate = 0
      END IF
   END IF
END IF
IF y > 1 AND whosehere(x, y - 1) <> pcon THEN
   kingx(pcon) = x
   kingy(pcon) = y - 1
   d = whatshere(x, y - 1)
   e = whosehere(x, y - 1)
   whatshere(x, y) = 0
   whosehere(x, y) = 0
   whatshere(x, y - 1) = 6
   whosehere(x, y - 1) = pcon
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
   kingx(pcon) = x
   kingy(pcon) = y
   whatshere(x, y) = 6
   whosehere(x, y) = pcon
   whatshere(x, y - 1) = d
   whosehere(x, y - 1) = e
   IF check = 0 THEN mate = 0
END IF
IF x < 8 THEN
   IF y > 1 THEN
      IF whosehere(x + 1, y - 1) <> pcon THEN
         kingx(pcon) = x + 1
         kingy(pcon) = y - 1
         d = whatshere(x + 1, y - 1)
         e = whosehere(x + 1, y - 1)
         whatshere(x, y) = 0
         whosehere(x, y) = 0
         whatshere(x + 1, y - 1) = 6
         whosehere(x + 1, y - 1) = pcon
         CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
         kingx(pcon) = x
         kingy(pcon) = y
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         whatshere(x + 1, y - 1) = d
         whosehere(x + 1, y - 1) = e
         IF check = 0 THEN mate = 0
      END IF
   END IF
   IF whosehere(x + 1, y) <> pcon THEN
      kingx(pcon) = x + 1
      kingy(pcon) = y
      d = whatshere(x + 1, y)
      e = whosehere(x + 1, y)
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      whatshere(x + 1, y) = 6
      whosehere(x + 1, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      kingx(pcon) = x
      kingy(pcon) = y
      whatshere(x, y) = 6
      whosehere(x, y) = pcon
      whatshere(x + 1, y) = d
      whosehere(x + 1, y) = e
      IF check = 0 THEN mate = 0
   END IF
   IF y < 8 THEN
      IF whosehere(x + 1, y + 1) <> pcon THEN
         kingx(pcon) = x + 1
         kingy(pcon) = y + 1
         d = whatshere(x + 1, y + 1)
         e = whosehere(x + 1, y + 1)
         whatshere(x, y) = 0
         whosehere(x, y) = 0
         whatshere(x + 1, y + 1) = 6
         whosehere(x + 1, y + 1) = pcon
         CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
         kingx(pcon) = x
         kingy(pcon) = y
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         whatshere(x + 1, y + 1) = d
         whosehere(x + 1, y + 1) = e
         IF check = 0 THEN mate = 0
      END IF
   END IF
END IF
IF y < 8 THEN
   IF whosehere(x, y + 1) <> pcon THEN
      kingx(pcon) = x
      kingy(pcon) = y + 1
      d = whatshere(x, y + 1)
      e = whosehere(x, y + 1)
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      whatshere(x, y + 1) = 6
      whosehere(x, y + 1) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      kingx(pcon) = x
      kingy(pcon) = y
      whatshere(x, y) = 6
      whosehere(x, y) = pcon
      whatshere(x, y + 1) = d
      whosehere(x, y + 1) = e
      IF check = 0 THEN mate = 0
   END IF
END IF
IF mate = 0 THEN GOTO 100
IF chksx <> 0 THEN
   wert = 1
   IF chksx = x THEN
      FOR a = y + (chksy - y) / ABS(chksy - y) TO chksy STEP (chksy - y) / ABS(chksy - y)
         CALL intercept(whatshere(), whosehere(), x, a, wert, pcon)
      NEXT a
   ELSEIF chksy = y THEN
      FOR a = x + (chksx - x) / ABS(chksx - x) TO chksx STEP (chksx - x) / ABS(chksx - x)
         CALL intercept(whatshere(), whosehere(), a, y, wert, pcon)
      NEXT a
   END IF
   IF wert = 1 THEN GOTO 90
END IF
IF chknx <> 0 THEN
   wert = 1
   CALL intercept(whatshere(), whosehere(), chknx, chkny, wert, pcon)
   IF wert = 1 THEN GOTO 90
END IF
IF chkdx <> 0 THEN
   wert = 1
   FOR a = x - 3 * (chksx - x) / ABS(chksx - x) TO chksx - 2 * (chksx - x) / ABS(chksx - x) STEP (chksx - x) / ABS(chksx - x)
      FOR b = y - 3 * (chksy - y) / ABS(chksy - y) TO chksy - 2 * (chksy - y) / ABS(chksy - y) STEP (chksy - y) / ABS(chksy - y)
         IF x - a = y - b THEN CALL intercept(whatshere(), whosehere(), a, b, wert, pcon)
      NEXT b
   NEXT a
   IF wert = 1 THEN GOTO 90
END IF
IF chkpx <> 0 THEN
   wert = 1
   CALL intercept(whatshere(), whosehere(), chkpx, chkpy, wert, pcon)
   IF wert = 1 THEN GOTO 90
END IF
GOTO 100

90
PRINT #1, "chm"
CLOSE
LOCATE 13, 70: PRINT "Checkmate!"
LOCATE 15, 70: PRINT "Record @"
LOCATE 16, 70: PRINT "A:chess.txt"
END

100
END SUB

SUB movepiece (whatshere(), whosehere(), hgigh(), y, x, pcon, moved, kingx(), kingy(), castlek(), castleq())
g = y
f = x
IF whosehere(x, y) = pcon THEN
   DO
      w$ = INPUT$(1)
      PUT (65 + x * 50, y * 50 - 12), hgigh
      SELECT CASE UCASE$(w$)
      CASE "D"
         x = x MOD 8 + 1
      CASE "W"
         y = y - 1
         IF y < 1 THEN y = 8
      CASE "S"
         y = y MOD 8 + 1
      CASE "A"
         x = x - 1
         IF x < 1 THEN x = 8
      CASE " "
         IF x = f AND y = g THEN
            PUT (65 + x * 50, y * 50 - 12), hgigh
            EXIT DO
         END IF
         CALL canitgohere(whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
         IF moved = 1 THEN EXIT DO
      CASE "T"
         IF whatshere(f, g) = 6 AND whatshere(x, y) = 6 AND whosehere(f, g) = whosehere(x, y) THEN CALL stalecheck(whatshere(), whosehere(), kingx(), kingy(), pcon)
      CASE "R"
         IF whatshere(f, g) = 6 AND whatshere(x, y) = 6 AND whosehere(f, g) = whosehere(x, y) THEN CALL resigned(pcon)
      END SELECT
      PUT (65 + x * 50, y * 50 - 12), hgigh
   LOOP
END IF
END SUB

SUB nightie (whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
IF (ABS(x - f) = 2 AND ABS(y - g) = 1) OR (ABS(x - f) = 1 AND ABS(y - g) = 2) THEN
   IF whosehere(x, y) <> pcon THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      h = whatshere(x, y)
      p = whosehere(x, y)
      whatshere(x, y) = 3
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 3
      whosehere(f, g) = pcon
      whatshere(x, y) = h
      whosehere(x, y) = p
      IF check = 0 THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         PAINT (90 + f * 50, 15 + g * 50), c, c
         IF whatshere(x, y) <> 0 THEN CALL digestion(whatshere(), x, y)
         DRAW "C" + STR$(pcon * 8 - 1) + " BM" + STR$(76 + x * 50) + "," + STR$(8 + y * 50) + "E9 R9 F9 D9 G9 L9 H9 U9"
         PAINT (90 + x * 50, 15 + y * 50), pcon * 8 - 1, pcon * 8 - 1
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 3
         whosehere(x, y) = pcon
         moved = 1
      END IF
   END IF
END IF
IF moved = 1 THEN
   CALL record(f, g, x, y)
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon MOD 2 + 1, check, pcon)
   LOCATE 13, 70:
   IF check = 1 THEN
      PRINT #1, "ch";
      PRINT "Check"
   ELSE
      PRINT "     "
   END IF
END IF
END SUB

SUB pawnie (whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
IF y - g = 1 AND x = f AND pcon = 1 OR g - y = 1 AND x = f AND pcon = 2 THEN
   IF whatshere(x, y) = 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      whatshere(x, y) = 1
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 1
      whosehere(f, g) = pcon
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      IF check = 0 THEN
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 1
         whosehere(x, y) = pcon
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         PAINT (90 + f * 50, 13 + g * 50), c, c
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         PAINT (90 + x * 50, 13 + y * 50), pcon * 8 - 1, pcon * 8 - 1
         moved = 1
      END IF
   END IF
ELSEIF ABS(y - g) = 2 AND (g = 2 OR g = 7) AND x = f THEN
   IF whatshere(x, y) = 0 AND whatshere(x, y - (y - g) / ABS(y - g)) = 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      whatshere(x, y) = 1
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 1
      whosehere(f, g) = pcon
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      IF check = 0 THEN
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 1
         whosehere(x, y) = pcon
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         PAINT (90 + f * 50, 13 + g * 50), c, c
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         PAINT (90 + x * 50, 13 + y * 50), pcon * 8 - 1, pcon * 8 - 1
         moved = 1
      END IF
   END IF
ELSEIF g - y = pcon * 2 - 3 AND ABS(x - f) = 1 THEN
   IF whatshere(x, y) <> 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      h = whatshere(x, y)
      p = whosehere(x, y)
      whatshere(x, y) = 4
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 4
      whosehere(f, g) = pcon
      whatshere(x, y) = h
      whosehere(x, y) = p
      IF check = 0 THEN
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         CALL digestion(whatshere(), x, y)
         whatshere(x, y) = 1
         whosehere(x, y) = pcon
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         PAINT (90 + f * 50, 13 + g * 50), c, c
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         PAINT (90 + x * 50, 13 + y * 50), pcon * 8 - 1, pcon * 8 - 1
         PAINT (90 + x * 50, 13 + y * 50), c, c
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         PAINT (90 + x * 50, 13 + y * 50), pcon * 8 - 1, pcon * 8 - 1
         moved = 1
      END IF
   END IF
END IF
'if it reaches the back end
IF y = (ABS(pcon - 3) - 1) * 7 + 1 THEN
   CALL transform(whatshere(), whosehere(), x, y, pcon, e)
   t = 1
END IF
IF moved = 1 THEN
   CALL record(f, g, x, y)
   IF t = 1 THEN
      SELECT CASE e
      CASE IS = 1
         PRINT #1, "(R)";
      CASE IS = 2
         PRINT #1, "(N)";
      CASE IS = 3
         PRINT #1, "(B)";
      CASE IS = 4
         PRINT #1, "(Q)";
      END SELECT
   END IF
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon MOD 2 + 1, check, pcon)
   LOCATE 13, 70:
   IF check = 1 THEN
      PRINT #1, "ch";
      PRINT "Check"
   ELSE
      PRINT "     "
   END IF
END IF
END SUB

SUB polymorphism (whatshere(), whosehere(), kingx(), kingy())
'Pawns
FOR x = 2 TO 7 STEP 5
   FOR y = 1 TO 8
      CIRCLE (90 + y * 50, 13 + x * 50), 10, (x \ 5) * 8 + 7
      PAINT (90 + y * 50, 13 + x * 50), (x \ 5) * 8 + 7, (x \ 5) * 8 + 7
      whatshere(y, x) = 1
      whosehere(y, x) = x \ 5 + 1
   NEXT y
NEXT x
'Rooks
FOR x = 1 TO 8 STEP 7
   FOR y = 1 TO 8 STEP 7
      CIRCLE (90 + y * 50, 13 + x * 50), 10, (x \ 5) * 8 + 7
      LINE (75 + y * 50, x * 50 - 2)-(105 + y * 50, 28 + x * 50), (x \ 5) * 8 + 7, B
      PAINT (76 + y * 50, x * 50), (x \ 5) * 8 + 7, (x \ 5) * 8 + 7
      whatshere(y, x) = 2
      whosehere(y, x) = x \ 5 + 1
   NEXT y
'Knights
   FOR y = 2 TO 7 STEP 5
      DRAW "BM" + STR$(76 + y * 50) + "," + STR$(8 + x * 50) + "E9 R9 F9 D9 G9 L9 H9 U9 "
      PAINT (90 + y * 50, 15 + x * 50), (x \ 5) * 8 + 7, (x \ 5) * 8 + 7
      whatshere(y, x) = 3
      whosehere(y, x) = x \ 5 + 1
   NEXT y
'Bishops
   FOR y = 3 TO 6 STEP 3
      LINE (77 + y * 50, 25 + x * 50)-(90 + y * 50, x * 50), (x \ 5) * 8 + 7
      LINE -(102 + y * 50, 25 + x * 50), (x \ 5) * 8 + 7
      LINE -(77 + y * 50, 25 + x * 50), (x \ 5) * 8 + 7
      PAINT (80 + y * 50, 24 + x * 50), (x \ 5) * 8 + 7, (x \ 5) * 8 + 7
      whatshere(y, x) = 4
      whosehere(y, x) = x \ 5 + 1
   NEXT y
'Queens
   y = 4
   FOR z = 15 TO 1 STEP -1
      CIRCLE (90 + y * 50, 13 + x * 50), z, (x \ 5) * 8 + 7
   NEXT z
   whatshere(y, x) = 5
   whosehere(y, x) = x \ 5 + 1
'Kings
   y = 5
   FOR z = 1 TO 25 STEP .5
      CIRCLE (90 + y * 50, 13 + x * 50), 11, (x \ 5) * 8 + 7, , , z
   NEXT z
   whatshere(y, x) = 6
   whosehere(y, x) = x \ 5 + 1
   kingx(x \ 5 + 1) = 5
   kingy(x \ 5 + 1) = x
NEXT x
'Key
LOCATE 3, 4: PRINT "Pawn"
LOCATE 7, 4: PRINT "King"
LOCATE 11, 4: PRINT "Rook"
LOCATE 15, 3: PRINT "Knight"
LOCATE 19, 3: PRINT "Bishop"
LOCATE 23, 4: PRINT "Queen"
FOR x = 1 TO 2
   'Pawn
   CIRCLE (x * 40 - 20, 20), 10, (x \ 2) * 8 + 7
   PAINT (x * 40 - 20, 20), (x \ 2) * 8 + 7, (x \ 2) * 8 + 7
   'King
   FOR z = 1 TO 25 STEP .5
      CIRCLE (x * 40 - 20, 78), 11, (x \ 2) * 8 + 7, , , z
   NEXT z
   'Rook
   CIRCLE (x * 40 - 20, 135), 10, (x \ 2) * 8 + 7
   LINE (x * 40 - 35, 120)-(x * 40 - 5, 150), (x \ 2) * 8 + 7, B
   PAINT (x * 40 - 34, 125), (x \ 2) * 8 + 7, (x \ 2) * 8 + 7
   'Knight
   DRAW "BM" + STR$(x * 40 - 33) + ",193 E9 R9 F9 D9 G9 L9 H9 U9"
   PAINT (x * 40 - 20, 193), (x \ 2) * 8 + 7, (x \ 2) * 8 + 7
   'Bishop
   LINE (x * 40 - 33, 275)-(x * 40 - 20, 250), (x \ 2) * 8 + 7
   LINE -(x * 40 - 8, 275), (x \ 2) * 8 + 7
   LINE -(x * 40 - 33, 275), (x \ 2) * 8 + 7
   PAINT (x * 40 - 20, 260), (x \ 2) * 8 + 7, (x \ 2) * 8 + 7
   'Queen
   FOR z = 15 TO 1 STEP -1
      CIRCLE (x * 40 - 20, 330), z, (x \ 2) * 8 + 7
   NEXT z
NEXT x
END SUB

SUB queenie (whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
nope = 0
IF x - f <> 0 AND y - g = 0 THEN
   FOR a = f + (x - f) / ABS(x - f) TO x - (x - f) / ABS(x - f) STEP (x - f) / ABS(x - f)
      IF whatshere(a, y) <> 0 THEN nope = 1
   NEXT a
   IF whosehere(x, y) = pcon THEN nope = 1
   IF nope = 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      h = whatshere(x, y)
      p = whosehere(x, y)
      whatshere(x, y) = 5
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 5
      whosehere(f, g) = pcon
      whatshere(x, y) = h
      whosehere(x, y) = p
      IF check = 0 THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         FOR z = 15 TO 1 STEP -1
            CIRCLE (90 + f * 50, 13 + g * 50), z, c
         NEXT z
         IF whatshere(x, y) <> 0 THEN CALL digestion(whatshere(), x, y)
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 5
         whosehere(x, y) = pcon
         moved = 1
         FOR z = 15 TO 1 STEP -1
            CIRCLE (90 + x * 50, 13 + y * 50), z, pcon * 8 - 1
         NEXT z
      END IF
   END IF
ELSEIF x - f = 0 AND y - g <> 0 THEN
   FOR a = g + (y - g) / ABS(y - g) TO y - (y - g) / ABS(y - g) STEP (y - g) / ABS(y - g)
      IF whatshere(x, a) <> 0 THEN nope = 1
   NEXT a
   IF whosehere(x, y) = pcon THEN nope = 1
   IF nope = 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      h = whatshere(x, y)
      p = whosehere(x, y)
      whatshere(x, y) = 5
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 5
      whosehere(f, g) = pcon
      whatshere(x, y) = h
      whosehere(x, y) = p
      IF check = 0 THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         FOR z = 15 TO 1 STEP -1
            CIRCLE (90 + f * 50, 13 + g * 50), z, c
         NEXT z
         IF whatshere(x, y) <> 0 THEN CALL digestion(whatshere(), x, y)
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 5
         whosehere(x, y) = pcon
         moved = 1
         FOR z = 15 TO 1 STEP -1
            CIRCLE (90 + x * 50, 13 + y * 50), z, pcon * 8 - 1
         NEXT z
      END IF
   END IF
ELSEIF ABS(x - f) = ABS(y - g) THEN
   FOR a = f + (x - f) / ABS(x - f) TO x - (x - f) / ABS(x - f) STEP (x - f) / ABS(x - f)
      FOR b = g + (y - g) / ABS(y - g) TO y - (y - g) / ABS(y - g) STEP (y - g) / ABS(y - g)
         IF ABS(x - a) = ABS(y - b) THEN
            IF whatshere(a, b) <> 0 THEN nope = 1
         END IF
      NEXT b
   NEXT a
   IF whosehere(x, y) = pcon THEN nope = 1
   IF nope = 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      h = whatshere(x, y)
      p = whosehere(x, y)
      whatshere(x, y) = 5
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 5
      whosehere(f, g) = pcon
      whatshere(x, y) = h
      whosehere(x, y) = p
      IF check = 0 THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         FOR z = 15 TO 1 STEP -1
            CIRCLE (90 + f * 50, 13 + g * 50), z, c
         NEXT z
         IF whatshere(x, y) <> 0 THEN CALL digestion(whatshere(), x, y)
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 5
         whosehere(x, y) = pcon
         moved = 1
         FOR z = 15 TO 1 STEP -1
            CIRCLE (90 + x * 50, 13 + y * 50), z, pcon * 8 - 1
         NEXT z
      END IF
   END IF
END IF
IF moved = 1 THEN
   CALL record(f, g, x, y)
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon MOD 2 + 1, check, pcon)
   LOCATE 13, 70:
   IF check = 1 THEN
      PRINT #1, "ch";
      PRINT "Check"
   ELSE
      PRINT "     "
   END IF
END IF
END SUB

SUB record (f, g, x, y)
row$ = CHR$(f + 64)
SELECT CASE g
CASE IS = 1
   col$ = "8"
CASE IS = 2
   col$ = "7"
CASE IS = 3
   col$ = "6"
CASE IS = 4
   col$ = "5"
CASE IS = 5
   col$ = "4"
CASE IS = 6
   col$ = "3"
CASE IS = 7
   col$ = "2"
CASE IS = 8
   col$ = "1"
END SELECT
row2$ = CHR$(x + 64)
SELECT CASE y
CASE IS = 1
   col2$ = "8"
CASE IS = 2
   col2$ = "7"
CASE IS = 3
   col2$ = "6"
CASE IS = 4
   col2$ = "5"
CASE IS = 5
   col2$ = "4"
CASE IS = 6
   col2$ = "3"
CASE IS = 7
   col2$ = "2"
CASE IS = 8
   col2$ = "1"
END SELECT
PRINT #1, row$; col$; "-"; row2$; col2$;
END SUB

SUB resigned (pcon)
w$ = INPUT$(2)
IF UCASE$(w$) = "RR" THEN
   IF pcon = 1 THEN p$ = "Black" ELSE p$ = "White"
   LOCATE 13, 70: PRINT p$
   LOCATE 14, 70: PRINT "Resigns"
   PRINT #1, "Resigns"
   LOCATE 15, 70: PRINT "Record @"
   LOCATE 16, 70: PRINT "A:chess.txt"
   CLOSE
   END
END IF
END SUB

SUB rookie (whatshere(), whosehere(), hgigh(), y, x, f, g, pcon, moved, kingx(), kingy(), castlek(), castleq())
nope = 0
IF x - f <> 0 AND y - g = 0 THEN
   FOR a = f + (x - f) / ABS(x - f) TO x - (x - f) / ABS(x - f) STEP (x - f) / ABS(x - f)
      IF whatshere(a, y) <> 0 THEN nope = 1
   NEXT a
   IF whosehere(x, y) = pcon THEN nope = 1
   IF nope = 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      h = whatshere(x, y)
      p = whosehere(x, y)
      whatshere(x, y) = 2
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 2
      whosehere(f, g) = pcon
      whatshere(x, y) = h
      whosehere(x, y) = p
      IF check = 0 THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         PAINT (76 + f * 50, g * 50), c, c
         IF whatshere(x, y) <> 0 THEN CALL digestion(whatshere(), x, y)
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 2
         whosehere(x, y) = pcon
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         LINE (75 + x * 50, y * 50 - 2)-(105 + x * 50, 28 + y * 50), pcon * 8 - 1, B
         PAINT (76 + x * 50, y * 50), pcon * 8 - 1, pcon * 8 - 1
         moved = 1
      END IF
   END IF
ELSEIF x - f = 0 AND y - g <> 0 THEN
   FOR a = g + (y - g) / ABS(y - g) TO y - (y - g) / ABS(y - g) STEP (y - g) / ABS(y - g)
      IF whatshere(x, a) <> 0 THEN nope = 1
   NEXT a
   IF whosehere(x, y) = pcon THEN nope = 1
   IF nope = 0 THEN
      whatshere(f, g) = 0
      whosehere(f, g) = 0
      h = whatshere(x, y)
      p = whosehere(x, y)
      whatshere(x, y) = 2
      whosehere(x, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      whatshere(f, g) = 2
      whosehere(f, g) = pcon
      whatshere(x, y) = h
      whosehere(x, y) = p
      IF check = 0 THEN
         IF (f + g) MOD 2 = 0 THEN c = 4 ELSE c = 0
         PUT (65 + f * 50, g * 50 - 12), hgigh
         PAINT (76 + f * 50, g * 50), c, c
         IF whatshere(x, y) <> 0 THEN CALL digestion(whatshere(), x, y)
         whatshere(f, g) = 0
         whosehere(f, g) = 0
         whatshere(x, y) = 2
         whosehere(x, y) = pcon
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         LINE (75 + x * 50, y * 50 - 2)-(105 + x * 50, 28 + y * 50), pcon * 8 - 1, B
         PAINT (76 + x * 50, y * 50), pcon * 8 - 1, pcon * 8 - 1
         moved = 1
      END IF
   END IF
END IF
IF moved = 1 AND f = 8 AND g = pcon * 7 - 6 THEN castlek(pcon) = 1
IF moved = 1 AND f = 1 AND g = pcon * 7 - 6 THEN castleq(pcon) = 1
IF moved = 1 THEN
   CALL record(f, g, x, y)
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon MOD 2 + 1, check, pcon)
   LOCATE 13, 70:
   IF check = 1 THEN
      PRINT #1, "ch";
      PRINT "Check"
   ELSE
      PRINT "     "
   END IF
END IF
END SUB

SUB selectit (whatshere(), whosehere(), hgigh(), pcon, kingx(), kingy(), castlek(), castleq())
'y: 8=1,7=2,6=3,5=4,4=5,3=6,2=7,1=8
'x: A=1,B=2,C=3,D=4,E=5,F=6,G=7,H=8
moved = 0
y = 1
x = 1
PUT (65 + x * 50, y * 50 - 12), hgigh
DO
   w$ = INPUT$(1)
   PUT (65 + x * 50, y * 50 - 12), hgigh
   SELECT CASE UCASE$(w$)
   CASE "D"
      x = x MOD 8 + 1
   CASE "W"
      y = y - 1
      IF y < 1 THEN y = 8
   CASE "S"
      y = y MOD 8 + 1
   CASE "A"
      x = x - 1
      IF x < 1 THEN x = 8
   CASE " "
      CALL movepiece(whatshere(), whosehere(), hgigh(), y, x, pcon, moved, kingx(), kingy(), castlek(), castleq())
      IF moved = 1 THEN EXIT DO
   END SELECT
   PUT (65 + x * 50, y * 50 - 12), hgigh
LOOP
END SUB

SUB stalecheck (whatshere(), whosehere(), kingx(), kingy(), pcon)
stalebert = 1
x = kingx(pcon)
y = kingy(pcon)
IF x > 1 THEN
   IF y > 1 THEN
      IF whosehere(x - 1, y - 1) <> pcon THEN
         kingx(pcon) = x - 1
         kingy(pcon) = y - 1
         d = whatshere(x - 1, y - 1)
         e = whosehere(x - 1, y - 1)
         whatshere(x, y) = 0
         whosehere(x, y) = 0
         whatshere(x - 1, y - 1) = 6
         whosehere(x - 1, y - 1) = pcon
         CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
         kingx(pcon) = x
         kingy(pcon) = y
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         whatshere(x - 1, y - 1) = d
         whosehere(x - 1, y - 1) = e
         IF check = 0 THEN stalebert = 0
      END IF
   END IF
   IF whosehere(x - 1, y) <> pcon THEN
      kingx(pcon) = x - 1
      kingy(pcon) = y
      d = whatshere(x - 1, y)
      e = whosehere(x - 1, y)
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      whatshere(x - 1, y) = 6
      whosehere(x - 1, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      kingx(pcon) = x
      kingy(pcon) = y
      whatshere(x, y) = 6
      whosehere(x, y) = pcon
      whatshere(x - 1, y) = d
      whosehere(x - 1, y) = e
      IF check = 0 THEN stalebert = 0
   END IF
   IF y < 8 THEN
      IF whosehere(x - 1, y + 1) <> pcon THEN
         kingx(pcon) = x - 1
         kingy(pcon) = y + 1
         d = whatshere(x - 1, y + 1)
         e = whosehere(x - 1, y + 1)
         whatshere(x, y) = 0
         whosehere(x, y) = 0
         whatshere(x - 1, y + 1) = 6
         whosehere(x - 1, y + 1) = pcon
         CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
         kingx(pcon) = x
         kingy(pcon) = y
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         whatshere(x - 1, y + 1) = d
         whosehere(x - 1, y + 1) = e
         IF check = 0 THEN stalebert = 0
      END IF
   END IF
END IF
IF y > 1 AND whosehere(x, y - 1) <> pcon THEN
   kingx(pcon) = x
   kingy(pcon) = y - 1
   d = whatshere(x, y - 1)
   e = whosehere(x, y - 1)
   whatshere(x, y) = 0
   whosehere(x, y) = 0
   whatshere(x, y - 1) = 6
   whosehere(x, y - 1) = pcon
   CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
   kingx(pcon) = x
   kingy(pcon) = y
   whatshere(x, y) = 6
   whosehere(x, y) = pcon
   whatshere(x, y - 1) = d
   whosehere(x, y - 1) = e
   IF check = 0 THEN stalebert = 0
END IF
IF x < 8 THEN
   IF y > 1 THEN
      IF whosehere(x + 1, y - 1) <> pcon THEN
         kingx(pcon) = x + 1
         kingy(pcon) = y - 1
         d = whatshere(x + 1, y - 1)
         e = whosehere(x + 1, y - 1)
         whatshere(x, y) = 0
         whosehere(x, y) = 0
         whatshere(x + 1, y - 1) = 6
         whosehere(x + 1, y - 1) = pcon
         CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
         kingx(pcon) = x
         kingy(pcon) = y
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         whatshere(x + 1, y - 1) = d
         whosehere(x + 1, y - 1) = e
         IF check = 0 THEN stalebert = 0
      END IF
   END IF
   IF whosehere(x + 1, y) <> pcon THEN
      kingx(pcon) = x + 1
      kingy(pcon) = y
      d = whatshere(x + 1, y)
      e = whosehere(x + 1, y)
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      whatshere(x + 1, y) = 6
      whosehere(x + 1, y) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      kingx(pcon) = x
      kingy(pcon) = y
      whatshere(x, y) = 6
      whosehere(x, y) = pcon
      whatshere(x + 1, y) = d
      whosehere(x + 1, y) = e
      IF check = 0 THEN stalebert = 0
   END IF
   IF y < 8 THEN
      IF whosehere(x + 1, y + 1) <> pcon THEN
         kingx(pcon) = x + 1
         kingy(pcon) = y + 1
         d = whatshere(x + 1, y + 1)
         e = whosehere(x + 1, y + 1)
         whatshere(x, y) = 0
         whosehere(x, y) = 0
         whatshere(x + 1, y + 1) = 6
         whosehere(x + 1, y + 1) = pcon
         CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
         kingx(pcon) = x
         kingy(pcon) = y
         whatshere(x, y) = 6
         whosehere(x, y) = pcon
         whatshere(x + 1, y + 1) = d
         whosehere(x + 1, y + 1) = e
         IF check = 0 THEN stalebert = 0
      END IF
   END IF
END IF
IF y < 8 THEN
   IF whosehere(x, y + 1) <> pcon THEN
      kingx(pcon) = x
      kingy(pcon) = y + 1
      d = whatshere(x, y + 1)
      e = whosehere(x, y + 1)
      whatshere(x, y) = 0
      whosehere(x, y) = 0
      whatshere(x, y + 1) = 6
      whosehere(x, y + 1) = pcon
      CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
      kingx(pcon) = x
      kingy(pcon) = y
      whatshere(x, y) = 6
      whosehere(x, y) = pcon
      whatshere(x, y + 1) = d
      whosehere(x, y + 1) = e
      IF check = 0 THEN stalebert = 0
   END IF
END IF
CALL checkcheck(whatshere(), whosehere(), kingx(), kingy(), pcon, check, pcon)
IF check = 1 THEN stalebert = 0
IF stalebert = 1 THEN
   PRINT #1,
   PRINT #1, "Stalemate declared."
   CLOSE
   LOCATE 13, 69: PRINT "Stalemate."
   LOCATE 15, 70: PRINT "Record @"
   LOCATE 16, 70: PRINT "A:chess.txt"
   END
END IF
END SUB

SUB transform (whatshere(), whosehere(), x, y, pcon, e)
REDIM thinbox(4 + 65 * INT((17 * 2 + 7) / 8))
LINE (562, 12)-(625, 27), 3, BF
GET (561, 11)-(626, 28), thinbox
PUT (561, 11), thinbox
e = 1
PUT (9, 94 + 64 * e), thinbox
DO
   w$ = INPUT$(1)
   PUT (9, 94 + 64 * e), thinbox
   SELECT CASE UCASE$(w$)
   CASE "W"
      e = e - 1
      IF e < 1 THEN e = 4
   CASE "S"
      e = e MOD 4 + 1
   CASE " "
      IF (x + y) MOD 2 = 0 THEN c = 4 ELSE c = 0
      PAINT (90 + x * 50, 13 + y * 50), c, c
      IF e = 1 THEN
         CIRCLE (90 + x * 50, 13 + y * 50), 10, pcon * 8 - 1
         LINE (75 + x * 50, y * 50 - 2)-(105 + x * 50, 28 + y * 50), pcon * 8 - 1, B
         PAINT (76 + x * 50, y * 50), pcon * 8 - 1, pcon * 8 - 1
      ELSEIF e = 2 THEN
         COLOR pcon * 8 - 1
         DRAW "BM" + STR$(76 + x * 50) + "," + STR$(8 + y * 50) + "E9 R9 F9 D9 G9 L9 H9 U9 "
         PAINT (90 + x * 50, 15 + y * 50), pcon * 8 - 1, pcon * 8 - 1
      ELSEIF e = 3 THEN
         LINE (77 + x * 50, 25 + y * 50)-(90 + x * 50, y * 50), pcon * 8 - 1
         LINE -(102 + x * 50, 25 + y * 50), pcon * 8 - 1
         LINE -(77 + x * 50, 25 + y * 50), pcon * 8 - 1
         PAINT (80 + x * 50, 24 + y * 50), pcon * 8 - 1, pcon * 8 - 1
      ELSEIF e = 4 THEN
         FOR z = 15 TO 1 STEP -1
            CIRCLE (90 + x * 50, 13 + y * 50), z, pcon * 8 - 1
         NEXT z
      END IF
      whatshere(x, y) = e + 1
      whosehere(x, y) = pcon
      EXIT DO
   END SELECT
   PUT (9, 94 + 64 * e), thinbox
LOOP
END SUB

