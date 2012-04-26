   CLS
   REM Benjamin Wolf
   REM Rudy Mukherjee
10 PRINT "Welcome to Rudy and Ben's Trivia Game!"
   PRINT "If you did not intend to use this particular program, tough."
20 INPUT "Are you ready to start, Y or N?", ready$
   IF ready$ = "N" OR ready$ = "n" THEN
      PRINT "Who cares if you're ready? Let's begin!"
      GOTO 30
   END IF
   IF ready$ = "Y" OR ready$ = "y" THEN
      PRINT "Good. Let's begin!"
      GOTO 30
   END IF
   PRINT "You must enter 'Y' or 'N'! Otherwise, suffer the consequences!"
   GOTO 20
30 score = 0
   wrong = 0
   PRINT "Question 1: Who is the current president of the U.S.?"
   PRINT "A) William Clinton; B) John Torricelli; C) George W. Bush; D) Jay Leno"
   INPUT ans$
   IF ans$ = "C" OR ans$ = "c" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 2: What is the capital of New Jersey?"
   PRINT "A) Trenton; B) Newark; C) Jersey City; D) Atlantic City"
   INPUT ans$
   IF ans$ = "A" OR ans$ = "a" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 3: Which was the video game console that Pong was originally released for?"
   PRINT "A) Nintendo Entertainment System; B) Playstation; C) Atari; D) Game Boy"
   INPUT ans$
   IF ans$ = "C" OR ans$ = "c" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 4: Who was the first human launched into space?"
   PRINT "A) Neil Armstrong; B) John Glenn; C) Yuri Gagarin; D) Yogi Berra"
   INPUT ans$
   IF ans$ = "C" OR ans$ = "c" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 5: Who is the CEO of Microsoft?"
   PRINT "A) Bill Gates; B) Steve Ballmer; C) Steve Jobs; D) Bill Clinton"
   INPUT ans$
   IF ans$ = "B" OR ans$ = "b" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 6: What is the square root of 225?"
   PRINT "A) 14; B) 16; C) 13; D) 15; E) 225"
   INPUT ans$
   IF ans$ = "D" OR ans$ = "d" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 7: Who played the part of Ben Kenobi in Star Wars: A New Hope?"
   PRINT "A) Sir Alec Guinness; B) Sir Walter Raleigh; C) Sir Isaac Newton; D) Me"
   INPUT ans$
   IF ans$ = "A" OR ans$ = "a" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 8: What is the name of the school you are currently in?"
   PRINT "A) Lenape; B) Shawnee; C) Cherokee; D) Harvard U."
   INPUT ans$
   IF ans$ = "C" OR ans$ = "c" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 9: What was the answer to the first question?"
   PRINT "A) D; B) A; C) E; D) C; E) B; F) Y/N"
   INPUT ans$
   IF ans$ = "F" OR ans$ = "f" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "We fooled you! The first question was 'Are you ready to start, Y or N?'"
     wrong = wrong + 1
   END IF
   PRINT "Question 10: Who directed the movie 'Signs'?"
   PRINT "A) Steven Spielberg; B) Arnold Schwartzenegger;"
   PRINT "C) M. Night Shyamalan; D) Mr. Callinan"
   INPUT ans$
   IF ans$ = "C" OR ans$ = "c" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Your score is now:"
   PRINT ; score; "correct"
   PRINT ; wrong; "incorrect"
   IF score = 10 THEN PRINT "You have gotten them all correct so far! Good job!"
   IF wrong = 10 THEN PRINT "You have not gotten a single question correct. You are incredibly stupid!"
   PRINT "Question 11: What are the two sizes of floppy disks (in inches)?"
   PRINT "A) 3.5 and 5.5; B) 3.25 and 5.25; C) 3.25 and 5.5; D) 3.5 and 5.25"
   INPUT ans$
   IF ans$ = "D" OR ans$ = "d" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 12: What is the name of the basic language computers understand?"
   PRINT "A) Binary; B) Hexadecimal; C) English; D) QBASIC"
   INPUT ans$
   IF ans$ = "A" OR ans$ = "a" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 13: In what year was Mohandas Gandhi born?"
   PRINT "A) 1776; B) 1869; C) 1896; D) 1921; E) 6 B.C."
   INPUT ans$
   IF ans$ = "B" OR ans$ = "b" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 14: Who was the author of 'The Lord of the Rings'?"
   PRINT "A) Stephen King; B) J. R. Tolkien; C) J. R. R. Tolkien; D) Bilbo Baggins"
   INPUT ans$
   IF ans$ = "C" OR ans$ = "c" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 15: What is considered the most important meal of the day?"
   PRINT "A) Breakfast; B) Lunch; C) Dinner; D) Snacktime"
   INPUT ans$
   IF ans$ = "A" OR ans$ = "a" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 16: If today is Wednesday, what is the day before the day"
   PRINT "after three days before tomorrow?"
   PRINT "A) Monday; B) Tuesday; C) Thursday; D) Saturday; E) Miercoles"
   INPUT ans$
   IF ans$ = "A" OR ans$ = "a" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 17: What is the language that most of our language is based on?"
   PRINT "A) German; B) Italian; C) Spanish; D) Japanese; E) Latin"
   INPUT ans$
   IF ans$ = "E" OR ans$ = "e" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 18: Who wrote 'War and Peace'?"
   PRINT "A) Stephen King; B) Leo Tolstoy; C) J. R. R. Tolkien; D) Agatha Christie"
   INPUT ans$
   IF ans$ = "B" OR ans$ = "b" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 19: What is the name of the trigonomic ratio of the adjacent side of a right triangle and the hypotenuse?"
   PRINT "A) Cosine; B) Secant; C) Tangent; D) Sine; E) Math"
   INPUT ans$
   IF ans$ = "A" OR ans$ = "a" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT "Question 20: What is the millionth prime number?"
   PRINT "A) 15,485,843; B) 15,485,863; C) 15,485,917; D) 15,485,927; E) 15,485,941"
   INPUT ans$
   IF ans$ = "B" OR ans$ = "b" THEN
     PRINT "You are correct."
     score = score + 1
   ELSE
     PRINT "You are wrong."
     wrong = wrong + 1
   END IF
   PRINT
   PRINT "Pencils down."
   PRINT "This concludes the multiple choice portion of the test."
   PRINT "(Actually, the whole thing!)"
   PRINT
