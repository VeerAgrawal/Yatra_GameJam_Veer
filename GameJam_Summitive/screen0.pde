//Instructions screen 
class screen0
{
  screen0()
  {
    
  }
 void draw ()
 {
 //background
 background(0);
 //instuctions to move
 textSize(40);
 text ("Press left to move", 10, 50);
 textSize(40);
 text ("Hold space to surf", 10, 150);
 textSize(40);
 text ("press right to move", 10, 250);
 //to switch to the game screen after 7 seconds
 if (millis()> 7000)
 {
   screen = 1;
 } 
 }
}
