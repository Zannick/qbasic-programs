DECLARE SUB yahtze (dieroll!(), scorespot!(), s!(), pyer!, z!)
DECLARE SUB finalscore (scorespot!(), pyer!, gtotl!(), pnam$())
DECLARE SUB ofakind (dieroll!(), scorespot!(), s!(), pyer!, z!)
DECLARE SUB rscore (dieroll!(), scorespot!(), s!(), pyer!, z!, t!)
DECLARE SUB niner (dieroll!(), scorespot!(), s!(), pyer!, z!)
DECLARE SUB strait (dieroll!(), scorespot!(), s!(), pyer!, z!)
DECLARE SUB leftie (dieroll!(), scorespot!(), s!(), pyer!, z!)
DECLARE SUB scoresession (dieroll!(), scorespot!(), s!(), pyer!)
DECLARE SUB rolldice (die1!(), die2!(), die3!(), die4!(), die5!(), die6!(), dieroll!(), hold!(), pnam$(), pyer!)
DECLARE SUB selection (pspot!, xs!, ys!, cursor!(), xit!, hold!(), tim!, holdspot!())
DECLARE SUB pushbutton (pspot!, xit!, hold!(), tim!, holdspot!(), cursor!())
DECLARE SUB makeboard (pnam$())
DECLARE SUB makedice (die1!(), die2!(), die3!(), die4!(), die5!(), die6!())
REM Benjamin Wolf
REM May 19, 2003
REM Yahtzee!
REM
DIM die1(464)
DIM die2(464)
DIM die3(464)
DIM die4(464)
DIM die5(464)
DIM die6(464)
DIM pnam$(2)
DIM dieroll(5)
DIM cursor(290)
DIM hold(6)
DIM holdspot(290)
DIM scorespot(2, 14)
DIM s(2, 13)
DIM gtotl(2)
CLS
PRINT "Yahtzee!"
PRINT
FOR x = 1 TO 2
   PRINT "Player"; x; "enter your name:";
   INPUT " ", pnam$(x)
NEXT x
SCREEN 12
LINE (230, 130)-(280, 150), 4, BF
GET (229, 129)-(281, 151), cursor
CLS
LINE (230, 130)-(280, 150), 1, BF
GET (229, 129)-(281, 151), holdspot
CLS
CALL makedice(die1(), die2(), die3(), die4(), die5(), die6())
CALL makeboard(pnam$())
PAINT (261, 11), 0, 0
LOCATE 5, 3: PRINT "Hold  Hold  Hold   Hold  Hold"
LOCATE 10, 5: PRINT "Roll!"
LOCATE 10, 20: PRINT "Score"
pyer = 0
FOR thisisnotatestirepeatthisisnotatest = 1 TO 26
   pyer = pyer MOD 2 + 1
   PUT (26, 140), cursor
   LOCATE 17, 2: PRINT pnam$(pyer); "'s turn                "
   DO
      IF ASC(INPUT$(1)) = 32 THEN
         tim = 0
         PUT (26, 140), cursor
         FOR x = 1 TO 5
            IF hold(x) = 1 THEN PUT (x * 50 - 46, 60), holdspot
            hold(x) = 0
         NEXT x
         DO
        
         CALL rolldice(die1(), die2(), die3(), die4(), die5(), die6(), dieroll(), hold(), pnam$(), pyer)
         pspot = 6
         PUT (26, 140), cursor
         xs = 26
         ys = 140
         tim = tim + 1
         IF tim < 3 THEN
            xit = 0
            DO
               CALL selection(pspot, xs, ys, cursor(), xit, hold(), tim, holdspot())
            LOOP UNTIL xit = 1
         END IF
         LOOP UNTIL tim = 3
         CALL scoresession(dieroll(), scorespot(), s(), pyer)
         EXIT DO
      END IF
   LOOP
   PUT (xs, ys), cursor
   IF thisisnotatestirepeatthisisnotatest > 24 THEN CALL finalscore(scorespot(), pyer, gtotl(), pnam$())
NEXT thisisnotatestirepeatthisisnotatest
IF gtotl(1) > gtotl(2) THEN
   LOCATE 16, 32: PRINT pnam$(1); " is the winner!"
ELSEIF gtotl(1) = gtotl(2) THEN
   LOCATE 16, 27: PRINT pnam$(1); " and "; pnam$(2); " are tied!"
ELSEIF gtotl(1) < gtotl(2) THEN
   LOCATE 16, 32: PRINT pnam$(2); " is the winner!"
END IF
LOCATE 1, 39: PRINT "YahtzeeMan!"
END

SUB finalscore (scorespot(), pyer, gtotl(), pnam$())
FOR x = 1 TO 14
   gtotl(pyer) = gtotl(pyer) + scorespot(pyer, x)
