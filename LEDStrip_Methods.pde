int offsetSpacing = 2;

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
      value = edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvX);
      break;
    case "vertical-right":
      value = edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvX);
      break;
     
    // horizontal strips
    case "horizontal":
    case "horizontal-up":
    case "horizontal-down":
      if ((index+offset) % 2 == 0) value = ((width/2)-quarterWidth);
      else if ((index+offset) % 2 == 1) value = ((width/2)+quarterWidth);
      break;
      
    // horizontal strips
    case "horizontal-right":
      if ((index+offset) % 2 == 0) value = (speed*(width/2)*rvX-quarterWidth);
      else if ((index+offset) % 2 == 1) value = (speed*(width/2)*rvX+quarterWidth);
      break;
      
    // horizontal strips
    case "horizontal-left":
      if ((index+offset) % 2 == 0) value = (speed*(width/2)*-rvX-quarterWidth);
      else if ((index+offset) % 2 == 1) value = (speed*(width/2)*-rvX+quarterWidth);
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
      if ((index+offset) % 2 == 0) value = ((height/2)-quarterWidth);
      else if ((index+offset) % 2 == 1) value = ((height/2)+quarterWidth);
      break;
      
    // vertical strips travelling up
    case "vertical-up":
      if ((index+offset) % 2 == 0) value = (speed*(height/2)*-rvY-quarterWidth);
      else if ((index+offset) % 2 == 1) value = (speed*(height/2)*-rvY+quarterWidth);
      break;
      
    // vertical strips travelling down
    case "vertical-down":
      if ((index+offset) % 2 == 0) value = (speed*(height/2)*rvY-quarterWidth);
      else if ((index+offset) % 2 == 1) value = (speed*(height/2)*rvY+quarterWidth);
      break;
     
    // horizontal strips
    case "horizontal":
    case "horizontal-right":
    case "horizontal-left":
      // indent by the margin, over by row spacing every other strip, step further by the offset if the strips are grouped, then move the group to the center of the space theywould occupy ungrouped
      value = edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2);
      break;
      
    case "horizontal-up":
      value = edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvY);
      break;
      
    case "horizontal-down":
      value = edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvY);
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
      if (index % 2 == 0) value = (mouseY - metersOfLeds/2);
      else if (index % 2 == 1) value = (mouseY + metersOfLeds/2);
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
     
    // horizontal strips
    case "horizontal":
    case "horizontal-right":
    case "horizontal-left":
    case "horizontal-up":
    case "horizontal-down":
      value = 0;
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