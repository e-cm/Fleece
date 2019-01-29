import oscP5.*;
import netP5.*;
import processing.video.*;
import java.io.File;

PApplet sketchPApplet;

// initilize width and height of the sketch
final int width = 250;
final int height = 250;

//declar OSC objects
OscP5 oscP5;

// variables related to the LED placements
int metersOfLeds = 64;
int ledsPerStrip = 64;
float ledSpacingNormal = (float)height/(ledsPerStrip*2);
float ledSpacingTight = 1;
float edgeMargin = 1;
float rowSpacing = (width-edgeMargin*2) / (metersOfLeds/2 - 1);
float quarterWidth = (width)/4;
int spinSpeed = 5;
int ColourStripWidth = 5;

// declare an OPC object
OPC opc;

// holds the file names of all images/videos to be used
String[] mediaNames;

// arraylist that holds all the images/videos of the currently loaded package
ArrayList medias = new ArrayList();

// initialize an array to contain the details of each section of LEDs
ledLine[] initLeds = new ledLine[metersOfLeds];

// used to turn on the loading screen between songs
int loadingSwitch = 0;

// the index of the image/video you want to use as the lading screen
int loadingScreenIndex = 1;

// the maximum number of packages to be used in any given song
visualPackage[] packages = new visualPackage[30];

// always contain the loading screen and the current package to display
visualPackage[] display_package = new visualPackage[2];

// initialize the colours related to each instrument
color vol = color(166,25,46); //red
color key = color(0,255,255); //aqua
color kic = color(235,97,146); //pink
color gui = color(255,205,0); //yellow
