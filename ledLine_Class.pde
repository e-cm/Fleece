
// class to create a strip of LED trackers
public class ledLine {
  
  // variables contained in an ledLine object
  private String ledMode;
  private float rotateValueX;
  private float rotateValueY;
  private float rotateValueR;
  private String rotateModeX;
  private String rotateModeY;
  private String rotateModeR; 
  private float ledSpacing;
  private float speed;
  private color colour;
  private String flipState;
  
  // constructor for an object that contains all the needed variables for placing an LED strip in the sketch
  ledLine(String mode, String rmX, String rmY, String rmR, float spc, float s, color c, String fs){
    ledMode = mode;
    rotateValueX = 1;
    rotateValueY = 1;
    rotateValueR = 1;
    rotateModeX = rmX;
    rotateModeY = rmY;
    rotateModeR = rmR;
    ledSpacing = spc;
    speed = s;
    colour = c;
    flipState = fs;
  }
  

  // updates the rotation values for an ledLine object, depending on what mode each axis is in (X, Y, and R)
  void rotationUpdate(String mX, String mY, String mR) {
    if (mX.equals("none")){
      rotateValueX = 1;
    }
    else if (mX.equals("linear") || mX.equals("multiply")){
      rotateValueX = (frameCount*0.001);
    }
  
  
    if (mY.equals("none")){
      rotateValueY = 1;
    }
    else if (mY.equals("linear") || mX.equals("multiply")){
      rotateValueY = (frameCount*0.001);
    }
  
  
    if (mR.equals("none")){
      rotateValueR = 1;
    }
    else if (mR.equals("linear") || mX.equals("multiply")){
      rotateValueR = (frameCount*0.001);
    }
  }
  
  
}