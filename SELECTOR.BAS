REM Benjamin Wolf
REM May 6, 2003
REM
DIM arrow1(4 + 41 * INT(71 / 8))
DIM arrow2(4 + 32 * INT(89 / 8))
DIM arrow3(4 + 41 * INT(71 / 8))
DIM arrow4(4 + 32 * INT(89 / 8))
DIM nothing(4 + 41 * INT(71 / 8))
DIM nothing2(4 + 32 * INT(89 / 8))
SCREEN 12
DRAW "C8 BM 320,240 G10 U25 L10 D25 H10 D9 F15 E15 U9 BM305,240 P7,8"
GET (289, 224)-(321, 265), arrow1
GET (10, 10)-(42, 51), nothing
GET (10, 10)-(51, 42), nothing2
PUT (289, 224), nothing, AND
DRAW "C8 BM 320,240 TA90 G10 U25 L10 D25 H10 D9 F15 E15 U9 BM315,255 P7,8"
GET (304, 239)-(345, 271), arrow2
PUT (304, 239), nothing2, AND
DRAW "C8 BM 320,240 TA180 G10 U25 L10 D25 H10 D9 F15 E15 U9 BM335,240 P7,8"
GET (319, 215)-(351, 256), arrow3
PUT (319, 215), nothing, AND
DRAW "C8 BM 320,240 TA-90 G10 U25 L10 D25 H10 D9 F15 E15 U9 BM320,229 P7,8"
GET (295, 209)-(336, 241), arrow4
CLS
FOR x = 1 TO 8
   DRAW "BM 140," + LTRIM$(RTRIM$(STR$(13 + x * 50))) + " R350"
NEXT x
FOR y = 1 TO 8
   DRAW "BM " + LTRIM$(RTRIM$(STR$(90 + y * 50))) + ",63 D350"
NEXT y
PUT (149, 12), arrow1
x = 1
DO
   p$ = INPUT$(1)
   SELECT CASE p$
   CASE IS = "a"
      IF x < 8 THEN PUT (99 + x * 50, 12), nothing, AND
      IF x > 7 AND x < 15 THEN PUT (499, x * 50 - 328), nothing2, AND
      IF x > 14 AND x < 22 THEN PUT (99 + (22 - x) * 50, 417), nothing, AND
      IF x > 21 THEN PUT (95, 22 + (29 - x) * 50), nothing2, AND
      x = x - 1
      IF x = 0 THEN x = 28
      IF x < 8 THEN PUT (99 + x * 50, 12), arrow1
      IF x > 7 AND x < 15 THEN PUT (499, x * 50 - 328), arrow4
      IF x > 14 AND x < 22 THEN PUT (99 + (22 - x) * 50, 417), arrow3
      IF x > 21 THEN PUT (95, 22 + (29 - x) * 50), arrow2
   CASE IS = "s"
      IF x < 8 THEN PUT (99 + x * 50, 12), nothing, AND
      IF x > 7 AND x < 15 THEN PUT (499, x * 50 - 328), nothing2, AND
      IF x > 14 AND x < 22 THEN PUT (99 + (22 - x) * 50, 417), nothing, AND
      IF x > 21 THEN PUT (95, 22 + (29 - x) * 50), nothing2, AND
      x = x + 1
      IF x = 29 THEN x = 1
      IF x < 8 THEN PUT (99 + x * 50, 12), arrow1
      IF x > 7 AND x < 15 THEN PUT (499, x * 50 - 328), arrow4
      IF x > 14 AND x < 22 THEN PUT (99 + (22 - x) * 50, 417), arrow3
      IF x > 21 THEN PUT (95, 22 + (29 - x) * 50), arrow2
   CASE IS = "x"
      END
   END SELECT
LOOP

