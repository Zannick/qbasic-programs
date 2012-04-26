DECLARE SUB freeatlast (nam$)
DECLARE SUB death ()
REM Benjamin Wolf
REM January 13, 2002
REM Hangman
REM
CLS
DATA Monty Python and the Holy Grail, Movie, The Legend of Zelda Ocarina of Time, Video Game
DATA Calculus, Academic Subject, The Simpsons, TV Show, Wheel of Fortune, TV Show
DATA Ian McKellan, Actor, Pierce Brosnan, Actor, Frank Herbert, Author
DATA Alexander Graham Bell, Inventor, The Sixth Sense, Movie, Stephen King, Author
DATA Alpha Centauri, Star, Garfield, Comic Character, Paul Atreides, Fictional Character
DATA Super Mario World, Video Game, Football, Sport, Sodium Chloride, Chemical Compound
DATA Rubiks Cube, Puzzle, Weird Al Yankovic, Singer, M C Escher, Artist
PRINT , "Hangman"
PRINT "Welcome to Hangman!"
PRINT "To proceed, you must answer me this questions three:"
PRINT "What! ";
SLEEP 1
INPUT "is your name"; nam$
DO
   PRINT "What! ";
   SLEEP 1
   INPUT "is your quest (1-20 only)"; quest$
   IF VAL(quest$) = 0 AND ASC(quest$) <> 48 THEN
      PRINT "Only numbers will define your quest."
   ELSE
      quest = VAL(quest$)
      IF quest < 1 OR quest > 20 THEN PRINT "That is not a valid quest." ELSE go = 1
   END IF
LOOP UNTIL go = 1
PRINT "What! is the airspeed velocity of an unladen swallow?"
FOR x = 1 TO quest
   READ ans$, categ$
NEXT x
SLEEP 1
CLS
PRINT "Player: "; nam$, "Category: "; categ$
PRINT
PRINT , "   _____", "Available letters:"
PRINT , "   |   |"
PRINT , "       |", "  A B C D E F G"
PRINT , "       |", "   H I J K L M"
PRINT , "       |", "  N O P Q R S T"
PRINT , "       |", "   U V W X Y Z"
PRINT , "       |"
PRINT , " ______|____"
PRINT
PRINT
FOR x = 1 TO LEN(ans$)
   IF MID$(ans$, x, 1) = " " THEN
      PRINT "  ";
      lot = lot + 1
   ELSE
      PRINT "_ ";
   END IF
NEXT x
PRINT
DIM pykll(122)
DO
   DO
      LOCATE 18, 1: PRINT , , , , , ,
      LOCATE 19, 1: PRINT , , , , , ,
      LOCATE 17, 1:
      PRINT "Guess a letter. ", , , ""
      let$ = INPUT$(1)
      let$ = UCASE$(let$)
      IF ASC(let$) < 65 OR (ASC(let$) > 90 AND ASC(let$) < 97) OR ASC(let$) > 122 THEN
         PRINT "Not a letter. Guess again."
         SLEEP 1
         go = 0
      ELSE
         IF pykll(ASC(let$)) <> 0 THEN
            PRINT "Letter already guessed."
            SLEEP 1
            go = 0
         ELSE
            go = 1
         END IF
      END IF
   LOOP UNTIL go = 1
   IF (ASC(let$) >= 65 AND ASC(let$) <= 71) OR (ASC(let$) >= 97 AND ASC(let$) <= 103) THEN
      x = 5
      y = 31
      FOR q = 1 TO ASC(let$) - 65
         y = y + 2
      NEXT q
   END IF
   IF (ASC(let$) >= 72 AND ASC(let$) <= 77) OR (ASC(let$) >= 104 AND ASC(let$) <= 109) THEN
      x = 6
      y = 32
      FOR q = 1 TO ASC(let$) - 72
         y = y + 2
      NEXT q
   END IF
   IF (ASC(let$) >= 78 AND ASC(let$) <= 84) OR (ASC(let$) >= 110 AND ASC(let$) <= 116) THEN
      x = 7
      y = 31
      FOR q = 1 TO ASC(let$) - 78
         y = y + 2
      NEXT q
   END IF
   IF (ASC(let$) >= 85 AND ASC(let$) <= 90) OR (ASC(let$) >= 117 AND ASC(let$) <= 122) THEN
      x = 8
      y = 32
      FOR q = 1 TO ASC(let$) - 85
         y = y + 2
      NEXT q
   END IF
   LOCATE x, y: PRINT " "
   pykll(ASC(let$)) = 1
   place = 0
   FOR x = 1 TO LEN(ans$)
      z = x
      y = 13
      DO UNTIL z < 80
         z = z - 40
         y = y + 1
      LOOP
      IF UCASE$(MID$(ans$, z, 1)) = UCASE$(let$) THEN
         LOCATE y, 2 * z - 1: PRINT UCASE$(let$)
         kopklk = kopklk + 1
         place = 1
      END IF
   NEXT x
   IF place = 0 THEN
      errors = errors + 1
      IF errors = 1 THEN LOCATE 5, 18: PRINT "O"
      IF errors = 2 THEN
         LOCATE 6, 18: PRINT "|"
         LOCATE 7, 18: PRINT "|"
      END IF
      IF errors = 3 THEN LOCATE 6, 16: PRINT "{-"
      IF errors = 4 THEN LOCATE 6, 19: PRINT "-}"
      IF errors = 5 THEN LOCATE 8, 17: PRINT "/"
      IF errors = 6 THEN
         LOCATE 8, 19: PRINT "\"
         CALL death
      END IF
   END IF
