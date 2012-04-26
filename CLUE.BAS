DECLARE SUB cardshuffler (cardorder!(), f!())
DECLARE SUB choosechar (x!, high!(), pchar!())
REM Benjamin Wolf
REM May 27, 2003
REM HAHAHAHAHA!!                                               __
' /\/\/\/\/\/\/\/\/\/\    /\/\/\/\       |||   /==  |    |  | |
'/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\  |||   |    |    |  | |-
'\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ |||   \==  |__  |__| |__
DIM high(4 + 18 * INT((2 * 121 + 7) / 8))
DIM pchar(6)
DIM cardorder(24)
DIM f(24)
CLS
SCREEN 12
LINE (0, 50)-(120, 66), 3, BF
GET (0, 49)-(121, 67), high
CLS
PRINT , , "This is not a test!"
PRINT "Miss Scarlet"
PRINT "Colonel Mustard"
PRINT "Mr. Green"
PRINT "Mrs. White"
PRINT "Miss Peacock"
PRINT "Professor Plum"
PRINT
DO
   LOCATE 9, 30: PRINT "        "
   LOCATE 9, 1: INPUT "How many players are playing"; pla
   IF pla < 2 OR pla > 6 THEN PRINT "There must be between 2 and 6 players."
LOOP UNTIL pla > 1 AND pla < 7
LOCATE 10, 1: PRINT "Choose the character you wish to use, player  ."
FOR x = 1 TO pla
   LOCATE 10, 46: PRINT LTRIM$(RTRIM$(STR$(x)))
   CALL choosechar(x, high(), pchar())
   LOCATE 1 + pchar(x), 1: PRINT SPC(15);
NEXT x
CALL cardshuffler(cardorder(), f())

SUB cardshuffler (cardorder(), f())
FOR x = 1 TO 21
10 FOR a = 1 TO TIMER
      c = RND
   NEXT a
   FOR a = 1 TO RND * 100 STEP RND
      c = RND
   NEXT a
   SELECT CASE x
   CASE 1
      f(x) = INT(RND * 6) + 1
      IF f(x) = 7 THEN GOTO 10
   CASE 2
      f(x) = INT(RND * 6) + 7
      IF f(x) = 13 THEN GOTO 10
   CASE 3
      f(x) = INT(RND * 12) + 9
      IF f(x) = 22 THEN GOTO 10
   CASE IS > 3
      f(x) = INT(RND * 21) + 1
      IF f(x) = 22 THEN GOTO 10
      FOR bqqbqb = 1 TO x - 1
         IF f(x) = cardorder(bqqbqb) THEN GOTO 10
      NEXT bqqbqb
   END SELECT
   cardorder(x) = f(x)
   PRINT cardorder(x)
NEXT x
END SUB

SUB choosechar (x, high(), pchar())
f = 1
FOR y = 1 TO x - 1
   IF pchar(y) = f THEN f = f + 1
NEXT y
PUT (0, f * 15), high
DO
   w$ = INPUT$(1)
   PUT (0, f * 15), high
   SELECT CASE UCASE$(w$)
   CASE "W"
      f = f - 1
      IF f < 1 THEN f = 6
      FOR y = 1 TO x - 1
         IF pchar(y) = f THEN
            f = f - 1
            y = 0
         END IF
         IF f < 1 THEN
            f = 6
            y = 0
         END IF
      NEXT y
   CASE "S"
      f = f MOD 6 + 1
      FOR y = 1 TO x - 1
         IF pchar(y) = f THEN
            f = f + 1
            y = 0
         END IF
         IF f > 6 THEN
            f = 1
            y = 0
         END IF
      NEXT y
   CASE " "
      pchar(x) = f
      EXIT DO
   END SELECT
   IF f > 6 THEN f = 1
   IF f < 1 THEN f = 6
   PUT (0, f * 15), high
LOOP
END SUB

