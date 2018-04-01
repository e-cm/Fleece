float ceilingVoc = 0;
float ceilingKey = 0;
float ceilingGui = 0;
float ceilingKic = 0;
float ceilingSna = 0;

// variables used for MIDI controlled opacities
float opacLeadVocals = 0;
float opacBackVocals = 0;
float opacKeys = 0;
float opacGuitar = 0;
float opacBass = 0;
float opacKick = 0;
float opacSnare = 0;
float opacCymbals = 0;
float opacToms = 0;

int decrement = 3;
int scalar = 1300;

// lead vocals
void ampVocals(float amp) {
  //if (amp*scalar > ceilingVoc) ceilingVoc = amp*scalar;
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
void ampKick(float amp) {
  if (amp > ceilingKic) ceilingKic = amp;
}
// snare
void ampSnare(float amp) {
  if (amp > ceilingSna) ceilingSna = amp;
}

void updateOpac() {
  ceilingVoc -= decrement;
  ceilingKey -= decrement;
  ceilingGui -= decrement;
  ceilingKic -= decrement;
  ceilingSna -= decrement;
  opacLeadVocals = ceilingVoc;
  opacKeys = ceilingKey;
  opacGuitar = ceilingGui;
  opacKick = ceilingKic;
  opacSnare = ceilingSna;
}
