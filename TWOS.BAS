REM +5 points
REM Benjamin Wolf and Konrad Wildman
REM October 15, 2002
REM
CLS
FOR x = 1 TO 5
   INPUT "First three numbers"; a, b, c
   numof2 = 0
   d = b - a
   n = a
   FOR times = 1 TO 2000
      n$ = LTRIM$(RTRIM$(STR$(n)))
      FOR nums = 1 TO LEN(n$)
         IF MID$(n$, nums, 1) = "2" THEN numof2 = numof2 + 1
      NEXT nums
      n = n + d
   NEXT times
   PRINT numof2
NEXT x
END

