float[] randX = new float[1000];
PVector[] particles = new PVector[200];
PVector[] pDirection = new PVector[200];
float[] randY = new float[1000];
int[] colour = new int[1000];
int[] soupSize = new int[1000];

float fn = 0;
float fm = 1000;



// renders all background effects 
void displayEffects(String mode, ledLine[] leds, int groupSize) {
  
  switch (mode) {
  
    case "colour_strips":
      // Effects_Methods
      displayStrips(leds, "colour", groupSize);
      break;
      
    case "colour_quad":
      // Effects_Methods
      displayStrips(leds, "colourQuad", groupSize);
      break;
      
    case "black_strips":
      // Effects_Methods
      displayStrips(leds, "black", groupSize);
      break;
      
    case "bullseye":
      // Effects_Methods
      displayBullseye();
      break;
      
    case "rain":
      // Effects_Methods
      displayRain();
      break;
      
    case "wave":
      // Effects_Methods
      displayWave();
      break;
      
    case "soup":
      // Effects_Methods
      displaySoup();
      break;
      
    case "space":
      // Effects_Methods
      displaySpace();
      break;
      
    case "banner":
      // Effects_Methods
      displayBanner();
      break;
      
    case "four":
      // Effects_Methods
      displayFour();
      break;
  
  }

}



