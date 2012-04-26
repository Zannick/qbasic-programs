REM Benjamin Wolf
REM March 17, 2003
CLS
OPEN "A:rndnum.txt" FOR OUTPUT AS #3
PRINT "This is a random number generator."
INPUT "What is the minimum number"; min
INPUT "What is the maximum number"; max
INPUT "How many numbers do you want"; num
FOR x = 1 TO num
   a = INT(RND * (max - min + 1)) + min
   PRINT #3, a; ",";
NEXT x
CLOSE
PRINT "Open A:rndnum.txt to see your random numbers."
END

