// For Some Reason I was unable to get import to work for my custom
// datetime.ms function, so I just included it here for now.
 nowVal = function
  return _dateVal
 end function
 now = function(format="yyyy-MM-dd HH:mm:ss")
  return _dateStr(_dateVal, format)
 end function
 timeCur = function(format="HH:mm")
  return _dateStr(_dateVal, format)
 end function
 dayOfMonth = function(format="dd")
  return _dateStr(_dateVal, format)
 end function
 yearCur = function(format="yyyy")
  return _dateStr(_dateVal, format)
 end function
 str = function(date, format="yyyy-MM-dd HH:mm:ss")
  return _dateStr(date, format)
 end function
 val = function(dateStr)
  return _dateVal(dateStr)
 end function
 year = function(date)
  return _dateStr(date, "yyyy").val
 end function
 month = function(date)
  return _dateStr(date, "%M").val
 end function
 day = function(date)
  return _dateStr(date, "%d").val
 end function
 hour = function(date)
  return _dateStr(date, "%H").val
 end function
 minute = function(date)
  return _dateStr(date, "%m").val
 end function
 second = function(date)
  return _dateStr(date, "%s").val
 end function
 weekdayNames = "Sun Mon Tue Wed Thu Fri Sat".split
 weekday = function(date)
  return weekdayNames.indexOf(_dateStr(date, "ddd"))
 end function

//The changes I made to datetime.ms start here. I was just learning his stuff
//and I really wanted the date and time to be displayed a particular way in my 
//so I added the required functions to display it that way.
 printedWeekday = function(dayofweek)
  if weekday == 0 then
   dayofweek = "Sunday"
  end if
 if weekday == 1 then
  dayofweek = "Monday"
 end if
 if weekday == 2 then
  dayofweek = "Tuesday"
 end if
 if weekday == 3 then
  dayofweek = "Wednesday"
 end if
 if weekday == 4 then
  dayofweek = "Thursday"
 end if
 if weekday == 5 then 
  dayofweek = "Friday"
 end if
 if weekday == 6 then
  dayofweek = "Saturday"
 end if
 return dayofweek
end function
printedMonth = function(monthofyear)
 if month == 1 then
  monthofyear = "Jan"
 end if
 if month == 2 then
  monthofyear = "Feb"
 end if
 if month == 3 then
  monthofyear = "Mar"
 end if
 if month == 4 then
  monthofyear = "Apr"
 end if
 if month == 5 then
  monthofyear = "May"
 end if
 if month == 6 then
  monthofyear = "Jun"
 end if
 if month == 7 then
  monthofyear = "Jul"
 end if
 if month == 8 then
  monthofyear = "Aug"
 end if
 if month == 9 then
  monthofyear = "Sep"
 end if
 if month == 10 then
  monthofyear = "Oct"
 end if
 if month == 11 then
  monthofyear = "Nov"
 end if
 if month == 12 then
  monthofyear = "Dec"
 end if
 return monthofyear
end function
niceDatetime = function(nicedt)
 nicedt = printedWeekday + " " + printedMonth + " " + day + " " + year + " | " + timeCur
 return nicedt
end function
import "chars"
clear
prevCounter = ""
updateCounter = function(dt)
 counter = round(time)
  if counter == prevCounter then return
   text.row = 25
   print "cycle count:" + counter
   globals.prevCounter = counter
end function
engageMenu = function
 text.row = 26
  print chars.diamond
 text.row = 26
 text.column = 1
  print " Engage   |                           | " + niceDatetime
 text.row = 24
 text.column = 0
  print "--------------------------------------------------------------------"
end function
clickEngage = function
 text.row = 23
 text.column = 0
  print chars.heart
 text.row = 23
 text.column = 1
  print " Apps     |"
 text.row = 22
 text.column = 0
  print "-----------"
 text.row = 21
 text.column = 0
  print chars.spade
 text.row = 21
 text.column = 1
  print " Files    |"
 text.row = 20
 text.column = 0
  print "-----------"
 text.row = 19
 text.column = 0
  print chars.club
 text.row = 19
 text.column = 1
  print " Shutdown |"
 text.row = 18
 text.column = 0
  print "-----------"
  wait(1)
  yield
end function
mInput = function	
 gfx.color = "#FFF52EEE"
  while not key.pressed("return")
   m = {"x": mouse.x, "y": mouse.y}
    if mouse.button == 1 then
     if m.x < 100 then
      if m.y > 610 then
       clickEngage
      end if
     end if
	end if
  end while
end function
screenClear = function
 clear
 SolidColorDisplay.color = color.navy
  engageMenu
  mInput
end function
lastTime = time
while not key.pressed("escape")
 now = time
 dt = now - lastTime
 lastTime = now
 screenClear
 yield
end while
screenClear