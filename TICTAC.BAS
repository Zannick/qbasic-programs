REM Benjamin Wolf, Rudy Mukherjee
REM January 2, 2003
REM TicTacToe
REM
CLS
PRINT , "Welcome to TicTacToe"
PRINT
FOR x = 1 TO 2
   PRINT "Player"; x; "enter your name";
   INPUT ": ", pnam$(x)
   DO
      go = 0
      INPUT "What will be your character"; pchar$(x)
      pchar$(x) = LEFT$(LTRIM$(pchar$(x)), 1)
      IF pchar$(x) = "" THEN
         PRINT "Reenter character, please."
      ELSE
         IF pchar$(1) = pchar$(2) THEN PRINT "Reenter character, please." ELSE go = 1
      END IF
   LOOP UNTIL go = 1
NEXT x
CLS
PRINT "Welcome, "; pnam$(1); " and "; pnam$(2); "!"
INPUT "Who will go first, 1 or 2"; first
CLS
PRINT "TicTacToe"
PRINT
PRINT "   |   |   "
PRINT "  1|  2|  3"
PRINT "---+---+---"
PRINT "   |   |   "
PRINT "  4|  5|  6"
PRINT "---+---+---"
PRINT "   |   |   "
PRINT "  7|  8|  9"
PRINT
FOR turn = 1 TO 9
LOCATE 12, 1:
PRINT pnam$(first); "'s turn", , , , , , , , , , ""
DO
LOCATE 13, 1:
PRINT "", , , , , , , , , , , , ""
LOCATE 13, 1:
IF mino = 1 THEN PRINT "Re-enter box, please."
INPUT "Which box do you wish to choose"; box
mino = 0
IF box < 1 OR box > 9 THEN
   PRINT "Invalid box.", , , ""
ELSE
   IF square(box) = 0 THEN EXIT DO ELSE mino = 1
END IF
LOOP
IF box < 4 THEN
   x = 3
   y = -2
   FOR z = 1 TO box
      y = y + 4
   NEXT z
ELSE
   IF box < 7 THEN
      x = 6
      y = -2
      FOR z = 1 TO box - 3
         y = y + 4
      NEXT z
   ELSE
      x = 9
      y = -2
      FOR z = 1 TO box - 6
         y = y + 4
      NEXT z
   END IF
END IF
LOCATE x, y: PRINT pchar$(first)
square(box) = first
LOCATE 14, 1:
a = 1
IF square(a) = first AND square(a + 1) = first AND square(a + 2) = first THEN
   PRINT pnam$(first); " wins!"
   END
END IF
IF square(1) = first AND square(5) = first AND square(9) = first THEN
   PRINT pnam$(first); " wins!"
   END
END IF
IF square(3) = first AND square(5) = first AND square(7) = first THEN
   PRINT pnam$(first); " wins!"
   END
END IF
FOR a = 1 TO 3
   IF square(a) = first AND square(a + 3) = first AND square(a + 6) = first THEN
      PRINT pnam$(first); " wins!"
      END
   END IF
NEXT a
a = 4
IF square(a) = first AND square(a + 1) = first AND square(a + 2) = first THEN
   PRINT pnam$(first); " wins!"
   END
END IF
a = 7
IF square(a) = first AND square(a + 1) = first AND square(a + 2) = first THEN
   PRINT pnam$(first); " wins!"
   END
END IF
IF first = 1 THEN first = 2 ELSE first = 1
NEXT turn
PRINT "Tied game.", , ,
PRINT
PRINT "You both LOST!", , ,
END

