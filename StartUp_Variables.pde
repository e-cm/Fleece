import oscP5.*;
import netP5.*;
import processing.video.*;
import java.io.File;

// initilize width and height of the sketch
final int width = 500;
final int height = 500;

// holds the file names of all images/videos to be used
String[] mediaNames;

//declar OSC objects
OscP5 oscP5;
NetAddress procLoc;
NetAddress maxLoc;

// variables related to the LED placements
int metersOfLeds = 64;
int ledsPerStrip = 64;
float ledSpacingNormal = (float)height/(ledsPerStrip*2); //old spacing = 3.78125;
float ledSpacingTight = 1;
float edgeMargin = 1;
float rowSpacing = (width-edgeMargin*2) / (metersOfLeds/2 - 1);
float quarterWidth = (width)/4;  //(width-edgeMargin*2)/4;
int spinSpeed = 5;
int ColourStripWidth = 5;

// declare an OPC object
OPC opc;

// initialize an array to contain the details of each section of LEDs
ledLine[] initLeds = new ledLine[metersOfLeds];
visualPackage[] packages = new visualPackage[50];
Song[] songs = new Song[20];

color vol = color(166,25,46);
color vob = color(212,93,0);
color syn = color(113,153,73);
color gui = color(0,118,129);
color bas = color(100,38,103);
color kic = color(35,97,146);
color sna = color(255,205,0);
color cym = color(255,174,170);
color tom = color(241,134,111);