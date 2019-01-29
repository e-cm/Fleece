
// if strips are grouped, space each one apart by this much
int offsetSpacing = 2;

// anchor vector for grouping
PVector direction = new PVector();

// renders all the LED strip trackers and the coloured rectangles that follow them
void displayTrackers(ledLine[] leds, int groupSize) {

  // create all the LED tracking strips  
  for (int i = 0; i < metersOfLeds; i += groupSize){
   
    // get the perpendicular vector of the anchor strip for each group
    if (leds[i].ledMode == "radial") direction = PVector.fromAngle(rotationValue(leds[i].ledMode, leds[i].rotateValueR, leds[i].rotateModeR, leds[i].speed, i));
    
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


// creates an LED tracking strip in the sketch
void create_strip(float x, float y, float rotation, float spacing, int index, String flipState) {
  
  if (flipState == "false") {
    opc.ledStrip(ledsPerStrip * index, ledsPerStrip, x, y, spacing, rotation, false);  // OPC_Class
  }
  
  else if (flipState == "edges") {
    if ((index) % 2 == 0) opc.ledStrip(ledsPerStrip * index, ledsPerStrip, x, y, spacing, rotation, false);  // OPC_Class
    else if ((index) % 2 == 1) opc.ledStrip(ledsPerStrip * index, ledsPerStrip, x, y, spacing, rotation, true);
  }
  
  else if (flipState == "center") {
    if ((index) % 2 == 0) opc.ledStrip(ledsPerStrip * index, ledsPerStrip, x, y, spacing, rotation, true);  // OPC_Class
    else if ((index) % 2 == 1) opc.ledStrip(ledsPerStrip * index, ledsPerStrip, x, y, spacing, rotation, false);
  }
}


// takes in the mode, rotation value and rotation mode, and index of an LED and then returns the selected calculation
float xValue(String mode, float rvX, String rmX, float speed, int groupSize, int index, int offset){
  
  float value = 0;
  
  switch (mode) {
    
    // vertical strips
    case "vertical":
    case "vertical-up":
    case "vertical-down":
      // indent by the margin, over by row spacing every other strip, step further by the offset if the strips are grouped, then move the group to the center of the space theywould occupy ungrouped
      value = edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2);
      break;
      
    case "vertical-left":
      value = edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvX);
      break;
    case "vertical-right":
      value = edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvX);
      break;
      
    // radial strips
    case "radial":
      value = width/2 + quarterWidth*cos(updateAngle((PI*index)/(metersOfLeds/2), rvX, rmX, speed)) + (offset * -direction.y * offsetSpacing);
      break;
      
    // tight square
    case "square":
      value = 2 * (index/2) + width*rvX;
      break;
      
    // mouse controlled test pattern
    case "test":
      value = 2 * (index/2) + mouseX - 16;
      break;
      
  }
  
  return value; 
}



// takes in the mode, rotation value and rotation mode, and index of an LED and then returns the selected calculation
float yValue(String mode, float rvY, String rmY, float speed, int groupSize, int index, int offset){
  
  float value = 0;
  
  switch (mode) {
    
    // vertical strips
    case "vertical":
    case "vertical-left":
    case "vertical-right":
      if ((index+offset) % 2 == 0) value = (height/2)-quarterWidth;
      else if ((index+offset) % 2 == 1) value = (height/2)+quarterWidth;
      break;
      
    // vertical strips travelling up
    case "vertical-up":
      if ((index+offset) % 2 == 0) value = (speed*-rvY) * (height/2)-quarterWidth;
      else if ((index+offset) % 2 == 1) value = (speed*-rvY) * (height/2)+quarterWidth;
      break;
      
    // vertical strips travelling down
    case "vertical-down":
      if ((index+offset) % 2 == 0) value = (speed*rvY) * (height/2)-quarterWidth;
      else if ((index+offset) % 2 == 1) value = (speed*rvY) * (height/2)+quarterWidth;
      break;
     
      
    // radial strips
    case "radial":
      value = height/2 + quarterWidth*sin(updateAngle((PI*index)/(metersOfLeds/2), rvY, rmY, speed)) + (offset * direction.x * offsetSpacing);
      break;
      
    // tight square
    case "square":
      if (index % 2 == 0) value = height/2 - metersOfLeds/2;
      else if (index % 2 == 1) value = height/2 + metersOfLeds/2;
      break;
      
    // mouse controlled test pattern
    case "test":
      if (index % 2 == 0) value = mouseY - metersOfLeds/2;
      else if (index % 2 == 1) value = mouseY + metersOfLeds/2;
      break;
      
  }

  return value;
}



// takes in the mode, rotation value and rotation mode, and index of an LED and then returns the selected calculation
float rotationValue(String mode, float rvR, String rmR, float speed, int index){
  
  float value = 0;
  
  switch (mode) {
    
    // vertical strips
    case "vertical":
    case "vertical-up":
    case "vertical-down":
    case "vertical-left":
    case "vertical-right":
      value = PI/2;
      break;
     
      
    // radial strips
    case "radial":
      value = updateAngle((PI*index)/(metersOfLeds/2), rvR, rmR, speed);
      break;
      
    // tight square
    case "square":
    case "test":
      value = PI/2;
      break;
      
  }
  
  return value; 
}



// switch between addition and multiplication of the "rotation" variables
float updateAngle(float base, float value, String mode, float speed) {

  if(mode.equals("multiply")) return(base * value);
  else return(base + value * speed);

}