NEXT x
IF pnam$(pyer) = "YahtzeeMan!" THEN
   gtotl(pyer) = 0
   LOCATE 14, 14: PRINT "There will be NO CHEATING using this Yahtzee game!"
END IF
LOCATE 27, 27 + pyer * 4: PRINT LTRIM$(RTRIM$(STR$(gtotl(pyer))))
LINE (192 + pyer * 36, 301 + 8 * 16)-(228 + pyer * 36, 301 + 8 * 16)
END SUB

SUB leftie (dieroll(), scorespot(), s(), pyer, z)
FOR a = 1 TO 5
   IF dieroll(a) = z THEN scorespot(pyer, z) = scorespot(pyer, z) + dieroll(a)
NEXT a
s(pyer, z) = 1
LOCATE 19 + z, 9 + pyer * 3: PRINT LTRIM$(RTRIM$(STR$(scorespot(pyer, z))))
LINE (60 + pyer * 24, 301 + z * 16)-(84 + pyer * 24, 301 + z * 16)
totl = 0
IF s(pyer, 1) AND s(pyer, 2) AND s(pyer, 3) AND s(pyer, 4) AND s(pyer, 5) AND s(pyer, 6) THEN
   FOR x = 1 TO 6
      totl = totl + scorespot(pyer, x)
   NEXT x
   LOCATE 26, 9 + pyer * 3: PRINT LTRIM$(RTRIM$(STR$(totl)))
   LINE (60 + pyer * 24, 301 + 7 * 16)-(84 + pyer * 24, 301 + 7 * 16)
   IF totl >= 63 THEN
      scorespot(pyer, 14) = 35
      LOCATE 27, 9 + pyer * 3: PRINT "35"
      LINE (60 + pyer * 24, 301 + 8 * 16)-(84 + pyer * 24, 301 + 8 * 16)
   ELSE
      scorespot(pyer, 14) = 0
      LOCATE 27, 9 + pyer * 3: PRINT " 0"
      LINE (60 + pyer * 24, 301 + 8 * 16)-(84 + pyer * 24, 301 + 8 * 16)
   END IF
END IF
END SUB

SUB makeboard (pnam$())
LOCATE 19, 2: PRINT "Section 1 "; LEFT$(LTRIM$(pnam$(1)), 1); "  "; LEFT$(LTRIM$(pnam$(2)), 1)
LOCATE 19, 18: PRINT "Section 2   "; LEFT$(LTRIM$(pnam$(1)), 1); "    "; LEFT$(LTRIM$(pnam$(2)), 1)
PRINT " Ones            3 of a kind           Cursor"
PRINT " Twos            4 of a kind          Control:"
PRINT " Threes          Full House"
PRINT " Fours           Sm Straight             w"
PRINT " Fives           Lg Straight            a≈d"
PRINT " Sixes           Yahtzee                 s"
PRINT " Total           Chance"
PRINT " Bonus           Grand Total          Space to confirm choice"
DRAW "BM 2,285 R82 D144 R24 U144 L24 R48 D144 U144 R96 D144 R36 U144 L36 R72"
DRAW "D16 L298 D16 R298 D16 L298 D16 R298 D16 L298 D16 R298 D16 L298 D16"
DRAW "R298 D16 L298 U144 R298 D144"
END SUB

SUB makedice (die1(), die2(), die3(), die4(), die5(), die6())
'die1
LINE (10, 10)-(50, 50), 15, B
CIRCLE (30, 30), 5, 15
PAINT (15, 15), 15, 15
GET (9, 9)-(51, 51), die1
'die2
LINE (60, 10)-(100, 50), 15, B
CIRCLE (70, 20), 5, 15
CIRCLE (90, 40), 5, 15
PAINT (61, 11), 15, 15
GET (59, 9)-(101, 51), die2
'die3
LINE (110, 10)-(150, 50), 15, B
CIRCLE (120, 40), 5, 15
CIRCLE (130, 30), 5, 15
CIRCLE (140, 20), 5, 15
PAINT (111, 11), 15, 15
GET (109, 9)-(151, 51), die3
'die4
LINE (160, 10)-(200, 50), 15, B
CIRCLE (170, 20), 5, 15
CIRCLE (190, 20), 5, 15
CIRCLE (170, 40), 5, 15
CIRCLE (190, 40), 5, 15
PAINT (161, 11), 15, 15
GET (159, 9)-(201, 51), die4
'die5
LINE (210, 10)-(250, 50), 15, B
CIRCLE (220, 20), 5, 15
CIRCLE (240, 20), 5, 15
CIRCLE (220, 40), 5, 15
CIRCLE (240, 40), 5, 15
CIRCLE (230, 30), 5, 15
PAINT (211, 11), 15, 15
GET (209, 9)-(251, 51), die5
'die6
LINE (260, 10)-(300, 50), 15, B
CIRCLE (270, 20), 5, 15
CIRCLE (270, 30), 5, 15
CIRCLE (270, 40), 5, 15
CIRCLE (290, 20), 5, 15
CIRCLE (290, 30), 5, 15
CIRCLE (290, 40), 5, 15
PAINT (261, 11), 15, 15
GET (259, 9)-(301, 51), die6
END SUB