// creates colour strips that follow the LED trackers
void displayStrips(ledLine[] leds, String colour, int groupSize) {
  
  // gradually decrease opacity over time;
  // OSC_Methods
  updateOpac();

  // create all the colour strips that follow the LED trackers  
  for (int i = 0; i < metersOfLeds; i += groupSize){

    // update the colours in accordance with amplitude data
    switch(leds[i].ledMode){
    
      default:
        switch(colour) {      
          case "colour":
            if (i < metersOfLeds/8) leds[i].colour = color(red(kic), green(kic), blue(kic), map(opacDrum,0,255,0,200));
            else if (i < metersOfLeds/4) leds[i].colour = color(red(gui), green(gui), blue(gui), map(opacGuitar,0,255,0,200));
            else if (i < 3*metersOfLeds/8) leds[i].colour = color(red(key), green(gui), blue(key), map(opacKeys,0,255,0,200));
            else if (i < metersOfLeds/2) leds[i].colour = color(red(vol), green(vol), blue(vol), map(opacVocals,0,255,0,200));
            else if (i < 5*metersOfLeds/8) leds[i].colour = color(red(vol), green(vol), blue(vol), map(opacVocals,0,255,0,200));
            else if (i < 3*metersOfLeds/4) leds[i].colour = color(red(key), green(gui), blue(key), map(opacKeys,0,255,0,200));
            else if (i < 7*metersOfLeds/8) leds[i].colour = color(red(gui), green(gui), blue(gui), map(opacGuitar,0,255,0,200));
            else if (i < metersOfLeds) leds[i].colour = color(red(kic), green(kic), blue(kic), map(opacDrum,0,255,0,200));
            break;
              
           case "colourQuad":
            if (i < metersOfLeds/8) leds[i].colour = color(red(kic), green(kic), blue(kic), map(opacGuitar,0,255,0,200));
            else if (i < metersOfLeds/4) leds[i].colour = color(red(gui), green(gui), blue(gui), map(opacGuitar,0,255,0,200));
            else if (i < 3*metersOfLeds/8) leds[i].colour = color(red(key), green(gui), blue(key), map(opacKeys,0,255,0,200));
            else if (i < metersOfLeds/2) leds[i].colour = color(red(vol), green(vol), blue(vol), map(opacKeys,0,255,0,200));
            else if (i < 5*metersOfLeds/8) leds[i].colour = color(red(vol), green(vol), blue(vol), map(opacVocals,0,255,0,200));
            else if (i < 3*metersOfLeds/4) leds[i].colour = color(red(key), green(gui), blue(key), map(opacVocals,0,255,0,200));
            else if (i < 7*metersOfLeds/8) leds[i].colour = color(red(gui), green(gui), blue(gui), map(opacDrum,0,255,0,200));
            else if (i < metersOfLeds) leds[i].colour = color(red(kic), green(kic), blue(kic), map(opacDrum,0,255,0,200));
            break;
            
          case "black":
            if (i < metersOfLeds/8) leds[i].colour = color(0, 255-opacGuitar);
            else if (i < metersOfLeds/4) leds[i].colour = color(0, 255-opacDrum);
            else if (i < 3*metersOfLeds/8) leds[i].colour = color(0, 255-opacKeys);
            else if (i < metersOfLeds/2) leds[i].colour = color(0, 255-opacVocals);
            else if (i < 5*metersOfLeds/8) leds[i].colour = color(0, 255-opacVocals);
            else if (i < 3*metersOfLeds/4) leds[i].colour = color(0, 255-opacKeys);
            else if (i < 7*metersOfLeds/8) leds[i].colour = color(0, 255-opacDrum);
            else if (i < metersOfLeds) leds[i].colour = color(0, 255-opacGuitar);
            break;
        }
      }

    
    // get the perpendicular vector of the anchor strip for each group
    if (leds[i].ledMode == "radial") direction = PVector.fromAngle(rotationValue(leds[i].ledMode, leds[i].rotateValueR, leds[i].rotateModeR, leds[i].speed, i));
    
    for (int j = 0; j < groupSize; j++) {
    
      // creates a coloured rectangle that will be underneath a tracking strip
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
    println();
      if ((index+offset) % 2 == 0) rect((width + ((edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvX)) % width)) % width, ((height/2)-(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      else if ((index+offset) % 2 == 1) rect((width + ((edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*rvX)) % width)) % width, ((height/2)+(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      break;
    case "vertical-right":
      if ((index+offset) % 2 == 0) rect((width + (edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvX) % width)) % width, ((height/2)-(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      else if ((index+offset) % 2 == 1) rect((width + (edgeMargin + rowSpacing*(index/2) + ((offset/2) * offsetSpacing) + ((rowSpacing-offsetSpacing) * groupSize/4 - rowSpacing/2)*(speed*speed*-rvX) % width)) % width, ((height/2)+(quarterWidth+1)), ColourStripWidth, (ledsPerStrip+0.5)*spacing);
      break;
      
    case "radial":
      pushMatrix();
      translate(x + offset * -direction.y * 2, abs(y + offset * direction.x * offsetSpacing - height));
      rotate(-rotation);
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
  
  // gradually decrease opacity over time;
  // OSC_Methods
  updateOpac();
  
  pushMatrix();
  translate(width/2, height/2);
  
  fill(kic, map(opacDrum,0,255,0,200));
  ellipse(0, 0, width, height);
  
  fill(key, map(opacKeys,0,255,0,200));
  ellipse(0, 0, 12*width/16, 12*height/16);
  
  fill(gui, map(opacGuitar,0,255,0,200));
  ellipse(0, 0, 8*width/16, 8*height/16);
  
  fill(vol, map(opacVocals,0,255,0,200));
  ellipse(0, 0, 4*width/16, 4*height/16);
  
  popMatrix();
}


// black wave on top and bottom of sketch
void displayWave() {
  float n;
  float m;
  for(int i = 0; i < width; i++){  
      stroke(0);
      n = noise(float(i)/(height-50),fn/100);
      n = map(n,0,1,150,height);
      line(i,height,i,n);
      
      m = noise(float(i)/(height-50),fm/100);
      m = map(m,0,1,0,100);
      line(i,0,i,m);
    }
  fn += 0.75;
  fm += 0.75;
  
  displaySpace();
}


// randomly distributed circles
void displaySoup() {
  
  // gradually decrease opacity over time;
  // OSC_Methods
  updateOpac();
  
  for (int i = 0; i < randX.length; i++) {
    switch (colour[i]) {
      case 1:
        fill(kic, map(opacDrum,0,255,0,200));
        break;
        
      case 2:
        fill(key, map(opacKeys,0,255,0,200));
        break;
        
      case 3:
        fill(gui, map(opacGuitar,0,255,0,200));
        break;
        
      case 4:
        fill(vol, map(opacVocals,0,255,0,200));
        break;
    }
    ellipse(randX[i], randY[i], soupSize[i], soupSize[i]);
  }
}

// densly coloured rectangle down the middle
void displayBanner() {
  
  // gradually decrease opacity over time;
  // OSC_Methods
  updateOpac();
  
  for (int i = 0; i < randX.length; i++) {
    switch (colour[i]) {
      case 1:
        fill(kic, map(opacDrum,0,255,0,200));
        break;
        
      case 2:
        fill(key, map(opacKeys,0,255,0,200));
        break;
        
      case 3:
        fill(gui, map(opacGuitar,0,255,0,200));
        break;
        
      case 4:
        fill(vol, map(opacVocals,0,255,0,200));
        break;
    }
    
      if (i % 10 == 0) rect(width/2, i*width/randX.length, 2*width/3, height/80);  
  }
}

// thin, angled rectangles
void displayRain() {
  
  // gradually decrease opacity over time;
  // OSC_Methods
  updateOpac();
  
  for (int i = 0; i < randX.length; i++) {
    switch (colour[i]) {
      case 1:
        fill(kic, opacDrum);
        break;
        
      case 2:
        fill(key, opacKeys);
        break;
        
      case 3:
        fill(gui, opacGuitar);
        break;
        
      case 4:
        fill(vol, opacVocals);
        break;
    }
    
      if (i % 5 == 0) {
        pushMatrix();
        translate(randX[i], randY[i]);
        rotate(4*PI/10);
        rect(0, 0, width/10, height/40);
        popMatrix();
      }
  }
}

// circles that shoot out from center of sketch
void displaySpace() {
  
  noStroke();
  
  // gradually decrease opacity over time;
  // OSC_Methods
  updateOpac();
  
  for (int i = 0; i < particles.length; i++) {
    switch (colour[i]) {
      case 1:
        fill(kic, opacDrum);
        break;
        
      case 2:
        fill(key, opacKeys);
        break;
        
      case 3:
        fill(gui, opacGuitar);
        break;
        
      case 4:
        fill(vol, opacVocals);
        break;
    }
    
    particles[i].add(pDirection[i]);
    if (particles[i].x > width || particles[i].x < 0 || particles[i].y > height || particles[i].y < 0) particles[i] = new PVector(width/2, height/2);
    ellipse(particles[i].x, particles[i].y, width/30, width/30);
  }
}


// four squares in quadrants
void displayFour() {
  
  // gradually decrease opacity over time;
  // OSC_Methods
  updateOpac();

  fill(kic, map(opacDrum,0,255,0,200));
  rect(width/4,height/4, width/2,height/2);
  
  fill(key, map(opacKeys,0,255,0,200));
  rect(3*width/4,height/4, width/2,height/2);
  
  fill(gui, map(opacGuitar,0,255,0,200));
  rect(3*width/4,3*height/4, width/2,height/2);
  
  fill(vol, map(opacVocals,0,255,0,200));
  rect(width/4,3*height/4, width/2,height/2);

}
