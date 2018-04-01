// create all the packaes to be used in the sketch
void createPackages() {
  
  // ------------------------------ package 1 ------------------------------
  
  // initialize all LEDs
  // ledLine_Class
  for (int i = 0; i < metersOfLeds; i++ ) {
    
    // required fields are as follows: (display mode for the strip, rotation mode of X, rotation mode of Y, rotation mode of Z, space between each LED in a strip, how fast the LED strips move, starting colour)
    if (i % 4 == 0 || i % 4 == 1) initLeds[i] = new ledLine("vertical-up", "linear", "linear", "linear", ledSpacingNormal, 1, color(0), "false");
    else if (i % 4 == 2 || i % 4 == 3) initLeds[i] = new ledLine("vertical-down", "linear", "linear", "linear", ledSpacingNormal, 1, color(0), "false");
  }

  // add the colour strip effect
  String[] effects = {"colour_strips"};
  String[] media = {mediaNames[4], mediaNames[3], mediaNames[2]};
  
  // create the package
  // visualPackage_class
  packages[0] = new visualPackage(initLeds, media, effects, 1, 1);
  
  
  // ------------------------------ package 2 ------------------------------
  
  // initialize all LEDs
  // ledLine_Class
  for (int i = 0; i < metersOfLeds; i++ ) {
    
    // required fields are as follows: (display mode for the strip, rotation mode of X, rotation mode of Y, rotation mode of Z, space between each LED in a strip, how fast the LED strips move, starting colour)
    initLeds[i] = new ledLine("vertical", "linear", "linear", "linear", ledSpacingNormal, spinSpeed, color(0), "false");
  }

  // add the colour strip effect
  String[] effects2 = {""};
  String[] media2 = {mediaNames[7], mediaNames[8], mediaNames[9], mediaNames[10], mediaNames[11], mediaNames[12], mediaNames[13], mediaNames[14], mediaNames[15], mediaNames[16], mediaNames[17], mediaNames[18], mediaNames[19], mediaNames[20], mediaNames[21]};
  
  // create the package
  // visualPackage_class
  packages[1] = new visualPackage(initLeds, media2, effects2, 1, 1);
  
  
  // ------------------------------ package 3 ------------------------------
  
  // initialize all LEDs
  // ledLine_Class
  for (int i = 0; i < metersOfLeds; i++ ) {
    
    // required fields are as follows: (display mode for the strip, rotation mode of X, rotation mode of Y, rotation mode of Z, space between each LED in a strip, how fast the LED strips move, starting colour)
    initLeds[i] = new ledLine("vertical", "linear", "linear", "linear", ledSpacingNormal, spinSpeed, color(0), "false");
  }

  // add the colour strip effect
  String[] effects3 = {"black_strips"};
  String[] media3 = {mediaNames[6], mediaNames[0]};
  
  // create the package
  // visualPackage_class
  packages[2] = new visualPackage(initLeds, media3, effects3, 8, 25);
  
  
  // ------------------------------ package 4 (rain) ------------------------------
  
  // initialize all LEDs
  // ledLine_Class
  float randomSpeed = 0;
  for (int i = 0; i < metersOfLeds; i++ ) {
    
    if (i % 2 == 0) randomSpeed = random(0.5,50);
    // required fields are as follows: (display mode for the strip, rotation mode of X, rotation mode of Y, rotation mode of Z, space between each LED in a strip, how fast the LED strips move, starting colour)
    initLeds[i] = new ledLine("vertical-down", "linear", "linear", "linear", ledSpacingNormal, randomSpeed, color(0), "false");
  }

  // add the colour strip effect
  String[] effects4 = {""};
  String[] media4 = {mediaNames[0], mediaNames[12]};
  
  // create the package
  // visualPackage_class
  packages[3] = new visualPackage(initLeds, media4, effects4, 1, 1);
  
  
  // ------------------------------ package 5 (black strips) ------------------------------
  
  // initialize all LEDs
  // ledLine_Class
  for (int i = 0; i < metersOfLeds; i++ ) {
    
    // required fields are as follows: (display mode for the strip, rotation mode of X, rotation mode of Y, rotation mode of Z, space between each LED in a strip, how fast the LED strips move, starting colour)
    initLeds[i] = new ledLine("radial", "linear", "linear", "linear", ledSpacingNormal, spinSpeed, color(0), "false");
  }

  // add the colour strip effect
  String[] effects5 = {"black_strips"};
  String[] media5 = {mediaNames[12], mediaNames[0], mediaNames[4]};
  
  // create the package
  // visualPackage_class
  packages[4] = new visualPackage(initLeds, media5, effects5, 4, 1);
    
}


void createSongs() {
  
  // ------------------------------ song 1 ------------------------------
  visualPackage[] vp = new visualPackage[1];
  vp[0] = packages[2];
  songs[0] = new Song("first song", vp);
  
  //loading all the packages on startup enables faster transitions later
  //for (int i = 0; i < vp.length; i++) {
  // loadPackage(vp[i]);
  //}
  
  
  // ------------------------------ song 2 ------------------------------
  vp = new visualPackage[2];
  vp[0] = packages[2];
  vp[1] = packages[3];
  songs[1] = new Song("second song", vp);
  
  // loading all the packages on startup enables faster transitions later
  for (int i = 0; i < vp.length; i++) {
    loadPackage(vp[i]);
  }
}





// store the package you want to display into the "medias" Arraylist
void loadPackage(visualPackage pckg) {
  
  edgeMargin = pckg.margin;
  rowSpacing = (width-edgeMargin*2) / (metersOfLeds/2 - 1);
  
  // clear out whatever package is currently loaded into the array
  medias.clear();
  
  // reset the index counters of the array
  mediaFront = 0;
  mediaBack = 1;
  
  // add the images and videos from the new package to the array
  String fileType;
  for (int i = 0; i < pckg.getMedia().length; i++) {
    fileType = pckg.getMedia(i).substring(pckg.getMedia(i).length() - 3);
    if (fileType.equals("jpg")) medias.add(loadImage(pckg.getMedia(i)));
    else if (fileType.equals("mp4")) medias.add(new Movie(this, pckg.getMedia(i)));
  }

  // if the first item in the array is a video, start playing it
  if (medias.get(mediaFront) instanceof Movie) { 
    vidFront = (Movie)medias.get(mediaFront);
    vidFront.loop();
  }
  
  // if the second item is a video, assign the vidBack variable to it
  if (medias.get(mediaBack) instanceof Movie) { 
    vidBack = (Movie)medias.get(mediaBack);
  }

}