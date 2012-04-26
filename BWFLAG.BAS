REM Benjamin Wolf
REM May 14, 2003
REM Flag
CLS
DIM star(4 + 31 * INT((32 * 2 + 7) / 8))
SCREEN 12
DRAW "BM 320,240"
FOR x = 1 TO 5
   DRAW "TA" + LTRIM$(RTRIM$(STR$((144 * x + 90) MOD 360))) + " U24"
NEXT x
PAINT (10, 10), 1, 15
PAINT (320, 240), 15, 1
GET (319, 230)-(345, 256), star
CLS
FOR x = 1 TO 13
   IF x MOD 2 = 1 THEN colr = 4 ELSE colr = 15
   LINE (1, x * 35 - 34)-(640, x * 35), colr, BF
NEXT x
LINE (1, 1)-(44 * 6, 7 * 35), 1, BF
FOR x = 1 TO 9 STEP 2
   FOR y = 1 TO 6 * 46 - 45 STEP 46
      PUT (y, x * 27 - 26), star, PSET
   NEXT y
NEXT x
FOR x = 2 TO 8 STEP 2
   FOR y = 1 TO 5
      PUT (y * 46 - 16, x * 27 - 26), star, PSET
   NEXT y
NEXT x
PLAY "O3 T130 L8 g. e16 L4 ceg>c2 e8.d16 c<ef+ g2"
PLAY "O3 g8g8>e.d8c<b2a8b8 >cc<gec g8.e16ceg>c2"
PLAY "O4 e8.d16c<ef+g2 g8g8> e.d8c<b2 a8b8>cc<gec"
PLAY "O4 e8e8efgg2 f8e8deff2fe.d8c<b2 a8b8>c<ef+g2"
PLAY "O3 e>ccc8<b8 aaa>d L8 T125 fedc T120 L4 c<b"
PLAY "O3 T130 L8 gg>c4.defg2 cde4.fd4 c2."

