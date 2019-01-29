// create some starting packages to be used in the sketch
void initPackages() {
    
  // the loading screen
  
  // initialize all LEDs
  // ledLine_Class
  for (int i = 0; i < metersOfLeds; i++) { 
    initLeds[i] = new ledLine("vertical", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*spinSpeed, color(0), "false"); 
  }

  String[] effects0 = {""};
  int media0 = loadingScreenIndex;
  
  // create the buffer screen
  display_package[0] = new visualPackage(0, 0, initLeds, media0, effects0, 2);
  
  createPackages();
  
  // initialize the display package
  display_package[1] = packages[(int)random(packages.length)];

}


// generate new packages
void createPackages() {
  int file = 0;
  taken.clear();
  for (int i = 0; i < packages.length; i++) {
    
    // depending on what type you're looking for, keep randomly picking an image/video until it's the proper type
    if (i < packages.length/3) {
      file = getBackground(1);
    }
    
    else if (i < 2*packages.length/3) {
      file = getBackground(2);
    }
    
    else if (i < packages.length) {
      file = getBackground(3);
    }
    
    // create a package with the selected background
    createOnePackage(file, i);
  }
  
}



void createOnePackage(int fileIndex, int index) {
  
  // get semi-random effects and led patterns
  String[] effects = getEffects(mediaNames[fileIndex]);
  
  int media = fileIndex;
  
  String ledStyle = getLedPattern(mediaNames[fileIndex]);
  for (int i = 0; i < metersOfLeds; i++) {
    switch(ledStyle) {
      
      case "vertical":
        initLeds[i] = new ledLine("vertical", "linear", "linear", "linear", ledSpacingNormal, spinSpeed, color(0), "false");
        break;
        
      case "vertical-up":
        initLeds[i] = new ledLine("vertical-up", "linear", "linear", "linear", ledSpacingNormal, spinSpeed, color(0), "false");
        break;
        
      case "vertical-down":
        initLeds[i] = new ledLine("vertical-down", "linear", "linear", "linear", ledSpacingNormal, spinSpeed, color(0), "false");
        break;
        
      case "vertical-left":
        initLeds[i] = new ledLine("vertical-left", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*spinSpeed, color(0), "false");
        break;
        
      case "vertical-right":
        initLeds[i] = new ledLine("vertical-right", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*spinSpeed, color(0), "false");
        break;
        
      case "vertical-weaved":
        if (i % 4 == 0 || i % 4 == 1) initLeds[i] = new ledLine("vertical-up", "linear", "linear", "linear", ledSpacingNormal, spinSpeed, color(0), "false");
        else if (i % 4 == 2 || i % 4 == 3) initLeds[i] = new ledLine("vertical-down", "linear", "linear", "linear", ledSpacingNormal, spinSpeed, color(0), "false");
        break;
        
      case "vertical-inwards":
        if (i < metersOfLeds/2) initLeds[i] = new ledLine("vertical-left", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*spinSpeed, color(0), "false");
        else initLeds[i] = new ledLine("vertical-right", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*spinSpeed, color(0), "false");
        break;
        
      case "vertical-outwards":
        if (i < metersOfLeds/2) initLeds[i] = new ledLine("vertical-right", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*spinSpeed, color(0), "false");
        else initLeds[i] = new ledLine("vertical-left", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*spinSpeed, color(0), "false");
        break;
        
      case "radial-edges":
        initLeds[i] = new ledLine("radial", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*2, color(0), "edges");
        break;
        
      case "radial-center":
        initLeds[i] = new ledLine("radial", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*2, color(0), "center");
        break;
        
      case "radial-inwards":
        if (i < metersOfLeds/2) initLeds[i] = new ledLine("radial", "linear", "linear", "linear", ledSpacingNormal, -spinSpeed*2, color(0), "center");
        else initLeds[i] = new ledLine("radial", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*2, color(0), "center");
        break;
        
      case "radial-outwards":
        if (i < metersOfLeds/2) initLeds[i] = new ledLine("radial", "linear", "linear", "linear", ledSpacingNormal, spinSpeed*2, color(0), "edges");
        else initLeds[i] = new ledLine("radial", "linear", "linear", "linear", ledSpacingNormal, -spinSpeed*2, color(0), "edges");
        break;
        
      case "radial-cycle":
        initLeds[i] = new ledLine("radial", "multiply", "multiply", "linear", ledSpacingNormal, spinSpeed*2, color(0), "false");
        break;
        
    }
  }

  // give it a type depending on its index
  if (index < packages.length/3) packages[index] = new visualPackage(index, 1, initLeds, media, effects, 2);
  else if (index < 2*packages.length/3) packages[index] = new visualPackage(index, 2, initLeds, media, effects, 2);
  else if (index < packages.length) packages[index] = new visualPackage(index, 3, initLeds, media, effects, 2);
  
}





// store the package you want to display into the "medias" Arraylist
void loadPackage(visualPackage pckg) {
  
  // reset the index counters of the array
  mediaFront = pckg.getMedia();
  
  // sets the reactive elements to be the correct colours for the background image/video
  pckg.setColours(mediaNames[mediaFront]);
  
  // if the first item in the array is a video, start playing it
  if (medias.size() >= 1 && medias.get(mediaFront) instanceof Movie) { 
    vidFront = (Movie)medias.get(mediaFront);
    vidFront.loop();
  }

}