SUB niner (dieroll(), scorespot(), s(), pyer, z)
q = 1
FOR a = 2 TO 5
   IF dieroll(a) = dieroll(1) THEN q = q + 1 ELSE b = a
NEXT a
w = w + 1
FOR x = 1 TO 5
   IF x <> b THEN
      IF dieroll(x) = dieroll(b) THEN w = w + 1
   END IF
NEXT x
IF q = 3 AND w = 2 OR q = 2 AND w = 3 THEN t = 1 ELSE t = 0
CALL rscore(dieroll(), scorespot(), s(), pyer, z, t)
END SUB

SUB ofakind (dieroll(), scorespot(), s(), pyer, z)
FOR x = 1 TO 5
   FOR y = 1 TO 5
      IF y <> x THEN
         IF dieroll(y) = dieroll(x) THEN q = q + 1
         IF q = z - 4 THEN
            t = 1
            GOTO 20
         END IF
      END IF
   NEXT y
NEXT x
t = 0
20                                               
CALL rscore(dieroll(), scorespot(), s(), pyer, z, t)
END SUB

SUB pushbutton (pspot, xit, hold(), tim, holdspot(), cursor())
SELECT CASE pspot
CASE IS < 6
   hold(pspot) = (hold(pspot) + 1) MOD 2
   PUT (pspot * 50 - 46, 60), cursor
   PUT (pspot * 50 - 46, 60), holdspot
   xit = 0
CASE IS = 7
   PUT (146, 140), cursor
   tim = 3
END SELECT
END SUB

SUB rolldice (die1(), die2(), die3(), die4(), die5(), die6(), dieroll(), hold(), pnam$(), pyer)
FOR a = 1 TO 5
   IF hold(a) = 0 THEN PAINT (a * 50 - 39, 11), 0, 0
NEXT a
SLEEP 1
FOR a = 1 TO 5
   DO WHILE hold(a) = 1
      a = a + 1
   LOOP
   IF a = 6 THEN EXIT FOR
   FOR x = 1 TO TIMER
      hole = RND
   NEXT x
   FOR x = 1 TO RND * 10000
      hole = RND
   NEXT x
10 dieroll(a) = INT(RND * 6) + 1
   IF pnam$(pyer) = "YahtzeeMan!" AND a > 1 THEN dieroll(a) = dieroll(1)
   SELECT CASE dieroll(a)
   CASE 1
      PUT (a * 50 - 41, 9), die1, PSET
   CASE 2
      PUT (a * 50 - 41, 9), die2, PSET
   CASE 3
      PUT (a * 50 - 41, 9), die3, PSET
   CASE 4
      PUT (a * 50 - 41, 9), die4, PSET
   CASE 5
      PUT (a * 50 - 41, 9), die5, PSET
   CASE 6
      PUT (a * 50 - 41, 9), die6, PSET
   CASE 7
      GOTO 10
   END SELECT
NEXT a
END SUB

SUB rscore (dieroll(), scorespot(), s(), pyer, z, t)
IF z = 7 OR z = 8 OR z = 13 THEN
   FOR a = 1 TO 5
      totl = totl + dieroll(a)
   NEXT a
ELSEIF z = 9 THEN
   totl = 25
ELSEIF z = 10 THEN
   totl = 30
ELSEIF z = 11 THEN
   totl = 40
ELSEIF z = 12 THEN
   totl = 50
END IF
scorespot(pyer, z) = totl * t
s(pyer, z) = 1
LOCATE 13 + z, 27 + pyer * 4: PRINT LTRIM$(RTRIM$(STR$(scorespot(pyer, z))))
LINE (192 + pyer * 36, 301 + (z - 6) * 16)-(228 + pyer * 36, 301 + (z - 6) * 16)
END SUB

SUB scoresession (dieroll(), scorespot(), s(), pyer)
FOR z = 1 TO 13
   IF s(pyer, z) = 0 THEN EXIT FOR
