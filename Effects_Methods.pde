float[] randX = new float[1000];
float[] randY = new float[1000];
int[] colour = new int[1000];
int[] soupSize = new int[1000];

// creates colour strips that follow the LED trackers
void displayStrips(ledLine[] leds, String colour, int groupSize) {
  
  // gradually decrease opacity over time;
  // OSC_Methods
  updateOpac();

  // create all the colour strips that follow the LED trackers  
  for (int i = 0; i < metersOfLeds; i += groupSize){

    // update the colours in accordance with amplitude data
    switch(leds[i].ledMode){
    
      case "vertical":
      case "vertical-up":
      case "vertical-down":
      case "horizontal":
      case "horizontal-right":
      case "horizontal-left":
      case "radial":
      case "square":
        switch(colour) {      
          case "colour":
            if (i < metersOfLeds/8) leds[i].colour = color(red(kic), green(kic), blue(kic), opacKick);
            else if (i < metersOfLeds/4) leds[i].colour = color(red(vol), green(vob), blue(vol), opacLeadVocals);
            else if (i < 3*metersOfLeds/8) leds[i].colour = color(red(syn), green(syn), blue(syn), opacKeys);
            else if (i < metersOfLeds/2) leds[i].colour = color(red(sna), green(sna), blue(sna), opacSnare);
            else if (i < 5*metersOfLeds/8) leds[i].colour = color(red(sna), green(sna), blue(sna), opacSnare);
            else if (i < 3*metersOfLeds/4) leds[i].colour = color(red(syn), green(syn), blue(syn), opacKeys);
            else if (i < 7*metersOfLeds/8) leds[i].colour = color(red(vol), green(vob), blue(vol), opacLeadVocals);
            else if (i < metersOfLeds) leds[i].colour = color(red(kic), green(kic), blue(kic), opacKick);
            break;
              
          case "black":
            if (i < metersOfLeds/8) leds[i].colour = color(0, 255-opacKick);
            else if (i < metersOfLeds/4) leds[i].colour = color(0, 255-opacLeadVocals);
            else if (i < 3*metersOfLeds/8) leds[i].colour = color(0, 255-opacKeys);
            else if (i < metersOfLeds/2) leds[i].colour = color(0, 255-opacSnare);
            else if (i < 5*metersOfLeds/8) leds[i].colour = color(0, 255-opacSnare);
            else if (i < 3*metersOfLeds/4) leds[i].colour = color(0, 255-opacKeys);
            else if (i < 7*metersOfLeds/8) leds[i].colour = color(0, 255-opacLeadVocals);
            else if (i < metersOfLeds) leds[i].colour = color(0, 255-opacKick);
            break;
        }
      }

    
    
    direction = PVector.fromAngle(rotationValue(leds[i].ledMode, leds[i].rotateValueR, leds[i].rotateModeR, leds[i].speed, i));
    
    for (int j = 0; j < groupSize; j++) {
    
      // creates a coloured rectangle that will be underneath a tracking strip
      // ColourStrip_Methods
      create_rectangle(width/2 + quarterWidth*cos(updateAngle((PI*i)/(metersOfLeds/2), leds[i].rotateValueX, leds[i].rotateModeX, leds[i].speed)), 
                       height/2 + quarterWidth*sin(updateAngle((PI*i)/(metersOfLeds/2), leds[i].rotateValueY, leds[i].rotateModeY, leds[i].speed)), 
                       updateAngle((PI*i)/(metersOfLeds/2), leds[i].rotateValueR, leds[i].rotateModeR, leds[i].speed), 
                       leds[i].ledSpacing, leds[i].rotateValueX, leds[i].rotateValueY,leds[i].speed, groupSize, i, j, leds[i].ledMode, leds[i].colour, leds);
    }                                     
  }
}

