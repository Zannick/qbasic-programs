DECLARE SUB printface (m!(), s!())
REM Benjamin Wolf
REM February 4, 2003
REM Cherokee High School
REM Division 1
CLS
DIM m(24), s(24)
FOR times = 1 TO 5
   FOR cleer = 1 TO 24
      m(cleer) = 0
      s(cleer) = 0
   NEXT cleer
   hmark = 15
   PRINT "Enter one number at a time."
   INPUT "How many spaces do you occupy"; spots
   FOR x = 1 TO spots
      INPUT "Number of markers"; n
      hmark = hmark - n
      INPUT "Spot # of these markers"; p
      m(p) = n
      s(p) = 1
   NEXT x
   INPUT "How many spaces does opponent occupy"; opspots
   FOR x = 1 TO opspots
      INPUT "Number of markers"; n
      INPUT "Spot # of these markers"; p
      m(p) = n
      s(p) = 2
   NEXT x
   INPUT "Roll 1 = ", a
   INPUT "Roll 2 = ", b
   INPUT "Roll 3 = ", c
   IF hmark >= 3 THEN
      IF a = b OR a = c OR b = c THEN
         IF a = b AND b = c THEN
            IF NOT (m(a) >= 3 OR (s(a) = 2 AND m(a) >= 2)) THEN
               IF s(a) = 2 THEN m(a) = 0
               s(a) = 1
               m(a) = m(a) + 3
               CALL printface(m(), s())
               GOTO 100
            END IF
         ELSE
            IF a = b AND NOT (m(a) >= 4 OR (s(a) = 2 AND m(a) >= 2) OR m(c) = 5 OR (s(c) = 2 AND m(c) >= 2)) THEN
               IF s(a) = 2 THEN m(a) = 0
               s(a) = 1
               m(a) = m(a) + 2
               IF s(c) = 2 THEN m(c) = 0
               s(c) = 1
               m(c) = m(c) + 1
               CALL printface(m(), s())
               GOTO 100
            END IF
            IF a = c AND NOT (m(a) >= 4 OR (s(a) = 2 AND m(a) >= 2) OR m(b) = 5 OR (s(b) = 2 AND m(b) >= 2)) THEN
               IF s(a) = 2 THEN m(a) = 0
               s(a) = 1
               m(a) = m(a) + 2
               IF s(b) = 2 THEN m(b) = 0
               s(b) = 1
               m(b) = m(b) + 1
               CALL printface(m(), s())
               GOTO 100
            END IF
            IF b = c AND NOT (m(b) >= 4 OR (s(b) = 2 AND m(b) >= 2) OR m(a) = 5 OR (s(a) = 2 AND m(a) >= 2)) THEN
               IF s(b) = 2 THEN m(b) = 0
               s(b) = 1
               m(b) = m(b) + 2
               IF s(a) = 2 THEN m(a) = 0
               s(a) = 1
               m(a) = m(a) + 1
               CALL printface(m(), s())
               GOTO 100
            END IF
         END IF
      ELSE
         IF NOT (m(a) = 5 OR m(b) = 5 OR m(c) = 5 OR (s(a) = 2 AND m(a) >= 2) OR (s(b) = 2 AND m(b) >= 2) OR (s(c) = 2 AND m(c) >= 2)) THEN
            IF s(a) = 2 THEN m(a) = 0
            s(a) = 1
            m(a) = m(a) + 1
            IF s(b) = 2 THEN m(b) = 0
            s(b) = 1
            m(b) = m(b) + 1
            IF s(c) = 2 THEN m(c) = 0
            s(c) = 1
            m(c) = m(c) + 1
            CALL printface(m(), s())
            GOTO 100
         END IF
      END IF
   END IF
   IF hmark >= 2 THEN
      IF a < b AND a < c THEN
         IF NOT (m(b + c) >= 4 OR (s(b + c) = 2 AND m(b + c) >= 2) OR m(a) = 5 OR (s(a) = 2 AND m(a) >= 2)) THEN
            IF s(b + c) = 2 THEN m(b + c) = 0
            s(b + c) = 1
            m(b + c) = m(b + c) + 1
            IF s(a) = 2 THEN m(a) = 0
            s(a) = 1
            m(a) = m(a) + 1
            CALL printface(m(), s())
            GOTO 100
         ELSE
            IF c >= b THEN
               IF NOT (m(a + c) >= 4 OR (s(a + c) = 2 AND m(a + c) >= 2) OR m(b) = 5 OR (s(b) = 2 AND m(b) >= 2)) THEN
                  IF s(a + c) = 2 THEN m(a + c) = 0
                  s(a + c) = 1
                  m(a + c) = m(a + c) + 1
                  IF s(b) = 2 THEN m(b) = 0
                  s(b) = 1
                  m(b) = m(b) + 1
                  CALL printface(m(), s())
                  GOTO 100
               END IF
            END IF
            IF NOT (m(a + b) >= 4 OR (s(a + b) = 2 AND m(a + b) >= 2) OR m(c) = 5 OR (s(c) = 2 AND m(c) >= 2)) THEN
               IF s(a + b) = 2 THEN m(a + b) = 0
               s(a + b) = 1
               m(a + b) = m(a + b) + 1
               IF s(c) = 2 THEN m(c) = 0
               s(c) = 1
               m(c) = m(c) + 1
               CALL printface(m(), s())
               GOTO 100
            END IF
         END IF
      END IF
      IF b < a AND b < c THEN
         IF NOT (m(a + c) >= 4 OR (s(a + c) = 2 AND m(a + c) >= 2) OR m(b) = 5 OR (s(b) = 2 AND m(b) >= 2)) THEN
            IF s(a + c) = 2 THEN m(a + c) = 0
            s(a + c) = 1
            m(a + c) = m(a + c) + 1
            IF s(b) = 2 THEN m(b) = 0
            s(b) = 1
            m(b) = m(b) + 1
            CALL printface(m(), s())
            GOTO 100
         ELSE
            IF c >= a THEN
               IF NOT (m(b + c) >= 4 OR (s(b + c) = 2 AND m(b + c) >= 2) OR m(a) = 5 OR (s(a) = 2 AND m(a) >= 2)) THEN
                  IF s(b + c) = 2 THEN m(b + c) = 0
                  s(b + c) = 1
                  m(b + c) = m(b + c) + 1
                  IF s(a) = 2 THEN m(a) = 0
                  s(a) = 1
                  m(a) = m(a) + 1
                  CALL printface(m(), s())
                  GOTO 100
               END IF
            END IF
            IF NOT (m(a + b) >= 4 OR (s(a + b) = 2 AND m(a + b) >= 2) OR m(c) = 5 OR (s(c) = 2 AND m(c) >= 2)) THEN
               IF s(a + b) = 2 THEN m(a + b) = 0
               s(a + b) = 1
               m(a + b) = m(a + b) + 1
               IF s(c) = 2 THEN m(c) = 0
               s(c) = 1
               m(c) = m(c) + 1
               CALL printface(m(), s())
               GOTO 100
            END IF
         END IF
      END IF
      IF c < a AND c < b THEN
         IF NOT (m(a + b) >= 4 OR (s(a + b) = 2 AND m(a + b) >= 2) OR m(c) = 5 OR (s(c) = 2 AND m(c) >= 2)) THEN
            IF s(a + b) = 2 THEN m(a + b) = 0
            s(a + b) = 1
            m(a + b) = m(a + b) + 1
            IF s(c) = 2 THEN m(c) = 0
            s(c) = 1
            m(c) = m(c) + 1
            CALL printface(m(), s())
            GOTO 100
         ELSE
            IF a >= b THEN
               IF NOT (m(a + c) >= 4 OR (s(a + c) = 2 AND m(a + c) >= 2) OR m(b) = 5 OR (s(b) = 2 AND m(b) >= 2)) THEN
                  IF s(a + c) = 2 THEN m(a + c) = 0
                  s(a + c) = 1
                  m(a + c) = m(a + c) + 1
                  IF s(b) = 2 THEN m(b) = 0
                  s(b) = 1
                  m(b) = m(b) + 1
                  CALL printface(m(), s())
                  GOTO 100
               END IF
            END IF
            IF NOT (m(b + c) >= 4 OR (s(b + c) = 2 AND m(b + c) >= 2) OR m(a) = 5 OR (s(a) = 2 AND m(a) >= 2)) THEN
               IF s(b + c) = 2 THEN m(b + c) = 0
               s(b + c) = 1
               m(b + c) = m(b + c) + 1
               IF s(a) = 2 THEN m(a) = 0
               s(a) = 1
               m(a) = m(a) + 1
               CALL printface(m(), s())
               GOTO 100
            END IF
         END IF
      END IF
   END IF
   IF hmark >= 1 THEN
      IF NOT (m(a + b + c) = 5 OR (s(a + b + c) = 2 AND m(a + b + c) >= 2)) THEN
         IF s(a + b + c) = 2 THEN m(a + b + c) = 0
         s(a + b + c) = 1
         m(a + b + c) = m(a + b + c) + 1
         CALL printface(m(), s())
         GOTO 100
      END IF
   END IF
   z = 0
   DO
      z = z + 1
      FOR x = z TO 24
         IF s(x) = 1 THEN EXIT FOR
      NEXT x
      z = x
      IF NOT (m(z + a + b + c) = 5 OR (s(z + a + b + c) = 2 AND m(z + a + b + c) >= 2) OR z + a + b + c > 25) THEN
         m(z) = m(z) - 1
         IF m(z) = 0 THEN s(z) = 0
         IF s(z + a + b + c) = 2 THEN m(z + a + b + c) = 0
         s(z + a + b + c) = 1
         m(z + a + b + c) = m(z + a + b + c) + 1
         CALL printface(m(), s())
         GOTO 100
      END IF
   LOOP UNTIL z > 24
100
NEXT times
END

SUB printface (m(), s())
FOR x = 1 TO 24
   IF s(x) = 1 THEN
      IF morethanone = 1 THEN PRINT ",";
      PRINT LTRIM$(RTRIM$(STR$(m(x)))); ","; LTRIM$(RTRIM$(STR$(x)));
      morethanone = 1
   END IF
NEXT x
PRINT
PRINT
END SUB

