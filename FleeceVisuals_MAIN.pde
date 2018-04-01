
// see StartUp_Variables for variables that will be used throughout the program

void setup()
{
  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  
  // start oscP5, listening for incoming messages at port 12000
  oscP5 = new OscP5(this,12000);
 
  
  // direct incoming Max data to specific methods
  // OSC_Methods
  oscP5.plug(this,"ampVocals","/vol");
  oscP5.plug(this,"ampKeys","/key");
  oscP5.plug(this,"ampGuitar","/gui");
  oscP5.plug(this,"ampKick","/kic");
  oscP5.plug(this,"ampSnare","/sna");

  
  
  // initialize some basic settings
  size(500, 500);
  frameRate(30);
  rectMode(CENTER);
  noStroke();
  
  for (int i = 0; i < randX.length; i++) {
    randX[i] = random(width);
    randY[i] = random(height);
    colour[i] = (int)random(0,5);
    soupSize[i] = (int)random(0,50);
  }
  
  // Load the names of all the image/video files in the "data" folder
  java.io.File data = new java.io.File(dataPath(""));
  mediaNames = data.list();
  for (String s : mediaNames){
    println(s);
  }

  
  // All_Packages
  createPackages();
  createSongs();
  
  songs[0].start();
}


// MAIN LOOP
void draw()
{
  
  // black background
  background(0);
  
  // display the selected song
  // song_Class
  songs[songSelection].display();
  
  fill(0,255,255);
  text(frameRate, 10, 10);
  
}