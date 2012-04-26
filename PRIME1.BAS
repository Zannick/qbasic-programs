   REM Benjamin Wolf
   REM September 10, 2002
   REM Prime1.bas
   REM Find the 'n'th prime
   CLS
10 INPUT "Please define 'n' to find the 'n'th prime. ", N
   IF INT(N) = N AND N > 0 THEN
      GOTO 20
   ELSE
      PRINT "Please enter a positive integer for 'n'."
      GOTO 10
   END IF
20 X = 1
   A = 0
30 D = 3
   X = X + 1
   C = X / 2
   IF INT(C) = C THEN GOTO 40 ELSE GOTO 50
40 IF C = 1 THEN GOTO 70 ELSE GOTO 30
50 C = X / D
   IF INT(C) = C THEN GOTO 40 ELSE GOTO 60
60 IF C < D THEN
      GOTO 70
   ELSE
      D = D + 2
      GOTO 50
   END IF
70 A = A + 1
   IF A = N THEN GOTO 80 ELSE GOTO 30
80 PRINT X
   END