NEXT z
DO
   q = z
   IF q < 7 THEN PAINT (pyer * 20 + 75, 296 + q * 15), 6, 15 ELSE PAINT (pyer * 20 + 225, 296 + (z MOD 7 + 1) * 15), 6, 15
   SELECT CASE UCASE$(INPUT$(1))
   CASE "A"
      q = z - 6
      IF q = 7 THEN q = 6
      IF q < 1 THEN q = q + 12
      IF s(pyer, q) = 1 THEN q = z
   CASE "S"
      q = z MOD 13 + 1
      DO WHILE s(pyer, q) = 1
         q = q MOD 13 + 1
      LOOP
   CASE "W"
      q = z - 1
      DO WHILE s(pyer, q) = 1
         q = q - 1
         IF q <= 0 THEN q = 13
      LOOP
   CASE "D"
      q = z - 6
      IF q = 7 THEN q = 6
      IF q < 1 THEN q = q + 12
      IF s(pyer, q) = 1 THEN q = z
   CASE " "
      IF z < 7 THEN PAINT (pyer * 20 + 75, 296 + z * 15), 0, 15 ELSE PAINT (pyer * 20 + 225, 296 + (z MOD 7 + 1) * 15), 0, 15
      EXIT DO
   CASE ELSE
      CALL scoresession(dieroll(), scorespot(), s(), pyer)
   END SELECT
   IF z < 7 THEN PAINT (pyer * 20 + 75, 296 + z * 15), 0, 15 ELSE PAINT (pyer * 20 + 225, 296 + (z MOD 7 + 1) * 15), 0, 15
   z = q
LOOP
IF z < 7 THEN
   CALL leftie(dieroll(), scorespot(), s(), pyer, z)
ELSEIF z = 7 OR z = 8 THEN
   CALL ofakind(dieroll(), scorespot(), s(), pyer, z)
ELSEIF z = 9 THEN
   CALL niner(dieroll(), scorespot(), s(), pyer, z)
ELSEIF z = 10 OR z = 11 THEN
   CALL strait(dieroll(), scorespot(), s(), pyer, z)
ELSEIF z = 12 THEN
   CALL yahtze(dieroll(), scorespot(), s(), pyer, z)
ELSEIF z = 13 THEN
   CALL rscore(dieroll(), scorespot(), s(), pyer, z, 1)
END IF
END SUB


SUB selection (pspot, xs, ys, cursor(), xit, hold(), tim, holdspot())
w$ = INPUT$(1)
PUT (xs, ys), cursor
SELECT CASE UCASE$(w$)
CASE "A"
   IF pspot = 6 THEN pspot = 7 ELSE pspot = pspot - 1
   IF pspot = 0 THEN pspot = 5
CASE "W"
   IF pspot <= 3 THEN
      pspot = 6
   ELSEIF pspot >= 4 AND pspot < 6 THEN
      pspot = 7
   ELSEIF pspot = 6 THEN
      pspot = 1
   ELSEIF pspot = 7 THEN
      pspot = 4
   END IF
CASE "S"
   IF pspot <= 3 THEN
      pspot = 6
   ELSEIF pspot >= 4 AND pspot < 6 THEN
      pspot = 7
   ELSEIF pspot = 6 THEN
      pspot = 1
   ELSEIF pspot = 7 THEN
      pspot = 4
   END IF
CASE "D"
   IF pspot = 5 THEN pspot = 0
   IF pspot = 7 THEN pspot = 6 ELSE pspot = pspot + 1
CASE " "
   PUT (xs, ys), cursor
   xit = 1
CASE ELSE
   PUT (xs, ys), cursor
   CALL selection(pspot, xs, ys, cursor(), xit, hold(), tim, holdspot())
END SELECT
SELECT CASE pspot
CASE IS = 6
   xs = 26
   ys = 140
CASE IS = 7
   xs = 146
   ys = 140
CASE IS < 6
   xs = pspot * 50 - 46
   ys = 60
END SELECT
PUT (xs, ys), cursor
IF xit = 1 THEN CALL pushbutton(pspot, xit, hold(), tim, holdspot(), cursor())
END SUB

SUB strait (dieroll(), scorespot(), s(), pyer, z)
REDIM d(5)
FOR x = 1 TO 5
   d(x) = dieroll(x)
NEXT x
DO
   q = 0
   FOR x = 1 TO 4
      IF d(x) > d(x + 1) THEN
         SWAP d(x), d(x + 1)
         q = 1
      END IF
   NEXT x
LOOP UNTIL q = 0
FOR x = 1 TO 4
   IF d(x) + 1 = d(x + 1) THEN
      q = q + 1
   ELSEIF q < 3 AND d(x) <> d(x + 1) THEN
      q = 0
   END IF
NEXT x
IF q >= z - 7 THEN t = 1 ELSE t = 0
CALL rscore(dieroll(), scorespot(), s(), pyer, z, t)
END SUB

SUB yahtze (dieroll(), scorespot(), s(), pyer, z)
t = 1
FOR x = 1 TO 4
   IF dieroll(x) <> dieroll(x + 1) THEN
      t = 0
      EXIT FOR
   END IF
NEXT x
CALL rscore(dieroll(), scorespot(), s(), pyer, z, t)
END SUB

