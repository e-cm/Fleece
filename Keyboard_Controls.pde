int songSelection = 0;

void keyPressed() {
  
  switch(key) {
  
    // change the LED grid to the mouse-controlled test pattern
    case 't':
      ledLine[] test = new ledLine[metersOfLeds];;
      for (int i = 0; i < metersOfLeds; i++ ) {
        test[i] = new ledLine("test", "linear", "linear", "linear", ledSpacingTight, spinSpeed, color(0), "false");
      }
      packages[2].setLeds(test);
      break;
    
    // cycle to the next background
    case 'n':
      change();
      break;
       
    // load the next song
    case 's':
      do {
        songSelection = ((songSelection + 1) % songs.length);
      } while (songs[songSelection] == null);
      
      songs[songSelection].start();
      break;
      
    // load the next package and change to it 
    case 'p':
      songs[songSelection].next();
  
  }


}

void mousePressed() {
  ampVocals(255);
}