// varaiables to hold the indexes of the the current and next image/video
int mediaFront = 0;
int mediaBack = 1;

// declare Movie objects that will hold the background videos
Movie vidFront;
Movie vidBack;

// declare PImage objects that will hold the background images
PImage imgFront;
PImage imgBack;

// variables used for changing background image
int opacMedia = 255;
boolean changing = false;
int changeSpeed = 2;

// arraylist that holds all the images/videos of the currently loaded package
ArrayList medias = new ArrayList();


// display the background media
void displayBackground() {
  
  // first, render the media that is next in queue
  tint(255, 255);
  if (medias.get(mediaBack) instanceof Movie) {
    image(vidBack, 0, 0, width, height);
  }
  else {
    imgBack = (PImage)medias.get(mediaBack);
    image(imgBack, 0, 0, width, height);
  }
  
  // then, display the current media on top of it
  tint(255, opacMedia); 
  if (medias.get(mediaFront) instanceof Movie) {
    image(vidFront, 0, 0, width, height);
  }
  else {
    imgFront = (PImage)medias.get(mediaFront);
    image(imgFront, 0, 0, width, height);
  }
  
  // fade to the next image/video while the "changing" variable is true
  if(changing) fadeTo();

}





// initiates the transiiton between the current background image/video and the next
void change() {
  
  // if the piece of media you're transitioning to is a video, start playing it;
  if (medias.get(mediaBack) instanceof Movie) {
    vidBack = (Movie)medias.get(mediaBack);
    vidBack.loop();
  }
  changing = true;
}





// fade between the current picture and the requested one
void fadeTo() {
  
  // fade to the back image at the requested speed
  opacMedia -= changeSpeed;
  
  // when the front image has completely faded away
  if (opacMedia <= 0) {
    
    // if the front piece of media was a video, stop playing it
    if (medias.get(mediaFront) instanceof Movie) {
      vidFront.stop();
    }
    
    // move to the next piece of media for both front and back
    mediaFront = ((mediaFront + 1) % medias.size());
    mediaBack = ((mediaBack + 1) % medias.size());
    
    // if either the new front or back is video, assign it to the appropriate variable
    if (medias.get(mediaFront) instanceof Movie) {
      vidFront = (Movie)medias.get(mediaFront);
    }
    if (medias.get(mediaBack) instanceof Movie) {
      vidBack = (Movie)medias.get(mediaBack);
    }
    
    // reset the opacity
    opacMedia = 255;
    
    // finishing transitioning
    changing = false; 
  }
}





// Called every time a new frame of video is available to read (renders the frame)
void movieEvent(Movie m) {
  m.read();
}
