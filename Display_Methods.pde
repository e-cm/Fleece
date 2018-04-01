PVector direction = new PVector();

// renders all the LED strip trackers and the coloured rectangles that follow them
void displayTrackers(ledLine[] leds, int groupSize) {

  // create all the LED tracking strips  
  for (int i = 0; i < metersOfLeds; i += groupSize){
   
    direction = PVector.fromAngle(rotationValue(leds[i].ledMode, leds[i].rotateValueR, leds[i].rotateModeR, leds[i].speed, i));
    
    for (int j = 0; j < groupSize; j++) {
      create_strip(xValue(leds[i].ledMode, leds[i].rotateValueX, leds[i].rotateModeX, leds[i].speed, groupSize, i, j), 
                 yValue(leds[i].ledMode, leds[i].rotateValueY, leds[i].rotateModeY, leds[i].speed, groupSize, i, j), 
                 rotationValue(leds[i].ledMode, leds[i].rotateValueR, leds[i].rotateModeR, leds[i].speed, i), leds[i].ledSpacing, i + j, leds[i].flipState);
    }
    
    // updates the rotation value for X, Y, and R, depending on what mode each axis has been assigned
    // ledLine_Class
    leds[i].rotationUpdate(leds[i].rotateModeX, leds[i].rotateModeY, leds[i].rotateModeR);
  }

}


// renders all background effects 
void displayEffects(String mode, ledLine[] leds, int groupSize) {
  
  switch (mode) {
  
    case "colour_strips":
      // Effects_Methods
      displayStrips(leds, "colour", groupSize);
      break;
      
    case "black_strips":
      // Effects_Methods
      displayStrips(leds, "black", groupSize);
      break;
      
    case "bullseye":
      // Effects_Methods
      displayBullseye();
      break;
      
    case "waves":
      // Effects_Methods
      displayWave();
      break;
      
    case "soup":
      // Effects_Methods
      displaySoup();
      break;
  
  }

}