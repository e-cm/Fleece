
// class that holds all the components for a visualization
public class visualPackage {

  private int index;
  private int type;
  private ledLine[] led;
  private int backgroundMedia;
  private String[] effects; 
  private int groupSize;
  
  // constructor
  visualPackage(int ind, int t, ledLine[] l, int bgdMedia, String[] fx, int gs) {
    
    index = ind;
    type = t;
  
    led = new ledLine[metersOfLeds];
    for (int i = 0; i < metersOfLeds; i++) {
      led[i] = l[i];
    }
    
    backgroundMedia = bgdMedia;
    
    effects = new String[fx.length];
    for(int i = 0; i < fx.length; i++) {
      effects[i] = fx[i];
    }
    
    groupSize = gs;;
  
  }
  
  
  void addMedia(String file) {
    String fileType = file.substring(file.length() - 3);
    if (fileType.equals("jpg") || fileType.equals("png")) medias.add(loadImage(file));
    else if (fileType.equals("mp4")) medias.add(new Movie(sketchPApplet, file));
  }
  
  
  // getters and setters
  int getIndex() {
    return index;
  }
  
  int getType() {
    return type;
  }
  
  ledLine[] getLeds() {
    return led;
  }
  
  int getMedia() {
    return backgroundMedia;
  }
  
  String getEffect(int index) {
    return effects[index];
  }
  
  void setLeds(ledLine[] update) {
    led = update;
  }
  
  void setMedia(int update) {
    backgroundMedia = update;
  }
  
  void setEffects(String[] update) {
    effects = update;
  }
  
  void setColours(String file) {
    
    file = file.substring(0, file.length() - 4);
    println(file);
  
    switch(file) {
    
      // lush
      case "1_image_02":
      case "1_image_04":
      case "1_video_01":
      case "1_video_04":
      case "2_image_01":
      case "2_image_04":
      case "2_video_12":
      case "3_image_02":
      case "3_video_02":
      case "3_video_04":
        vol = color(35,236,247); //aqua
        key = color(90,255,0); //green
        kic = color(255,255,0); //yellow
        gui = color(225,255,0); //lime
        break;
        
      // the blues
      case "1_image_05":
      case "1_video_02":
      case "1_video_07":
      case "2_video_04":
      case "2_video_07":
      case "2_video_10":
      case "2_video_11":
      case "2_video_17":
      case "3_video_01":
      case "3_video_06":
        vol = color(200,100,255); //purple
        key = color(231,22,255); //pink purple
        kic = color(175,255,255); //pale cyan
        gui = color(0,255,255); //cyan
        break;
        
      // heat
      case "1_image_03":
      case "1_image_08":
      case "1_image_09":
      case "2_video_06":
      case "2_video_08":
      case "2_video_13":
      case "2_video_16":
      case "3_video_03":
        vol = color(230,0,126); //magenta
        key = color(255,118,0); //orange
        kic = color(255,7,0); //red
        gui = color(255,7,0); //red
        break;
        
      // grayscale
      case "1_image_06":
      case "1_image_10":
      case "1_video_05":
      case "2_image_02":
      case "2_video_01":
      case "2_video_05":
      case "2_video_14":
      case "3_image_01":
      case "3_video_07":
      case "3_video_08":
      case "3_video_09":
        vol = color(195,195,195); //white
        key = color(215,215,215); //white
        kic = color(255,255,255); //white
        gui = color(235,235,235); //white
        break;
        
      // fleece
      case "1_image_01":
      case "1_image_07":
      case "1_video_08":
      case "2_image_03":
      case "2_video_02":
      case "2_video_03":
      case "2_video_15":
      case "3_video_05":
        vol = color(255,211,0); //yellow
        key = color(255,211,0); //yellow
        kic = color(50,0,209); //blue
        gui = color(255,0,0); //red
        break;
      
    
    }
  
  }
  
  
  void display() {
  
    // renders the background
    // Background_Methods
    displayBackground();
  
    // redners all background effects
    // Display_Methods
    for (int i = 0; i < effects.length; i++) {
      displayEffects(effects[i], led, groupSize);
    }
  
    // create all the LED tracking strips
    // Display_Methods
    displayTrackers(led, groupSize);
    
  }
  
}
