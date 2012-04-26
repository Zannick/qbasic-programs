   REM Benjamin Wolf
   REM September 17, 2002
   REM Perfect2.bas
   REM Find perfect numbers
   REM
   CLS
   Y = 0
   N = 0
   X = 0
10 Y = Y + 1
   X = 2 ^ Y * (2 ^ (Y + 1) - 1)
   S = 0
   D = 0
20 D = D + 1
   IF X / D = X \ D THEN F = X \ D ELSE GOTO 20
   IF F = X THEN GOTO 20
   S = S + F
   IF F = 1 THEN GOTO 30 ELSE GOTO 20
30 IF S = X THEN
      N = N + 1
      PRINT LTRIM$(RTRIM$(STR$(X))); " is perfect number # "; N; "."
   END IF
   GOTO 10

