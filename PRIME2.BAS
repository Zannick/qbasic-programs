   REM Benjamin Wolf
   REM September 10, 2002
   REM Prime2.bas
   REM List primes
   CLS
10 INPUT "Please define 'n' to list all primes up to the 'n'th prime, or enter '0' to end the program. ", N
   IF N = 0 THEN END
   IF INT(N) > N OR INT(N) < N OR N < 0 THEN
      PRINT "Please enter a positive integer for 'n', or '0' to end."
      GOTO 10
   END IF
   X = 1
   A = 0
20 D = 3
   X = X + 1
   C = X / 2
   IF INT(C) = C THEN GOTO 30 ELSE GOTO 40
30 IF C = 1 THEN GOTO 60 ELSE GOTO 20
40 C = X / D
   IF INT(C) = C THEN GOTO 30 ELSE GOTO 50
50 IF C < D THEN
      GOTO 60
   ELSE
      D = D + 2
      GOTO 40
   END IF
60 A = A + 1
   PRINT X
   IF A = N THEN GOTO 70 ELSE GOTO 20
70 PRINT
   PRINT "Do you wish to continue listing primes (0), restart the list of primes (1),"
   PRINT "end this program (2), or identify the number of the previous prime (3)?"
   INPUT "Please enter the corresponding number of your choice. ", Y
   IF Y = 0 THEN GOTO 80
   IF Y = 1 THEN
      PRINT
      GOTO 10
   END IF
   IF Y = 2 THEN END
   IF Y = 3 THEN
      PRINT
      B = A
      E = B
      GOTO 90
   END IF
   PRINT "Please enter the number that corresponds to your choice,"
   PRINT " and not any other number."
   GOTO 70
80 PRINT
   PRINT "Please define 'n' to list 'n' more primes, or enter '0' to end this program."
   INPUT Z
   IF Z = 0 THEN END
   IF INT(Z) > Z OR INT(Z) < Z OR Z < 0 THEN
      PRINT "Please enter a positive integer for 'n' or enter '0' to end."
      GOTO 80
   END IF
   N = N + Z
   GOTO 30
90 IF B > 100 THEN
      B = B - 100
      E = B
      GOTO 90
   END IF
   IF B < 10 THEN GOTO 100
   IF E < 20 THEN GOTO 110
   B = B - 10
   GOTO 90
100   IF B = 1 THEN
         PRINT "The previous prime, "; X; ", is the "; A; "st prime number."
         GOTO 70
      END IF
      IF B = 2 THEN
         PRINT "The previous prime, "; X; ", is the "; A; "nd prime number."
         GOTO 70
      END IF
      IF B = 3 THEN
         PRINT "The previous prime, "; X; ", is the "; A; "rd prime number."
         GOTO 70
      END IF
110   PRINT "The previous prime, "; X; ", is the "; A; "th prime number."
      GOTO 70
   END

