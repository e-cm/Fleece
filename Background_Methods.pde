// varaiable to hold the index of the the current image/video
int mediaFront = 0;

// Movie object that will hold the background video
Movie vidFront;

// PImage object that will hold the background image
PImage imgFront;

// variables used for changing background image
boolean changing = false;


// display the background media
void displayBackground() {
  
  // then, display the current media on top of it
  if (medias.get(mediaFront) instanceof Movie) {
    image(vidFront, 0, 0, width, height);
  }
  else {
    imgFront = (PImage)medias.get(mediaFront);
    image(imgFront, 0, 0, width, height);
  }

}


// initiates the transiiton between the current background image/video and the next
void change(int mode) {
  
  if (!changing) {   
      changing = true;
      switch(mode) {
      
        case 1:
          display_package[1] = packages[pseudoRandom(display_package[1].getIndex(), 0, packages.length/3 - 1)];
          break;
          
        case 2:
          display_package[1] = packages[pseudoRandom(display_package[1].getIndex(), packages.length/3, 2*packages.length/3 - 1)];
          break;
          
        case 3:
          display_package[1] = packages[pseudoRandom(display_package[1].getIndex(), 2*packages.length/3, packages.length - 1)];
          break;
      
      }
      
      // load the new package
      loadPackage(display_package[1]);     
      changing = false;
  }
  
}

// Called every time a new frame of video is available to read (renders the frame)
void movieEvent(Movie m) {
  m.read();
}
