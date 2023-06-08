// card battler test

// A basic battle card game like Hearthstone, or Marvel Snap

// 3 cards can be on the playing field for each player at any time (or none)

// Players hand is 5 cards drawn from a deck of 20

// cards will all have at least the basic attack,defense,and energy cost stats.




//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
   //----------------------\\                              \\
  //  Global    Variables   \\                              \\
 //--------------------------\\                              \\
//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

//As I have been having troubleshooting issues with local variables I am keeping
//most global for now. I can prune these later but I just don't need the extra
//headache while I am figuring this stuff out.

curCrd = null
curEnergy = 0
crdNum = 0
crdSlotP = null
crdSlotF = null

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
  //--------------\\       \\                                  \\
 //Objects/Classes \\       \\                                  \\
//------------------\\       \\                                  \\
//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

//slt class is to assign cards and other values to the game board positions.
// as each side of the board has three slots I am using N and S to signify 
// the different players side on the board.


slt = {}
slt.num = null
slt.crdN = null
slt.crdS = null
slt.abil = null

slot1 = new slt
slot1.num = 1
slot1.crdN = null
slot1.crdS = null
slot1.abil = null

slot2 = new slt
slot2.num = 2
slot2.crdN = null
slot2.crdS = null
slot2.abil = null

slot3 = new slt
slot3.num = 3
slot3.crdN = null
slot3.crdS = null
slot3.abil = null



//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

// crd Object class is the base card values that will be available in the game. 
// I will have to implement a system that pulls data from this set to create
// new datasets for each player for each game so stats can be changed without
// effecting base levels. This will likely be later moved to a different file
// that is imported.

crd = {}
crd.name = "The Name of a Card"
crd.description = "A longer description of the card including details about any special abilities that may be present"
crd.number = 0 
crd.attack = 0
crd.health = 0
crd.defense = 0
crd.cost = 0
crd.deploy = 0
crd.sentinel = 0
crd.spy = 0
crd.dyingwish = 0
crd.slot = null

peasent = new crd
peasent.name = "Peasent"
peasent.description = "A lowly peasent with no place in this battle, they will do their best."
peasent.number = 001
peasent.attack = 1
peasent.health = 1
peasent.defense = 1
peasent.cost = 1
peasent.deploy = 0 
peasent.sentinel = 0
peasent.spy = 0
peasent.dyingwish = 0
peasent.slot = null

squire = new crd
squire.name = "Squire"
squire.description = "The newly minted squire is eager to prove his worth and earn his knighthood."
squire.number = 002
squire.attack = 2
squire.health = 2
squire.defense = 2
squire.cost = 2
squire.deploy = 0
squire.sentinel = 0
squire.spy = 0
squire.dyingwish = 0
squire.slot = null

fighter = new crd
fighter.name = "Fighter"
fighter.description = "The Fighter has made a vow to his family to defend their land, they will fight to their last breath."
fighter.number = 003
fighter.attack = 3
fighter.health = 5
fighter.defense = 5
fighter.cost = 3
fighter.deploy = 0
fighter.sentinel = 0 
fighter.spy = 0
fighter.dyingwish = 0
fighter.slot = null

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\




//\\//\\//\\//\\//\\//\\//\\//\\
   //---------\\               \\
  // Functions \\               \\
 //-------------\\               \\
//\\//\\//\\//\\//\\//\\//\\//\\//\\




///Let User Select a Card in their hand

selectCrd = function
 print "Please choose your card from the following..."
 print "1. Peasent "
 print "2. Squire "
 print "3. Fighter "
  globals.crdNum = input("Enter Corresponding Number:")
   if globals.crdNum == "1" then
  globals.curCrd = peasent
   else if globals.crdNum == "2" then
  globals.curCrd = squire
   else if globals.crdNum == "3" then
  globals.curCrd = fighter
   end if
 displayCurCrd
end function
 
///Display details and stats for card currently selected by user

 displayCurCrd = function
  wait(2)
  print " "
  print " "
  print "Your current card is: " + curCrd.name
  print "Your cards defense is: " + curCrd.defense
  print "Your cards attack is: " + curCrd.attack
  print "Remaining hitpoints : " + curCrd.health
  print " "
  print curCrd.description
  crdSlotPick
 end function

//Let user pick which slot to place selected card on the game board.
//or let user go back and pick a different card

 crdSlotPick = function
  print " "
  print "Currently the 3 positions on the board have the following cards:"
  print "slot 1:" + slot1.crdN
  print "slot 2:" + slot2.crdN
  print "slot 3:" + slot3.crdN
  wait(2)
   print " "
   print "You currently are holding the card " + curCrd.name  + "."
   print "Which slot on the game board would you like to play it on?"
   print "Slot (1)"
   print "Slot (2)"
   print "Slot (3)"
   print "Pick a different card (4)"
    crdSlotP = input("Select Number:")
     if crdSlotP != "4" then
      crdSlotF(crdSlotP)
	 end if	
	 if crdSlotP == "4" then
      selectCrd
     end if
 end function


// For this next function I am going to attempt to check if the slot is free
// before the player plays a card in it.

crdSlotF = function(csP)
 if csP == "1" then
  while slot1.crdN == null
   slot1.crdN = curCrd   
    tempN = (slot1.crdN).name 
     slot1.crdN = tempN
      curCrd.slot = "1"
	   print " "
	   print "You have placed the card: " + curCrd.name + ", in slot #1"
	   print " "
	    wait(1)
         selectCrd
  end while
  while not slot1.crdN == null
   print "Sorry, That is taken."
   print "proper error for real boyo!"
   print " "
   print "Do not pass go, do not collect $200"
   print "redo that choice dog."
    wait(2)
     crdSlotPick
  end while
 end if  
 if csP == "2" then
  while slot2.crdN == null 
   slot2.crdN = curCrd 
    tempN = (slot2.crdN).name 
     slot2.crdN = tempN
      curCrd.slot = "2"
	   print " "
	   print "You have placed the card: " + curCrd.name + ", in slot #2"
	   print " "
	    wait(1)
         selectCrd
  end while
  while not slot2.crdN == null
   print "Sorry, That is taken."
   print "proper error for real boyo!"
   print " "
   print "Do not pass go, do not collect $200"
   print "redo that choice dog."
    wait(2)
     crdSlotPick
  end while
 end if   
 if csP == "3" then
  while slot3.crdN == null
   slot3.crdN = curCrd 
    tempN = (slot3.crdN).name
     slot3.crdN = tempN
      curCrd.slot = "3"
	   print " "
	   print "You have placed the card: " + curCrd.name + ", in slot #3"
	   print " "
	    wait(1)
         selectCrd
  end while
  while not slot3.crdN == null
   print "Sorry, That is taken."
   print "proper error for real boyo!"
   print " "
   print "Do not pass go, do not collect $200"
   print "redo that choice dog."
    wait(2)
     crdSlotPick
  end while
 end if
end function

selectCrd