40 INPUT "Would you like to see your score, Y/N? ", res$
   IF res$ = "Y" OR res$ = "y" THEN
      PRINT "Okay, here is your score:"
      GOTO 50
   END IF
   IF res$ = "N" OR res$ = "n" THEN
      PRINT "Oh, that's too bad... Here's your score, anyway:"
      GOTO 50
   END IF
   PRINT "This is a Y or N question. Nothing else is accepted!"
   GOTO 40
50 PRINT ; score; "correct"
   PRINT ; wrong; "incorrect"
   IF score = 20 THEN
      PRINT "You have a perfect score! You are guilty of cheating."
      GOTO 60
   END IF
   IF wrong = 20 THEN
      PRINT "You did not answer any questions correctly. We are sorry that you have no brain."
      GOTO 60
   END IF
   IF score > wrong THEN PRINT "You got more questions right than wrong. Good job."
   IF wrong > score THEN PRINT "You got more questions wrong than right. You are not too smart."
   IF score = wrong THEN PRINT "You got the same amount of right and wrong answers. You are completely average."
60 PRINT
   INPUT "Press enter to continue.", nothing$
   PRINT
   PRINT "We have nothing more to say to you."
   PRINT
   PRINT
   PRINT ; "          You have reached "
   PRINT
   PRINT
   PRINT ; "               THE END"
   END

