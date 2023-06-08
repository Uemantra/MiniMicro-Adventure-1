  //                          \\
 //    Ian's first adventure.  \\
//______________________________\\
//Well, not my first but this was the first semi complete concept I worked on for the Mini Micro
 clear
 prevCounter = ""
    //                           //
  // Global Variables Section   //
//                             //
 //This Variable simply tells us how many times the game has run through the main cmdLine Loop
  // I am including this now for diagnostic purposes. 
 timesLooped = 0
//Defining a variable to make our default room "secret" 
 secret = 0
 curRoom = secret
//A variable to use to let us know to end the loop once the player quits the game.
 userEndGame = false
//Some lists to define acceptable words to use for directional travel
//this makes it so these don't have to be listed out manually later in code.
 nDir = ["north", "North", "n", "N"]
 eDir = ["east", "East", "e", "E"]
 sDir = ["south", "South", "S", "s"]
 wDir = ["west", "West", "W", "w"]
// Setting initial room coordinates. These are for secret room.
 xxc = 666
 yyc = 666
//This function counds hor many times the entire game loop has run.
 updateCounter = function(dt)
  counter = round(time)
   if counter == prevCounter then return
    text.row = 25
	 print "cycle count:" + counter
  globals.prevCounter = counter
end function
//This function will only run the first time the loop starts up. 
//It will change the default room to the starting room and will not run again
//as long as our cycle count is more than 1
 firstRun = function(dt)
  runcount = timesLooped
   if timesLooped < 1 then
    globals.curRoom = startRoom
	globals.timesLooped = (runcount + 1)
	globals.xxc = 4
	globals.yyc = 2
     return curRoom
   else if runcount >= 1 then
	globals.timesLooped = (runcount + 1)
	 break
 end function
//A function used to just teleport to the secret room
//This room is not going to be accessible in game but is my testing room.
 secretspace = function
  if curRoom != xSecretroom then
   curRoom = xSecretroom
    globals.curRoom = xSecretroom
	globals.xxc = 666
	globals.yyc = 666
     screenClear
  else if curRoom == xSecretroom then
   text.row = 15 
   text.column = 10
    print "Well, you sure do know that secret code."
    print "But you are already in the secret room."
	 wait(2)
   screenClear
  end if
 end function
//This function sets up the main UI for the user. It currently puts the room coordinates
//Room name, and cycle count on the top of the screen and then sets any new text to be 
// starting on row 15 going forward.
 screenClear = function
  getCurRoom
   clear
	text.row = 27
	text.column = 0
	 print "x" + curRoom.xCoord + " y" + curRoom.yCoord
	text.row = 27
	text.column = 25
	 print "room: " + curRoom.name
	text.row = 27
	text.column = 60
	 print timesLooped
    text.row = 15
 end function 	
// Defining the class "Room"
 Room = {}
  Room.name = "Default Room"
  Room.nAvail = "n"
  Room.eAvail = "n"
  Room.sAvail = "n"
  Room.wAvail = "n"
  Room.generalD = "This is a Room"
  Room.nLook = "You Look North"
  Room.eLook = "You Look East"
  Room.sLook = "You Look South"
  Room.wLook = "You Look West"
  Room.dLook = "You Look Down"
  Room.uLook = "You Look Up"
  Room.xCoord = 90
  Room.yCoord = 90
  Room.firstTime = 0	
//Adding starting room "startRoom" in the class "Room"	
 startRoom = new Room
  startRoom.name = "The Courtyard"
  startRoom.nAvail = "n"
  startRoom.eAvail = "n"
  startRoom.sAvail = "n"
  startRoom.wAvail = "y"
   startRoom.generalD = function
	while not key.pressed("n")
	 screenClear
	 print "      You find yourself in a strange courtyard surrounded by, " 
	 print "   what appears to be large grey castle walls. The courtyard"
	 print "   has green grass on the ground and a large statue of a man"
	 print "   in the center. Four stone paths lead in all four directions"
	 print "   to open archways entering into the castle. There is a small"
	 print "   pond in the NW corder of the courtyard, a tree stump in the"
	 print "   NE corner, a long burned out firepit in the SW corner, and"
	 print "   horrifyingly a corpse in the SE corner."
	 print " "
	 print "                 Press 'n' to Continue "
	  yield
	end while
     key.clear
 end function
 startRoom.nLook = function
  while not key.pressed("n")
   screenClear
	print "Looking to the north you see an Archway into the castle with "
	print "		        stairs leading up in a spiral."
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function	
 startRoom.eLook = function
  while not key.pressed("n")
   screenClear
	print "To the East is a castle wall and an archway that is not available during"
	print "                this stage of game development"
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function	
 startRoom.sLook = function
  while not key.pressed("n")
   screenClear
	print "     To the South is a great archway in the castle wall."
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function	
 startRoom.wLook = function
  while not key.pressed("n")
   screenClear
	print "To the West is a great door archway leading into a creepy castle room."
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function	
 startRoom.dLook = function
  while not key.pressed("n")
   screenClear
	print "The ground is covered in very nice green grass, it appears to be freshly"
	print " cut even though the corpse on the ground is very old and un-disturbed"
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function	
 startRoom.uLook = function	
  while not key.pressed("n")
   screenClear
	print "Looking up from this courtyard you have a good look at the sky." 
	print "   Despite your situation it is a beautiful and sunny day."
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function
 startRoom.xCoord = 4
 startRoom.yCoord = 2
 startRoom.firstTime = 0
