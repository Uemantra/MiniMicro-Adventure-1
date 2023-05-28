clear


prevCounter = ""

// Global Variables Section

timesLooped = 0

curRoom = secret

xxc = 666
yyc = 666

updateCounter = function(dt)
counter = round(time)
if counter == prevCounter then return
text.row = 25
print "cycle count:" + counter
globals.prevCounter = counter
end function

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

secretspace = function

if curRoom != xSecretroom then
curRoom = xSecretroom
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
	Room.extraD1 = "Extra Description Slot"
	Room.extraD2 = "Extra Description Slot"
	Room.extraD3 = "Extra Description Slot"
	Room.extraD4 = "Extra Description Slot"
	Room.xCoord = 90
	Room.yCoord = 90
	
//Adding starting room "startRoom" in the class "Room"	
	startRoom = new Room
	startRoom.name = "Start Room"
	startRoom.nAvail = "n"
	startRoom.eAvail = "n"
	startRoom.sAvail = "n"
	startRoom.wAvail = "y"
	startRoom.generalD = function
		clear
		text.row = 15
		
		print "      You find yourself in a strange courtyard surrounded by, " 
		print "   what appears to be large grey castle walls. The courtyard"
		print "   has green grass on the ground and a large statue of a man"
		print "   in the center. Four stone paths lead in all four directions"
		print "   to open archways entering into the castle. There is a small"
		print "   pond in the NW corder of the courtyard, a tree stump in the"
		print "   NE corner, a long burned out firepit in the SW corner, and"
		print "   horrifyingly a corpse in the SE corner."
		
	end function
	startRoom.nLook = "Looking to the north you see an Archway into the castle with stairs leading up in a spiral."
	startRoom.eLook = "To the East is a castle wall and an archway that is not available during this stage of game development"
	startRoom.sLook = "To the South is a great archway in the castle wall."
	startRoom.wLook = "To the West is a great door archway leading into a creepy castle room."
	startRoom.dLook = "The ground is covered in very nice green grass, it appears to be freshly cut even though the corpse on the ground is very old and un-disturbed"
	startRoom.uLook = "Looking up from this courtyard you have a good look at the sky. Despite your situation it is a beautiful and sunny day."
	startRoom.extraD1 = "Extra Description Slot"
	startRoom.extraD2 = "Extra Description Slot"
	startRoom.extraD3 = "Extra Description Slot"
	startRoom.extraD4 = "Extra Description Slot"
	startRoom.xCoord = 4
	startRoom.yCoord = 2
	
	
// Defining second room "x3y2" in class "Room"	
	x3y2 = new Room
	x3y2.name = "Dark Room"
	x3y2.nAvail = "n"
	x3y2.eAvail = "y"
	x3y2.sAvail = "n"
	x3y2.wAvail = "n"
	x3y2.generalD = "This is room x3, y2"
	x3y2.nLook = "To the North is a spiral staircase leading up"
	x3y2.eLook = "To the East is the archway back the the outdoor courtyard"
	x3y2.sLook = "On the rooms South wall is a fantastic painting."
	x3y2.wLook = "The west side of the room has a large iron door."
	x3y2.dLook = "The floor is stone, and grimy"
	x3y2.uLook = "Above you is the stone ceiling of the castle, the room is lit only by an almost spent candle chandelier"
	x3y2.extraD1 = "Extra Description Slot"
	x3y2.extraD2 = "Extra Description Slot"
	x3y2.extraD3 = "Extra Description Slot"
	x3y2.extraD4 = "Extra Description Slot"
	x3y2.xCoord = 3
	x3y2.yCoord = 2


// Defining second room "secret" in class "Room"	
	xSecretroom = new Room
	xSecretroom.name = "Ian's PlayRoom"
	xSecretroom.nAvail = "n"
	xSecretroom.eAvail = "n"
	xSecretroom.sAvail = "n"
	xSecretroom.wAvail = "n"
	xSecretroom.generalD = "You really don't want to be here."
	xSecretroom.nLook = "To the North is a spiral staircase leading up"
	xSecretroom.eLook = "To the East is the archway back the the outdoor courtyard"
	xSecretroom.sLook = "On the rooms South wall is a fantastic painting."
	xSecretroom.wLook = "The west side of the room has a large iron door."
	xSecretroom.dLook = "The floor is stone, and grimy"
	xSecretroom.uLook = "Above you is the stone ceiling of the castle, the room is lit only by an almost spent candle chandelier"
	xSecretroom.extraD1 = "Extra Description Slot"
	xSecretroom.extraD2 = "Extra Description Slot"
	xSecretroom.extraD3 = "Extra Description Slot"
	xSecretroom.extraD4 = "Extra Description Slot"
	xSecretroom.xCoord = 666
	xSecretroom.yCoord = 666




// Creating some global functions
	
goNorth = function(n)
	if curRoom.nAvail == "n" then
		print " "
		print "I apologize, but it seems you cannot go North at this time"
		wait(1)
		break
	else if curRoom.nAvail == "y" then
		print " "
		print "you went north"
		print " "
		wait(1)
		globals.yyc = (yyc + 1)
	end if
	yield
end function
	
goEast = function(e)
	if curRoom.eAvail == "n" then
		print " "
		print "I apologize, but it seems you cannot go east at this time"
		wait(1)
		break
	else if curRoom.eAvail == "y" then
		print " "
		print "You went East"
		print " "
		wait(1)
		globals.xxc = (xxc + 1)
	
	end if
	yield
	end function


goSouth = function(s)
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
	yield
	end function
	
goWest = function(w)
	if curRoom.wAvail == "n" then
		print " "
		print "I apologize, but it seems you cannot go West at this time"
		wait(1)
		break
	else if curRoom.wAvail == "y" then
		print " "
		print "you went west"
		print " "
		wait(1)
		globals.xxc = (xxc - 1)
	end if
	yield
	end function
	
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
	
secretspace = function
globals.curRoom = xSecretroom
globals.xxc = 666
globals.yyc = 666
end function


//Define CMDLine Function


cmdLine = function(dt)

    getCurRoom

	clear
	text.row = 27
	text.column = 0
	print "x" + curRoom.xCoord + " y" + curRoom.yCoord
	text.row = 27
	text.column = 25
	print "room: " + curRoom.name
	text.row = 1
	text.column = 0
	clInput = input(":#>")
	
		

	
		// If statement for simple testing purpose to see if room movement functions work.
		// This will need to be sanitized by a parser for final game.
		if clInput == "n" then
		goNorth("curRoom")
		else if clInput == "e" then
		goEast(curRoom)
		else if clInput == "s" then 
		goSouth(curRoom)
		else if clInput == "w" then
		goWest(curRoom)
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
		wait(2)

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