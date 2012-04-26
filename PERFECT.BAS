   REM Benjamin Wolf
   REM September 17, 2002
   REM Perfect.bas
   REM Find perfect numbers
   REM
   CLS
   DATA 4, 291080
   READ N, X
10 X = X + 1
   PRINT X
   S = 0
   D = 0
20 D = D + 1
   IF X / D = X \ D THEN F = X \ D ELSE GOTO 20
   IF F = X THEN GOTO 20
   S = S + F
   IF F = 1 THEN GOTO 30 ELSE GOTO 20
30 IF S = X THEN
      N = N + 1
      PRINT X; " is perfect number # "; N; "."
      GOTO 40
   ELSE
      GOTO 10
   END IF
40 PRINT
   PRINT "Press enter to find next perfect number"
   INPUT "or type 'end' to end. ", choice$
   PRINT
   IF UCASE$(choice$) = "END" THEN END ELSE GOTO 10

