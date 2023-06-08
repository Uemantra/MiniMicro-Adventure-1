    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   //                                                                     \\
  //     Ian's Amazing first attempt at making a UI with miniscript        \\
 //	                                                                    \\
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
//----------------------------------------------------------------------------//
//||       So all this does, is let you click on the "Engage" button         // 
//||        to see a menu of options pop up below.                          //
//-------------------------------------------------------------------------//
//||        the menu does not go away automatically like it should        //
//||          so the band aid is holding enter while hovering the        //
//||         mouse over "engage"                                        //
//---------------------------------------------------------------------//
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\//////////////////////////////////////\
 import "chars"                                                 //  \\\\\\
 import "dateTime"                                             //    \\\\\\
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////      \\\\\\
 clear                                                       //        \\\\\\
 prevCounter = ""                                           //          \\\\\\
  //////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 // upDateCounter updats the count for how many times the program has cycled \\\
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\//////////////////////////////////////////\\\
 updateCounter = function(dt)                                        //\\ ||    \\
  counter = round(time)                                             //  \\||    |\\
   if counter == prevCounter then return                           //||||\||||||||\\
    text.row = 25                                                 //      ||    |||\\ 
     print "cycle count:" + counter                              //       ||    |||||
      globals.prevCounter = counter                             //        ||    ||||| 
	  end function                                         //         ||    |||||
  //////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 // enGageMenu is a function that prints the top bar on the screen for the UI     ///
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\////////////////////////////////////////////////
 engageMenu = function                                      //                  ///
  text.row = 26                                            //                  ///
   print chars.diamond                                    //                  ///
  text.row = 26                                          //                  ///\
  text.column = 1                                       //                  ///\\\
   print " Engage   |                          | " + dateTime.niceDatetime ///  \\\
    text.row = 24                                     //                  ///    \\\
	text.column = 0                              //                  ///      \\\
	 print "--------------------------------------------------------------------"  
 end function                                      //                 ///    ///////
   /////////////////////////////////////////////\\//\\\\\\\\\\\\\\/////////////////
  // clickEngage prints the actual characters for each invididual button in the\\\\
 // Engage menu. These could probably be split into a class in the end so the\\\\\\\
// data could be manipulated easier from other functions\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\///////////////////////////////////////////////////
 clickEngage = function  //   |\\\\                  ///                     ///////
  text.row = 23          //   ||\\\\                ///                     ///////
  text.column = 0        //   || \\\\              ///                     ///////
   print chars.heart     //   ||  \\\\            ///                     ///////
  text.row = 23          //   ||   \\\\          ///                     ///////
  text.column = 1        //   ||    \\\\        ///                     ///////
   print " Apps     |"   //   ||     \\\\      ///                     ///////
    text.row = 22        //   ||      \\\\    ///                     ///////
    text.column = 0      //   ||       \\\\  ///                     ///////
     print "-----------" //   ||        \\\\///                     ///////
  text.row = 21          //--------------\\\\/---------------------///////|
  text.column = 0        //   ||          \\\\                    ///////||
   print chars.spade     //   ||         //\\\\                  /////// ||
  text.row = 21          //   ||        /// \\\\                ///////  ||
  text.column = 1        //   ||       ///   \\\\              ///////   ||
   print " Files    |"   //   ||      ///     \\\\            ///////    ||
    text.row = 20        //   ||     ///       \\\\          ///////     ||
    text.column = 0      //   ||    ///         \\\\        ///////      ||
     print "-----------" //   ||   ///           \\\\      ///////       ||
  text.row = 19          //   ||  ///             \\\\    ///////        ||
  text.column = 0        //   || ///               \\\\  ///////         ||
   print chars.club      //   ||///                 \\\\///////          ||
  text.row = 19          //   ||//                   \\\\/////           ||
  text.column = 1        //___||/____________________/\\\\///            ||
   print " Shutdown |"                              ///\\\\/             ||
    text.row = 18                                  /////\\\\             ||
    text.column = 0                               ///////\\\\            ||
     print "-----------"                         ///////  \\\\           ||\
  wait(1)                                       ///////    \\\\          |||\
   yield                                       ///////      \\\\         ||||\
 end function                                 ///////        \\\\        ||||||
   ///////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  // mInput is my attempt at a function to find out if the mouse is clicking \\\
 //   on the button "engage" or not.                                          \\\
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\//////////////////////////////////////////\\\
 mInput = function	                     //////////                  ||||||||/
  gfx.color = "#FFF52EEE"                   //////////                   |||||||/
   while not key.pressed("return")         //////////                    ||||||/
	m = {"x": mouse.x, "y": mouse.y}  //////////                     |||||/ 
	 if mouse.button == 1 then       //////////                      ||||/
	 if m.x < 100 then              //////////                       |||/
	 if m.y > 610 then             //////////                        ||/
	  clickEngage                 //////////                         |||
	 end if                      //////////                          |||
     end if                         //////////                           |||
	 end if	                   //////////                            |||
   end while                      //////////                             ||/
   end function                  //////////                              ||
   ///////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\|||||||
  // screenClear simply clears the screen each cycle and asks the UI|||||||
 //      to redraw the screen                                  ||||||||||||
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////||||||||||||
 screenClear = function                                 //     ||||||/////
  clear                                                //      |||||/////
   SolidColorDisplay.color = color.navy               //       ||||/////
    engageMenu                                       //        |||/////
	mInput                                      //         ||/////
 end function                                      //|         |/////
////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\//////////////////
lastTime = time                                  //|||       //////
//////\\\\\\\\\\\\\\\\\\///////////////////////\\\\|||      //////
/// the While loop below keeps things runnning  \\\\||     //////
//\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\|    //////
 while not key.pressed("escape")                         //////
  now = time                                            //////
  dt = now - lastTime                                  //////
  lastTime = now                                      //////
   screenClear                                       //////
    yield                                           //////
end while                                          //////
///////////////The End \\\\\\\\\\\\\////////////////////
screenClear //                                   //////
/////////////                                   //////
	 ///                                   //////
        ///                     	      //////
       ///                      	     //////
      ///		                    //////
     ///			           //////
    ///		             		  //////
   ///	                                 //////
  ///===================================//////
 ///
///
//
