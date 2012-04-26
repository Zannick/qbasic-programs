DECLARE SUB findcheck (num!, checkdgt!)
DECLARE SUB nextnum (num!, checkdgt!)
REM Benjamin Wolf
REM Cherokee High School
REM Division
REM November 25, 2002
CLS
FOR five = 1 TO 5
   INPUT "PIN ==> ", idnum
   num = idnum
   checkdgt = 0
   CALL findcheck(num, checkdgt)
   CALL nextnum(num, checkdgt)
   PRINT num
NEXT five


SUB findcheck (num, checkdgt)
remain = num
DIM digit(7), product(7)
DO
   totalpro = 0
   FOR x = 7 TO 1 STEP -1
      digit(x) = remain \ 10 ^ (x - 1)
      FOR y = 1 TO 8 - x
         IF x + y >= 8 THEN EXIT FOR
         digit(x) = digit(x) - digit(x + y) * 10 ^ y
      NEXT y
      product(x) = digit(x) * (x + 1)
      totalpro = totalpro + product(x)
   NEXT x
   remain = totalpro MOD 123
   IF remain = 17 OR remain < 10 THEN EXIT DO ELSE remain = totalpro
LOOP
checkdgt = remain
END SUB

SUB nextnum (num, checkdgt)
check = checkdgt
checkdgt = 0
DO
   num = num + 1
   CALL findcheck(num, checkdgt)
LOOP UNTIL checkdgt = check
END SUB