LOOP UNTIL kopklk = LEN(ans$) - lot
CALL freeatlast(nam$)

SUB death
FOR loserman = 1 TO 7
   LOCATE 7, 1:
   IF loserman / 2 <> loserman \ 2 THEN
      PRINT , , "   _____"
      PRINT , , "   |   |"
      PRINT , , "   O   |"
      PRINT , , " {-|-} |"
      PRINT , , "   |   |"
      PRINT , , "  / \  |"
      PRINT , , "       |"
      PRINT , , " ______|____"
      PRINT , "       ----------------------"
   ELSE
      PRINT , , "   _____"
      PRINT , , "   |   |"
      PRINT , , "   |   |"
      PRINT , , "   O   |"
      PRINT , , " {-|-} |"
      PRINT , , "   |   |"
      PRINT , , "  / \  |"
      PRINT , , " ______|____"
      PRINT , "       ----------------------"
   END IF
   SLEEP 1
NEXT loserman
LOCATE 7, 1:
PRINT , , "   _____"
PRINT , , "   |   |"
PRINT , , "   O   |"
PRINT , , "       |"
PRINT , , " {-|-} |"
PRINT , , "   |   |"
PRINT , , "  / \  |"
PRINT , , " ______|____"
SLEEP 1
LOCATE 7, 1:
PRINT , , "   _____"
PRINT , , "   |   |"
PRINT , , "       |"
PRINT , , "   O   |"
PRINT , , "       |"
PRINT , , " {-|-} |"
PRINT , , "   |   |"
PRINT , , " ______|____"
SLEEP 1
LOCATE 7, 1:
PRINT , , "   _____"
PRINT , , "   |   |"
PRINT , , "       |"
PRINT , , "       |"
PRINT , , "   O   |"
PRINT , , "       |"
PRINT , , " {-|-} |"
PRINT , , " ______|____"
SLEEP 1
LOCATE 7, 1:
PRINT , , "   _____"
PRINT , , "   |   |"
PRINT , , "       |"
PRINT , , "       |"
PRINT , , "       |"
PRINT , , "   O   |"
PRINT , , "       |"
PRINT , , " ______|____"
SLEEP 1
LOCATE 7, 1:
PRINT , , "   _____"
PRINT , , "   |   |"
PRINT , , "       |"
PRINT , , "       |"
PRINT , , "       |"
PRINT , , "       |"
PRINT , , "   O   |"
PRINT , , " ______|____"
SLEEP 1
LOCATE 13, 1:
PRINT , , "       |"
PRINT , , " __o___|____"
SLEEP 1
LOCATE 14, 1:
PRINT , , " _o____|____"
SLEEP 1
LOCATE 14, 1:
PRINT , , " o_____|____"
SLEEP 1
LOCATE 14, 1:
PRINT , , "o______|____"
SLEEP 1
LOCATE 14, 28:
PRINT "o ______|____"
SLEEP 1
LOCATE 14, 27:
PRINT "o  ______|____"
SLEEP 1
PRINT
PRINT
PRINT , , "You lost."
END
END SUB

SUB freeatlast (nam$)
SLEEP 1
CLS
LOCATE 22, 29: PRINT "             /\"
LOCATE 23, 29: PRINT "      /\    /  \    /\"
LOCATE 24, 7: PRINT "Very sharp rocks -->  \/\/\/  \/\/    \/\/  \/\/\"
LOCATE 9, 19: PRINT "Congratulations, "; nam$; ", you've won!"
LOCATE 7, 55: PRINT "   _____"
LOCATE 8, 55: PRINT "   |   |"
LOCATE 9, 55: PRINT "       |"
LOCATE 10, 55: PRINT "       |"
LOCATE 11, 55: PRINT "       |"
LOCATE 12, 55: PRINT "       |"
LOCATE 13, 55: PRINT "       |"
LOCATE 14, 55: PRINT " ______|____"
LOCATE 15, 43: PRINT "------------------------"
FOR y = 52 TO 37 STEP -1
   LOCATE 14, y: PRINT " / \ "
   LOCATE 13, y: PRINT "  | "
   LOCATE 12, y: PRINT "{-|-} "
   LOCATE 11, y: PRINT "  O "
SLEEP 1
NEXT y
FOR x = 12 TO 19
   LOCATE x + 3, 37: PRINT " / \"
   LOCATE x + 2, 37: PRINT "  | "
   LOCATE x + 1, 37: PRINT "{-|-}"
   LOCATE x, 37: PRINT "  O  "
   LOCATE x - 1, 39: PRINT " "
   SLEEP 1
NEXT x
LOCATE x + 2, 37: PRINT "  | "
LOCATE x + 1, 37: PRINT "{-|-}"
LOCATE x, 37: PRINT "  O  "
LOCATE x - 1, 39: PRINT " "
SLEEP 1
x = x + 1
LOCATE x + 1, 37: PRINT "{-|-"
LOCATE x, 37: PRINT "  O  "
LOCATE x - 1, 39: PRINT " "
SLEEP 1
x = x + 1
LOCATE x, 37: PRINT "  O "
LOCATE x - 1, 37: PRINT "     "
SLEEP 1
LOCATE x, 39: PRINT " "
END
END SUB

