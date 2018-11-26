import processing.video.*;
//screen
int screen = 0;
//classes
screen0 scene0;
screen2 scene2;
//to load the waves
Movie myMovie;
PImage player;
//player x and y
int playerX = 10;
int playerY = 140;
//surfer, who stands on the board
PImage standingPlayer;

void setup()
{
  //size
  size (600, 390);
  //class
  scene0 = new screen0();
  //loading video
  myMovie = new Movie(this, "Waves.mov");
  //players image
  player = loadImage("surfer.png");
  standingPlayer = loadImage("Standing.png");
  //class
  scene2 = new screen2();
}

void draw()
{
  //instructions screen
  if (screen == 0)
  {
   scene0.draw();
  }
//game screen
  if (screen == 1)
  {
    //background
    background (255, 255, 255);
    //beach
    fill (244, 164, 96);
    rect (-10, 280, 160, 200);
    //video of waves
    image(myMovie, 150, 0);
    //the video keeps playing
    myMovie.loop();
    //player
    player.resize(150, 250);
    image (player, playerX, playerY);
    // to make sure player doesnt cross screen
    if (playerX > 600)
    {
      playerX = 10;
    }
    //movement 
    if (keyPressed)
    {
      //press space bar, to surf 
      if (key == ' ')
      {
        if (playerX >20)
        {
          //moving the player out of screen
          playerY = 1000;
          //spawing the surfing standing player
          standingPlayer.resize(250, 350);
          image (standingPlayer, playerX, 110);         
          playerX = playerX - 5;
          //geting the player back to the screen
          if (playerX < 20)
          {
            playerY = 140;
          }
        }
      }
    }
   //moving right
    if (keyCode == RIGHT)
    {
      playerX = playerX + 3;
    }
   //moving left
    if (keyCode == LEFT)
    {        
      playerX = playerX - 3;
    }
  // after 20 seconds the screen goes to game over screen
    if (millis()> 20000)
    {
      screen = 2;
    }
  }
  //activating the game over screen
  if (screen == 2)
  {
    scene2.draw();
  }
}
//for the video
void movieEvent(Movie m) 
{
  m.read();
}
