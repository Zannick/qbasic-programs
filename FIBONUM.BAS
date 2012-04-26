DECLARE FUNCTION fact! (num!)
REM Benjamin Wolf
REM March 26, 2003
CLS
INPUT "Which Fibonacci number"; num
PRINT fact(num)

FUNCTION fact (num)
IF num = 1 OR num = 2 THEN fact = 1 ELSE fact = fact(num - 1) + fact(num - 2)
END FUNCTION

