'Ben great job. Grade=100. 
   REM
   REM Benjamin Wolf
   REM September 19, 2002
   REM BWdate.bas
   REM
   CLS
   weekday = 3
   month$ = "January"
   date = 1
   year = 2003
10 INPUT "Seconds after 12 AM, New Year's Day, 2003 ==> ", time
   IF time < 0 THEN
      PRINT "Do not enter a negative number."
      GOTO 10
   END IF
   time = INT(time)
   sec = time MOD 60
   mins = time \ 60
   hour = mins \ 60
   mins = mins MOD 60
   days = hour \ 24
   hour = hour MOD 24
   weekday = weekday + days MOD 7
   IF weekday > 6 THEN weekday = weekday - 7
   year = year + days \ 365
   days = days MOD 365
   IF days < 31 THEN date = date + days
   IF days > 30 AND days < 59 THEN
      month$ = "February"
      date = date + days - 31
   END IF
   IF days > 58 AND days < 90 THEN
      month$ = "March"
      date = date + days - 59
   END IF
   IF days > 89 AND days < 120 THEN
      month$ = "April"
      date = date + days - 90
   END IF
   IF days > 119 AND days < 151 THEN
      month$ = "May"
      date = date + days - 120
   END IF
   IF days > 150 AND days < 181 THEN
      month$ = "June"
      date = date + days - 151
   END IF
   IF days > 180 AND days < 212 THEN
      month$ = "July"
      date = date + days - 181
   END IF
   IF days > 211 AND days < 243 THEN
      month$ = "August"
      date = date + days - 212
   END IF
   IF days > 242 AND days < 273 THEN
      month$ = "September"
      date = date + days - 243
   END IF
   IF days > 272 AND days < 304 THEN
      month$ = "October"
      date = date + days - 273
   END IF
   IF days > 303 AND days < 334 THEN
      month$ = "November"
      date = date + days - 304
   END IF
   IF days > 333 AND days < 365 THEN
      month$ = "December"
      date = date + days - 334
   END IF
  
   REM Determine AM or PM and Hour
   IF hour < 12 THEN meridian$ = " AM"
   IF hour > 11 THEN
      meridian$ = " PM"
      hour = hour - 12
   END IF
   IF hour = 0 THEN hour = 12
  
   REM Determine weekday
   IF weekday = 0 THEN day$ = "Sunday"
   IF weekday = 1 THEN day$ = "Monday"
   IF weekday = 2 THEN day$ = "Tuesday"
   IF weekday = 3 THEN day$ = "Wednesday"
   IF weekday = 4 THEN day$ = "Thursday"
   IF weekday = 5 THEN day$ = "Friday"
   IF weekday = 6 THEN day$ = "Saturday"
  
   Zdate$ = STR$(date)
   Zyear$ = STR$(year)
   Zhour$ = STR$(hour)
   Zmins$ = STR$(mins)
   Zsec$ = STR$(sec)

   Zyear$ = LTRIM$(Zyear$)
   Zhour$ = LTRIM$(Zhour$)
   Zmins$ = LTRIM$(Zmins$)
   Zsec$ = LTRIM$(Zsec$)
  
   REM Add '0' before minute and/or seconds for (Ex: 3:04:09 instead of 3:4:9)
   IF mins < 10 THEN
      IF sec < 10 THEN
         PRINT day$; ", "; month$; Zdate$; ", "; Zyear$; ", "; Zhour$; ":0"; Zmins$; ":0"; Zsec$; meridian$
      ELSE
         PRINT day$; ", "; month$; Zdate$; ", "; Zyear$; ", "; Zhour$; ":0"; Zmins$; ":"; Zsec$; meridian$
      END IF
      END
   END IF
   IF sec < 10 THEN
      PRINT day$; ", "; month$; Zdate$; ", "; Zyear$; ", "; Zhour$; ":"; Zmins$; ":0"; Zsec$; meridian$
   ELSE
      PRINT day$; ", "; month$; Zdate$; ", "; Zyear$; ", "; Zhour$; ":"; Zmins$; ":"; Zsec$; meridian$
   END IF
   END

