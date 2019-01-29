float ceilingVoc = 0;
float ceilingKey = 0;
float ceilingGui = 0;
float ceilingDru = 0;

// variables used for MIDI controlled opacities
float opacVocals = 0;
float opacKeys = 0;
float opacGuitar = 0;
float opacDrum = 0;

int decrement = 5;


// lead vocals
void ampVocals(float amp) {
  if (amp > ceilingVoc) ceilingVoc = amp;
}
// keyboard
void ampKeys(float amp) {
  if (amp > ceilingKey) ceilingKey = amp;
}
// guitar
void ampGuitar(float amp) {
  if (amp > ceilingGui) ceilingGui = amp;
}
// kick
void ampDrum(float amp) {
  if (amp > ceilingDru) ceilingDru = amp;
}

void updateOpac() {
  
  ceilingVoc -= decrement;
  ceilingKey -= decrement;
  ceilingGui -= decrement;
  ceilingDru -= decrement*2;
  
  opacVocals = ceilingVoc;
  opacKeys = ceilingKey;
  opacGuitar = ceilingGui;
  opacDrum = ceilingDru;
}







void songEnd(int bye) {

  // switch to the the loading screen
  loadingSwitch = 0;
  loadPackage(display_package[loadingSwitch]);
  
  // generate new packages
  createPackages();

}


void next(int mode) {
  change(mode);
  if (loadingSwitch == 0) loadingSwitch = 1;
}
