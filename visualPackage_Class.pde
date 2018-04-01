
// class that holds all the components for a visualization
public class visualPackage {

  private ledLine[] led;
  private String[] backgroundMedia;
  private String[] effects; 
  private int groupSize;
  private int margin;
  
  // constructor
  visualPackage(ledLine[] l, String[] bgdMedia, String[] fx, int gs, int mrgn) {
  
    led = new ledLine[metersOfLeds];
    for (int i = 0; i < metersOfLeds; i++) {
      led[i] = l[i];
    }
    
    backgroundMedia = bgdMedia;
    
    effects = new String[fx.length];
    for(int i = 0; i < fx.length; i++) {
      effects[i] = fx[i];
    }
    
    groupSize = gs;
    margin = mrgn;
  
  }
  
  
  // getters and setters
  ledLine[] getLeds() {
    return led;
  }
  
  String[] getMedia() {
    return backgroundMedia;
  }
  
  String getMedia(int index) {
    return backgroundMedia[index];
  }
  
  String getEffect(int index) {
    return effects[index];
  }
  
  void setLeds(ledLine[] update) {
    led = update;
  }
  
  void setMedia(String[] update) {
    backgroundMedia = update;
  }
  
  void setEffects(String[] update) {
    effects = update;
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