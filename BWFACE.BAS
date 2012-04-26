REM Benjamin Wolf
REM April 9, 2003
REM Make a Face
REM
CLS
SCREEN 12
'''REM Ears
FOR x = 1 TO 188
   CIRCLE (226 + x, 240), 25
NEXT x
'''REM Hair
LINE (245, 240)-(395, 65), 9, BF
'''REM Head
CIRCLE (320, 240), 100, 3
PAINT (320, 240), 0, 3
CIRCLE (320, 240), 100
'''REM Nose
CIRCLE (320, 240), 35, 4, 3.14, 0, 9
'''REM Left-Mid Eye
CIRCLE (300, 200), 10, 14
' Pupil
CIRCLE (300, 200), 5, 14
PAINT (291, 200), 14, 14
'''REM Left-Left Eye
CIRCLE (285, 220), 10, 14
' Pupil
CIRCLE (285, 220), 5, 14
PAINT (276, 220), 14, 14
'''REM Right-Mid Eye
CIRCLE (340, 200), 10, 14
' Pupil
CIRCLE (340, 200), 5, 14
PAINT (331, 200), 14, 14
'''REM Right-Right Eye
CIRCLE (355, 220), 10, 14
' Pupil
CIRCLE (355, 220), 5, 14
PAINT (346, 220), 14, 14
' Mouth
LINE (270, 300)-(370, 300)
'''REM AnimaTing
' pct = color of eyes
SLEEP 2
pct = 14
DO
   pct = pct + 1
   pct = pct MOD 16
   IF pct = 0 THEN pct = pct + 1
   PAINT (276, 220), pct, 0
   SLEEP 1
   PAINT (331, 200), pct, 0
   SLEEP 1
   PAINT (291, 200), pct, 0
   SLEEP 1
   PAINT (346, 220), pct, 0
   SLEEP 1
LOOP