// creates a coloured rectangle to go under and LED tracker
void create_rectangle(float x, float y, float rotation, float spacing, float rvX, float rvY, float speed, int groupSize, int index, int offset, String mode, color fill, ledLine[] leds) {
  
  fill(fill);
  
  switch (mode) {
  
    case "vertical":
    case "vertical-up":
    case "vertical-down":
      if ((index+offset) % 2 == 0) rect(edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2), ((height/2)-(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      else if ((index+offset) % 2 == 1) rect(edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2), ((height/2)+(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      break;
      
    case "vertical-left":
      if ((index+offset) % 2 == 0) rect((edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvX)) % width, ((height/2)-(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      else if ((index+offset) % 2 == 1) rect((edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvX)) % width, ((height/2)+(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      break;
    case "vertical-right":
      if ((index+offset) % 2 == 0) rect((width + (edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvX) % width)) % width, ((height/2)-(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      else if ((index+offset) % 2 == 1) rect((width + (edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvX) % width)) % width, ((height/2)+(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      break;
      
      
    case "horizontal":
    case "horizontal-right":
    case "horizontal-left":
      if ((index+offset) % 2 == 0) rect(((width/2)-(quarterWidth+1)), rowSpacing*(index/2) + edgeMargin + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2), (ledsPerStrip+0.5)*spacing, ColourStripWidth);
      else if ((index+offset) % 2 == 1) rect(((width/2)+(quarterWidth+1)), rowSpacing*(index/2) + edgeMargin + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2), (ledsPerStrip+0.5)*spacing, ColourStripWidth);
      break;
      
    case "horizontal-up":
      if ((index+offset) % 2 == 0) rect(((width/2)-(quarterWidth+1)), (edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvY)) % height, (ledsPerStrip+0.5)*spacing, ColourStripWidth);
      else if ((index+offset) % 2 == 1) rect(((width/2)+(quarterWidth+1)), (edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvY)) % height, (ledsPerStrip+0.5)*spacing, ColourStripWidth);
      break;
      
    case "horizontal-down":
      if ((index+offset) % 2 == 0) rect(((width/2)-(quarterWidth+1)), (height + (edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvY) % height)) % height, (ledsPerStrip+0.5)*spacing, ColourStripWidth);
      else if ((index+offset) % 2 == 1) rect(((width/2)+(quarterWidth+1)), (height + (edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvY) % height)) % height, (ledsPerStrip+0.5)*spacing, ColourStripWidth);
      break;
      
    case "radial":
      pushMatrix();
      translate(x + offset * -direction.y * 2, y + offset * direction.x * offsetSpacing);
      rotate(rotation);
      rect(0, 0, spacing * (ledsPerStrip+0.5), ColourStripWidth);
      popMatrix();
      break;
      
    case "square":
      if (index % 2 == 0) rect(((2 * (index/2) + width*leds[index].rotateValueX) % width), height/2 - 32, ColourStripWidth, spacing * (ledsPerStrip+0.5));
      else if (index % 2 == 1) rect(((2 * (index/2) + width*leds[index].rotateValueX) % width), height/2 + 32, ColourStripWidth, spacing * (ledsPerStrip+0.5));
      break;
      
    default:
      break;
  }
 
}


// creates a bullseye composed of the different instruments opacities
void displayBullseye() {
  pushMatrix();
  translate(width/2, height/2);
  
  fill(kic, opacKick);
  ellipse(0, 0, width, height);
  
  fill(syn, opacKeys);
  ellipse(0, 0, 12*width/16, 12*height/16);
  
  fill(sna, opacSnare);
  ellipse(0, 0, 8*width/16, 8*height/16);
  
  fill(vol, opacLeadVocals);
  ellipse(0, 0, 4*width/16, 4*height/16);
  
  popMatrix();
}



void displayWave() {

}

void displaySoup() {
  for (int i = 0; i < randX.length; i++) {
    switch (colour[i]) {
      case 1:
        fill(kic, opacKick);
        break;
        
      case 2:
        fill(syn, opacKeys);
        break;
        
      case 3:
        fill(sna, opacSnare);
        break;
        
      case 4:
        fill(vol, opacLeadVocals);
        break;
    }
    ellipse(randX[i], randY[i], soupSize[i], soupSize[i]);
  }
}