// Defining second room "x3y2" in class "Room"	
 x3y2 = new Room
 x3y2.name = "Dark Room"
 x3y2.nAvail = "n"
 x3y2.eAvail = "y"
 x3y2.sAvail = "n"
 x3y2.wAvail = "n"
  x3y2.generalD = function
   while not key.pressed("n")
	screenClear
	print "	This room is dark and spooky. The walls are the same"
	print "grey stone as what you saw outside, only in here they"
	print "give the space a very clausterphobic feel. Across print"
	print "the room from the door you came in is another door, it"
	print "is large, black and seemingly made of metal." 
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
	screenClear
 end function
 x3y2.nLook = function		
  while not key.pressed("n")
   screenClear
	print " The north side of the room is just the imposing grey stone wall."
	print "Nothing stands out." 
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function
 x3y2.eLook = function	
  while not key.pressed("n")
   screenClear
	print " To the east is the large archway you passed through that leads"
	print "back to the courtyard."	
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function
 x3y2.sLook = function
  while not key.pressed("n")
   screenClear
	print "  The south of the room has a very creepy looking painting"
	print "of a man with his face smeared and blurry." 
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function
 x3y2.wLook = function
  while not key.pressed("n")
   screenClear
	print "  The west side of the room has that imposing dark iron door."
	print "Looking closer at it you see what appears to be some kind"
	print "of demonic figure etched into the metal, and a large keyhole"
	print "in the center of the door." 
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
	key.clear
 end function
 x3y2.dLook = function
  while not key.pressed("n")
   screenClear
    print "The floor of the room is grey stone, nothing stands out." 
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function
 x3y2.uLook = function
  while not key.pressed("n")
   screenClear
	print "  The ceiling of this room is very high and arched."
	print "The extra space makes the uneasy feeling you have"
	print "that much stronger. You feel so small compared to this place." 
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function
  x3y2.xCoord = 3
  x3y2.yCoord = 2
  x3y2.firstTime = 0
// Defining second room "secret" in class "Room"	
 xSecretroom = new Room
  xSecretroom.name = "Ian's PlayRoom"
  xSecretroom.nAvail = "n"
  xSecretroom.eAvail = "n"
  xSecretroom.sAvail = "n"
  xSecretroom.wAvail = "n"
  xSecretroom.generalD = function
   while not key.pressed("n")
	screenClear
     print "Welcome to Ian's playroom. Test bed for stuff in this game." 
	 print " "
	 print "                 press 'n' to continue"
	  yield
   end while
    key.clear
 end function
 xSecretroom.nLook = function
  while not key.pressed("n")
   screenClear
	print "On the north side of the room you see Ian's personal PC, a bookshelf with books, and a robot dog." 
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
   key.clear
 end function
 xSecretroom.eLook = function
  while not key.pressed("n")
   screenClear
	print "The east side of the room has a giant window looking out." 
	print " "
	print "                 press 'n' to continue"
	 yield
	end while
     key.clear
 end function
xSecretroom.sLook = function
 while not key.pressed("n")
  screenClear
   print "The south wall of the room is covered in posters." 
   print " "
   print "                 press 'n' to continue"
	yield
  end while
   key.clear
 end function
 xSecretroom.wLook = function
  while not key.pressed("n")
   screenClear
	print "On the west end of the room is a gargoyle, ready to fight!" 
	print " "
	print "                 press 'n' to continue"
	 yield
	  end while
	   key.clear
	end function
 xSecretroom.dLook = function
  while not key.pressed("n")
   screenClear
	print "The floor of the room is carpeted with the kind of carpet you would find in a movie theatre" 
	print " "
	print "                 press 'n' to continue"
	 yield
	end while
	 key.clear
 end function
 xSecretroom.uLook = function
  while not key.pressed("n")
   screenClear
	print "The ceiling of the room contains lights of multiple colors adding to the ambiance." 
	print " "
	print "                 press 'n' to continue"
	 yield
  end while
    key.clear
 end function
  xSecretroom.xCoord = 666
  xSecretroom.yCoord = 666
  xSecretroom.firstTime = 0
 // Creating some global functions
