
// see StartUp_Variables for variables that will be used throughout the program

void setup()
{
  // variable to reference the sketch
  sketchPApplet = this;
  
  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  
  // start oscP5, listening for incoming messages at port 12000
  oscP5 = new OscP5(this,12000);
 
  
  // direct incoming Max data to specific methods
  // OSC_Methods
  oscP5.plug(this,"ampVocals","/vocals");
  oscP5.plug(this,"ampKeys","/keys");
  oscP5.plug(this,"ampGuitar","/guitar");
  oscP5.plug(this,"ampDrum","/drums");
  oscP5.plug(this,"songEnd","/end");
  oscP5.plug(this,"next","/next");

  
  
  // initialize some basic settings
  size(250, 250);
  frameRate(30);
  rectMode(CENTER);
  noStroke();
  
  // variables used for various effect
  for (int i = 0; i < randX.length; i++) {
    randX[i] = random(width);
    randY[i] = random(height);
    colour[i] = ceil(random(0,4));
    soupSize[i] = (int)random(0,3*width/40);
  }
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new PVector(width/2, height/2);
    pDirection[i] = new PVector(random(-1,1), random(-1,1));
  }
  
  
  
  // Load the names of all the image/video files in the "data" folder
  java.io.File data = new java.io.File(dataPath(""));
  mediaNames = data.list();
  
  // print out all the read files to council
  for (String s : mediaNames){
    println(s);
  }
  
  // preload all images/videos
  String fileType;
  for (int i = 0; i < mediaNames.length; i++) {
    fileType = mediaNames[i].substring(mediaNames[i].length() - 3);
    if (fileType.equals("jpg") || fileType.equals("png")) medias.add(loadImage(mediaNames[i]));
    else if (fileType.equals("mp4")) medias.add(new Movie(this, mediaNames[i]));
  }

  
  // Package_Creation
  // generates random packages for each type
  initPackages();
  
  // start on the loading screen
  loadPackage(display_package[0]);
}


// MAIN LOOP
void draw()
{
  
  // black background
  background(0);
  
  // display either the currentpackage or the laoding screen
  display_package[loadingSwitch].display();
  
  
}
