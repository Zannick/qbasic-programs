REM Benjamin Wolf
REM March 3, 2003
REM Intermediate Division
REM Cherokee High School
REM
CLS
a = 1
INPUT "String"; mek$
mek$ = RTRIM$(mek$)
FOR x = 1 TO LEN(mek$)
   IF MID$(mek$, x, 1) = " " THEN
      IF MID$(mek$, x - 1, 1) <> " " THEN a = a + 1
   END IF
NEXT x
PRINT a
DIM wrd$(a)
b = 1
FOR x = 1 TO LEN(mek$)
   IF MID$(mek$, x, 1) <> " " THEN
      wrd$(b) = wrd$(b) + MID$(mek$, x, 1)
   ELSE
      IF MID$(mek$, x - 1, 1) <> " " THEN b = b + 1
   END IF
NEXT x
FOR x = 1 TO a
   FOR y = LEN(wrd$(x)) TO 1 STEP -1
      PRINT MID$(wrd$(x), y, 1);
   NEXT y
   PRINT " ";
NEXT x
PRINT
DIM z(a)
ttal = 0
DO
   zap$ = ""
   FOR x = 1 TO a
      IF zap$ = "" AND z(x) <> 1 THEN
         zap$ = wrd$(x)
         poklok = x
         GOTO 10
      ELSE
         IF zap$ = "" AND z(x) = 1 THEN GOTO 10
      END IF
      IF ASC(LEFT$(wrd$(x), 1)) < ASC(LEFT$(zap$, 1)) AND z(x) <> 1 THEN
         zap$ = wrd$(x)
         poklok = x
      ELSE
         IF ASC(LEFT$(wrd$(x), 1)) = ASC(LEFT$(zap$, 1)) THEN
            c = 1
            DO
               IF z(x) = 1 THEN EXIT DO
               c = c + 1
               IF c > LEN(wrd$(x)) AND c <= LEN(zap$) THEN
                  zap$ = wrd$(x)
                  poklok = x
                  EXIT DO
               END IF
               IF c > LEN(zap$) OR c > LEN(wrd$(x)) THEN EXIT DO
               IF ASC(MID$(wrd$(x), c, 1)) < ASC(MID$(zap$, c, 1)) THEN
                  zap$ = wrd$(x)
                  poklok = x
                  EXIT DO
               ELSE
                  IF ASC(MID$(wrd$(x), c, 1)) > ASC(MID$(zap$, c, 1)) THEN EXIT DO
               END IF
            LOOP
         END IF
      END IF
10 NEXT x
   z(poklok) = 1
   ttal = ttal + 1
   IF prepok$ <> wrd$(poklok) THEN
      PRINT wrd$(poklok); " ";
      prepok$ = wrd$(poklok)
   END IF
LOOP UNTIL ttal = a
PRINT
FOR x = 65 TO 90
   FOR y = 1 TO LEN(mek$)
      IF ASC(MID$(mek$, y, 1)) = x THEN
         PRINT CHR$(x);
         EXIT FOR
      END IF
   NEXT y
NEXT x
PRINT
FOR x = a TO 1 STEP -1
   PRINT wrd$(x); " ";
NEXT x
END