//\\
  //These next four functions are what gets run after a sucessful directional input is recieved.
 //They check the curRoom object variables to see if the direction the player wants to go is accessible 
// from the room they are in. If it is then it changes the coordinate variable required to point
// to the new room. If that direction is not available it gives back an error.
 goNorth = function(n)
  screenClear
   if curRoom.nAvail == "n" then
	print " "
	print "I apologize, but it seems you cannot go North at this time"
	 wait(1)
	break
   else if curRoom.nAvail == "y" then
	print "You went North."
	wait(1)
	globals.yyc = (yyc + 1)
   end if
	getCurRoom
	yield
 end function	
 goEast = function(e)
  screenClear
   if curRoom.eAvail == "n" then
	print " "
	print "I apologize, but it seems you cannot go east at this time"
	wait(1)
	 break
  else if curRoom.eAvail == "y" then
   print "You went East"
   print " "
	wait(1)
	 globals.xxc = (xxc + 1)
  end if
   getCurRoom
	yield
 end function
  goSouth = function(s)
   screenClear
  if curRoom.sAvail == "n" then
   print " "
   print "I apologize, but it seems you cannot go South at this time"
	wait(1)
	 break	
  else if curRoom.sAvail == "y" then
   print " "
   print "you went south"
   print " "
    wait(1)
   globals.yyc = (yyc + 1)
  end if
   getCurRoom
	yield
 end function
goWest = function(w)
 screenClear
  if curRoom.wAvail == "n" then
   print " "
	print "I apologize, but it seems you cannot go West at this time"
	 wait(1)
	break
  else if curRoom.wAvail == "y" then
   print "You went West."
	wait(1)
	 globals.xxc = (xxc - 1)
  end if
   getCurRoom
	yield
 end function
//This function updates in game variables to match the correct room based on the current coordinate
//variables. This allows us to just change the x or y coordinate while moving rooms and this checks to make sure
// everything matches correctly.
 getCurRoom = function
  while globals.xxc == 4 
   if globals.yyc == 2 then
    globals.curRoom = startRoom
	 return curRoom
   end if
  end while
 while globals.xxc == 3 
  if globals.yyc == 2 then
   globals.curRoom = x3y2
    return curRoom
  end if
 end while		
 while globals.xxc == 666
  if globals.yyc == 666 then
   globals.curRoom = xSecretroom
	return curRoom
  end if
 end while
  yield
 end function
//Define CMDLine Function
 cmdLine = function(dt)
  getCurRoom
   screenClear
//The following if statement reads the general room description the first time you enter the room.	
  if curRoom.firstTime == 0 then
   curRoom.generalD
   curRoom.firstTime = 1
    screenClear
  else if curRoom.firstTime >=1 then 
   break
	yield
  end if
 text.row = 1
 text.column = 0
  clInput = input(":#>")
// if statements check if the input was directional and if so executes
//		the function to go in that direction if possible
  if nDir.indexOf(clInput) != null then
   goNorth("curRoom")	
	else if eDir.indexOf(clInput) != null then
	 goEast("curRoom")	
	else if sDir.indexOf(clInput) != null then
	 goSouth("curRoom")	
	else if wDir.indexOf(clInput) != null then
	 goWest("curRoom")	
  end if 		
  if clInput == "look" then
   curRoom.generalD
	else if clInput == "look up" then
	 print curRoom.uLook
	else if clInput == "look down" then
	 print curRoom.dLook
	else if clInput == "look north" then
	 print curRoom.nLook
	else if clInput == "look south" then
	 print curRoom.sLook
	else if clInput == "look east" then
	 print curRoom.eLook
	else if clInput == "look west" then
	 print curRoom.wLook
	end if
//if secret code is entered, function to teleport to secret room is invoked
 if clInput == "xyzzy" then
  secretspace
   end if
	yield
 end function	
// Loop to return to main screen after input(or anything else)
 lastTime = time
  while not key.pressed("escape")
   now = time
	dt = now - lastTime
   lastTime = now
	firstRun dt
	cmdLine dt     // user input
	 yield
  end while