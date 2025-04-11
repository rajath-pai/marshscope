import ddf.minim.*;      // for audio

import gifAnimation.*;  // for GIFs

PImage background, screenImage;

Gif screenGif;

Gif[] screenGifSet = new Gif[20];

String screen, nextScreen, prevScreen;

int level;

boolean changeScreen, nextScreenIsSet, exitOverlayActive;

AudioPlayer ambient; // marsh song

Minim songLoading;

void setup() {
  // size(1512, 982); //set canvas size
  
  fullScreen();

  imageMode(CENTER); //the image coordiantes are based on the center not the corner
  
  //load sounds
  songLoading = new Minim(this);
  // ambient = songLoading.loadFile("audios/marsh_sounds.mp3"); // load background music
  ambient = songLoading.loadFile("audios/marsh_sounds_long.mp3"); // load background music
  
  screen = "entry-screen"; //set up intro screen to start
  // screen = "act-one-scene-four-chunk-six-end"; //set up intro screen to start
  
  changeScreen = false;
  
  nextScreenIsSet = false;
  
  exitOverlayActive = false;
  
  /* GIF set */
  // Chunk 2
  screenGifSet[0] = new Gif(this, getImagePath("A1 S1 - Chunk 2 p1", "gif", 2));
  screenGifSet[1] = new Gif(this, getImagePath("A1 S1 - Chunk 2 p3", "gif", 2));
  screenGifSet[2] = new Gif(this, getImagePath("A1 S1 - Chunk 2 p4", "gif", 2));
  
  // Chunk 3
  screenGifSet[3] = new Gif(this, getImagePath("A1 S2 - Chunk 3 p1", "gif", 3));
  screenGifSet[4] = new Gif(this, getImagePath("A1 S2 - Chunk 3 p2", "gif", 3));
  
  // Chunk 4
  screenGifSet[5] = new Gif(this, getImagePath("A1 S3 - Chunk 4 p2", "gif", 4));
  screenGifSet[6] = new Gif(this, getImagePath("A1 S3 - Chunk 4 p3", "gif", 4));
  
  // Chunk 5
  screenGifSet[7] = new Gif(this, getImagePath("A1 S4 - Chunk 5 p1", "gif", 5));
  
  // Chunk 6.1
  screenGifSet[8] = new Gif(this, getImagePath("A1 S4 - Chunk 6.1 p1", "gif", 6));
  
  // Chunk 6.2
  screenGifSet[9] = new Gif(this, getImagePath("A1 S4 - Chunk 6.2 p2", "gif", 6));
  
  // Chunk 7
  screenGifSet[10] = new Gif(this, getImagePath("A1 S4 - Chunk 7 p2", "gif", 7));
  
  // Chunk 8
  screenGifSet[11] = new Gif(this, getImagePath("A1 S4 - Chunk 8 p2", "gif", 8));  
  
  // Chunk 9
  screenGifSet[12] = new Gif(this, getImagePath("A2 S1 - Chunk 9 p2", "gif", 9));
  screenGifSet[13] = new Gif(this, getImagePath("A2 S1 - Chunk 9 p5", "gif", 9));
  
  // Chunk 9.1
  screenGifSet[14] = new Gif(this, getImagePath("A2 S1 - Chunk 9.1 p1", "gif", 9));
  screenGifSet[15] = new Gif(this, getImagePath("A2 S1 - Chunk 9.1 post-transition screen", "gif", 9));
  
  // Chunk 9.2
  screenGifSet[16] = new Gif(this, getImagePath("A2 S1 - Chunk 9.2 p1", "gif", 9));
  screenGifSet[17] = new Gif(this, getImagePath("A2 S1 - Chunk 9.2 p2", "gif", 9));
  
  // Chunk 10
  screenGifSet[18] = new Gif(this, getImagePath("A3 S1 - Chunk 10 p1", "gif", 10));
  
  // Chunk 10.1
  screenGifSet[19] = new Gif(this, getImagePath("A3 S1 - Chunk 10.1 p1", "gif", 10));
  
}

void draw() {
  // println("STARTING...", screen, nextScreen);
  
  // loop background music
  if (!ambient.isPlaying()) {
    ambient.rewind();
    ambient.play();
  }
  
  switch(screen) {
  case "entry-screen":
    background(#FFFFFF);
    screenImage = getImage("Entry screen", -1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      println("Key pressed");
      if (key == 'G' || key == 'g') {
         nextScreen = "act-one-scene-one-page-zero";
         nextScreenIsSet = true;
      }
    } else {
      println("Key NOT pressed!");
    }
    break;
    
  //------ACT ONE CODE------  
  case "act-one-scene-one-page-zero":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 1 p0", 1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-one-page-one":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 1 p1", 1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-page-two";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-one-page-two":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 1 p2", 1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-one-page-three":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 1 p3", 1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-page-four";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-one-page-four":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 1 p4", 1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-chunk-one-end";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-page-three";
         nextScreenIsSet = true;
      }
    }
    break;

 case "act-one-scene-one-chunk-one-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 1 post-transition screen", 1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-chunk-two-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-page-four";
         nextScreenIsSet = true;
      }
    }
    break;
    
 case "act-one-scene-one-chunk-two-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[0]; // A1 S1 - Chunk 2 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-chunk-two-page-two";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-chunk-one-end";
         nextScreenIsSet = true;
      }
    }
    break;

 case "act-one-scene-one-chunk-two-page-two":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 2 p2", 2);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-chunk-two-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-chunk-two-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
 case "act-one-scene-one-chunk-two-page-three":
    background(#FFFFFF);
    screenGif = screenGifSet[1]; // A1 S1 - Chunk 2 p3
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-chunk-two-page-four";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-chunk-two-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
 
 case "act-one-scene-one-chunk-two-page-four":
    background(#FFFFFF);
    screenGif = screenGifSet[2]; // A1 S1 - Chunk 2 p4
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-chunk-two-page-five";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-chunk-two-page-three";
         nextScreenIsSet = true;
      }
    }
    break;
    
 case "act-one-scene-one-chunk-two-page-five":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 2 p5", 2);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-chunk-two-end";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-chunk-two-page-four";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-one-chunk-two-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 2 post-transition screen", 2);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-two-chunk-three-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-chunk-two-page-five";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-two-chunk-three-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[3]; // A1 S2 - Chunk 3 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-two-chunk-three-page-two";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-one-chunk-two-end";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-two-chunk-three-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[4]; // A1 S2 - Chunk 3 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-two-chunk-three-end";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-two-chunk-three-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-two-chunk-three-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S2 - Chunk 3 post-transition screen", 3);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-page-zero";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-two-chunk-three-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-three-chunk-four-page-zero":
    background(#FFFFFF);
    screenImage = getImage("A1 S3 - Chunk 4 p0", 4);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         // nextScreen = "act-one-scene-three-chunk-four-page-one";
         nextScreen = "act-one-scene-three-chunk-four-page-two";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-two-chunk-three-end";
         nextScreenIsSet = true;
      }
    }
    break;
    
  /*
  case "act-one-scene-three-chunk-four-page-one":
    background(#FFFFFF);
    screenImage = getImage("A1 S3 - Chunk 4 p1", 4);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-page-two";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-three-chunk-four-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
  */
   
  case "act-one-scene-three-chunk-four-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[5]; // A1 S3 - Chunk 4 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         //nextScreen = "act-one-scene-three-chunk-four-page-one";
         nextScreen = "act-one-scene-three-chunk-four-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-three-chunk-four-page-three":
    background(#FFFFFF);
    screenGif = screenGifSet[6]; // A1 S3 - Chunk 4 p3
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-page-four";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-three-chunk-four-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-three-chunk-four-page-four":
    background(#FFFFFF);
    screenImage = getImage("A1 S3 - Chunk 4 p4", 4);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-end";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-three-chunk-four-page-three";
         nextScreenIsSet = true;
      }
    }
    break;
  
  case "act-one-scene-three-chunk-four-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S3 - Chunk 4 post-transition screen", 4);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         //nextScreen = "act-one-scene-four-chunk-five-page-zero";
         nextScreen = "act-one-scene-four-chunk-five-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-three-chunk-four-page-four";
         nextScreenIsSet = true;
      }
    }
    break;

  case "act-one-scene-four-chunk-five-page-zero":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 5 p0", 5);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-five-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-three-chunk-four-end";
         nextScreenIsSet = true;
      }
    }
    break;

  case "act-one-scene-four-chunk-five-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[7]; // A1 S4 - Chunk 5 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-five-page-two";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-three-chunk-four-end";
         // nextScreen = "act-one-scene-four-chunk-five-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;

  case "act-one-scene-four-chunk-five-page-two":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 5 p2", 5);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-five-end";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-four-chunk-five-page-one";
         nextScreenIsSet = true;
      }
    }
    break;

  // FIRST SITE OF CHOICE
  case "act-one-scene-four-chunk-five-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 5 post-transition screen", 5);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
         nextScreen = "act-one-scene-four-chunk-eight-page-one";
         nextScreenIsSet = true;
      } else if (key == 'S' || key == 's') {
         nextScreen = "act-one-scene-four-chunk-six-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-four-chunk-five-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-four-chunk-six-page-one":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 6 p1", 6);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-six-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
 
 case "act-one-scene-four-chunk-six-page-two":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 6 p2", 6);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-six-end";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-four-chunk-six-page-one";
         nextScreenIsSet = true;
      }
    }
    break;

  // SECOND SITE OF CHOICE
  case "act-one-scene-four-chunk-six-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 6 post-transition screen", 6);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
         int r = int(random(200));
         if (r % 2 == 0) {
            nextScreen = "act-one-scene-four-chunk-six-point-one-page-one";
         } else {
            nextScreen = "act-one-scene-four-chunk-six-point-two-page-one";
         }
         nextScreenIsSet = true;
      } else if (key == 'S' || key == 's') {
         nextScreen = "act-one-scene-four-chunk-seven-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {  // Back to FIRST SITE OF CHOICE
         nextScreen = "act-one-scene-four-chunk-five-end";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // COIN FLIP - VARIATION ONE
  case "act-one-scene-four-chunk-six-point-one-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[8]; // A1 S4 - Chunk 6.1 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-six-point-one-page-two";
         nextScreenIsSet = true;
      }
    }
    break;

  case "act-one-scene-four-chunk-six-point-one-page-two":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 6.1 p2", 6);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-end-scene";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {  // Back to SECOND SITE OF CHOICE
         nextScreen = "act-one-scene-four-chunk-six-end";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // COIN FLIP - VARIATION TWO
  case "act-one-scene-four-chunk-six-point-two-page-one":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 6.2 p1", 6);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-six-point-two-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-four-chunk-six-point-two-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[9]; // A1 S4 - Chunk 6.2 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-six-point-two-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-four-chunk-six-point-two-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
  
  case "act-one-scene-four-chunk-six-point-two-page-three":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 6.2 p3", 6);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-end-scene";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) { // Back to SECOND SITE OF CHOICE
         nextScreen = "act-one-scene-four-chunk-six-end";
         nextScreenIsSet = true;
      }
    }
    break;

  case "act-one-scene-four-chunk-seven-page-one":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 7 p1", 7);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-seven-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-four-chunk-seven-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[10]; // A1 S4 - Chunk 7 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-seven-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-four-chunk-seven-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
   
  case "act-one-scene-four-chunk-seven-page-three":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 7 p3", 7);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-end-scene";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) { // Back to SECOND SITE OF CHOICE
         nextScreen = "act-one-scene-four-chunk-six-end";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-four-chunk-eight-page-one":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 8 p1", 8);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-eight-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-scene-four-chunk-eight-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[11]; // A1 S4 - Chunk 8 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-eight-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-one-scene-four-chunk-eight-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
   
  case "act-one-scene-four-chunk-eight-page-three":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 8 p3", 8);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-end-scene";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) { // Back to FIRST SITE OF CHOICE
         nextScreen = "act-one-scene-four-chunk-five-end";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-one-end-scene":
    background(#FFFFFF);
    screenImage = getImage("A1 to A2 transition screen", -2);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-zero";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) { // Back to beginning of Act One
         nextScreen = "act-one-scene-one-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
    
  //------ACT TWO CODE------
  case "act-two-scene-one-chunk-nine-page-zero":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9 p0", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-scene-one-chunk-nine-page-one":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9 p1", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-two";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-scene-one-chunk-nine-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[12]; // A2 S1 - Chunk 9 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-scene-one-chunk-nine-page-three":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9 p3", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-four";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-scene-one-chunk-nine-page-four":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9 p4", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-five";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-three";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-scene-one-chunk-nine-page-five":
    background(#FFFFFF);
    screenGif = screenGifSet[13]; // A2 S1 - Chunk 9 p5
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-post-transition";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-four";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // THIRD SITE OF CHOICE
  case "act-two-scene-one-chunk-nine-post-transition":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9 post-transition screen", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-page-one";
         nextScreenIsSet = true;
      } else if (key == 'S' || key == 's') {
         nextScreen = "act-two-scene-one-chunk-nine-point-two-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-five";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // CHUNK 9.2
  case "act-two-scene-one-chunk-nine-point-two-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[16]; // A2 S1 - Chunk 9.2 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-point-two-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-scene-one-chunk-nine-point-two-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[17]; // A2 S1 - Chunk 9.2 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-end-scene";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-post-transition";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // CHUNK 9.1  
  case "act-two-scene-one-chunk-nine-point-one-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[14]; // A2 S1 - Chunk 9.1 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-scene-one-chunk-nine-point-one-page-two":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9.1 p2", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-post-transition";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-scene-one-chunk-nine-point-one-post-transition":
    background(#FFFFFF);
    screenGif = screenGifSet[15]; // A2 S1 - Chunk 9.1 post-transition screen
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-point-one-page-one";
         nextScreenIsSet = true;
      } else if (key == 'S' || key == 's') {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-point-two-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-post-transition";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // CHUNK 9.1.1
  case "act-two-scene-one-chunk-nine-point-one-point-one-page-one":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9.1.1 p1", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-end-scene";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-post-transition";
         nextScreenIsSet = true;
      }
    }
    break;
  
  // CHUNK 9.1.2  
  case "act-two-scene-one-chunk-nine-point-one-point-two-page-one":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9.1.2 p1", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-end-scene";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-post-transition";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-two-end-scene":
    background(#FFFFFF);
    screenImage = getImage("A2 to A3 transition screen", -3);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-page-zero";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) { // Back to beginning of Act Two
         nextScreen = "act-two-scene-one-chunk-nine-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
    
    
  //------ACT THREE CODE------
  case "act-three-scene-one-chunk-ten-page-zero":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10 p0", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[18]; // A3 S1 - Chunk 10 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-page-two";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-page-two":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10 p2", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-page-three":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10 p3", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-post-transition";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // FOURTH SITE OF CHOICE
  case "act-three-scene-one-chunk-ten-post-transition":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10 post-transition screen", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
         nextScreen = "act-three-scene-one-chunk-ten-point-one-page-one";
         nextScreenIsSet = true;
      } else if (key == 'S' || key == 's') {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-page-three";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // CHUNK 10.1
  case "act-three-scene-one-chunk-ten-point-one-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[19]; // A3 S1 - Chunk 10.1 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-one-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-one-page-two":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.1 p2", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-one-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-one-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-one-page-three":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.1 p3", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-one-page-four";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-post-transition";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-one-page-four":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.1 p4", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-combined-post-transition";
         nextScreenIsSet = true;
      }else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-post-transition";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // CHUNK 10.2
  case "act-three-scene-one-chunk-ten-point-two-page-one":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.2 p1", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-two-page-two":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.2 p2", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-three";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-two-page-three":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.2 p3", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-four";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-two";
         nextScreenIsSet = true;
      }
    }
    break;
    
    
  case "act-three-scene-one-chunk-ten-point-two-page-four":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.2 p4", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-five";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-three";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-two-page-five":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.2 p5", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-six";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-two-page-four";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-two-page-six":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.2 p6", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-combined-post-transition";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) { // Back to site of choice
         nextScreen = "act-three-scene-one-chunk-ten-post-transition";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // FIFTH SITE OF CHOICE
  case "act-three-scene-one-chunk-ten-point-combined-post-transition":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.1 and 10.2 post-transition screen", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
         nextScreen = "act-three-scene-one-chunk-ten-point-three-page-zero-home-ctas";
         nextScreenIsSet = true;
      } else if (key == 'S' || key == 's') {
         nextScreen = "act-three-scene-one-chunk-ten-point-four-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
   
  // CHUNK 10.3  
  case "act-three-scene-one-chunk-ten-point-three-page-zero-home-ctas":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.3 p0 - Home CTAs", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-three-page-zero-marsh-ctas";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-three-page-zero-marsh-ctas":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.3 p0 - Marsh CTAs", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-three-page-one";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-three-page-zero-home-ctas";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-three-page-one":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.4 p1", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "end-screen";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-three-page-zero-marsh-ctas";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // CHUNK 10.4  
  case "act-three-scene-one-chunk-ten-point-four-page-zero":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.4 p0", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-four-page-one";
         nextScreenIsSet = true;
      }
    }
    break;
    
  case "act-three-scene-one-chunk-ten-point-four-page-one":
    background(#FFFFFF);
    screenImage = getImage("A3 S1 - Chunk 10.4 p1", 10);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "end-screen";
         nextScreenIsSet = true;
      } else if (keyCode == LEFT) {
         nextScreen = "act-three-scene-one-chunk-ten-point-four-page-zero";
         nextScreenIsSet = true;
      }
    }
    break;
   
  // END SCREEN  
  case "end-screen":
    background(#FFFFFF);
    screenImage = getImage("End screen", -1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == LEFT) {
         nextScreen = "entry-screen";
         nextScreenIsSet = true;
      }
    }
    break;
    
  // EXIT OVERLAY
  case "exit-overlay":
    // background(#FFFFFF);
    screenImage = getImage("EndSessionFrame", -1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
         nextScreen = "end-screen";
         nextScreenIsSet = true;
         exitOverlayActive = false;
      } else if (key == 'S' || key == 's') {
         nextScreen = prevScreen;
         nextScreenIsSet = true;
         exitOverlayActive = false;
      }
    }
    break;
   
  }
  
  // Set up screen transition
  if (changeScreen) {
    screen = nextScreen;
    changeScreen = false;
    nextScreenIsSet = false;
  }
  
  // Set up exit overlay
  if (exitOverlayActive) {
    screen = "exit-overlay";
  }
}

PImage getImage(String name, int chunkNumber) {
  return loadImage(getImagePath(name, "image", chunkNumber));
}

void setGif(String name, int chunkNumber) {
  String imagePath = getImagePath(name, "gif", chunkNumber);
  screenGif = new Gif(this, imagePath);
  return;
}

String getImagePath(String name, String fileType, int chunkNumber) {
  String imagePath = "";
  
  if (fileType == "image") {
    imagePath = "images/";
  } else if (fileType == "gif") {
    imagePath = "gifs/";
  }
  
  switch(chunkNumber) {
    case -1:
      break;
    case -2:
      imagePath += "act-one/";
      break;
    case -3:
      imagePath += "act-two/";
      break;
    case -4:
      imagePath += "act-three/";
      break;
    case 1:
      imagePath += "act-one/scene-one/chunk-one/";
      break;
    case 2:
      imagePath += "act-one/scene-one/chunk-two/";
      break;
    case 3:
      imagePath += "act-one/scene-two/chunk-three/";
      break;
    case 4:
      imagePath += "act-one/scene-three/chunk-four/";
      break;
    case 5:
      imagePath += "act-one/scene-four/chunk-five/";
      break;
    case 6:
      imagePath += "act-one/scene-four/chunk-six/";
      break;
    case 7:
      imagePath += "act-one/scene-four/chunk-seven/";
      break;
    case 8:
      imagePath += "act-one/scene-four/chunk-eight/";
      break;
    case 9:
      imagePath += "act-two/scene-one/chunk-nine/";
      break;
    case 10:
      imagePath += "act-three/scene-one/chunk-ten/";
  }
  
   if (fileType == "image") {
    imagePath += name + ".png";
  } else if (fileType == "gif") {
    imagePath += name + ".gif";
  }
  
  return imagePath;
}

void keyReleased() {
  if (key == 'X' || key == 'x') {
    prevScreen = screen;
    println("prevScreen", prevScreen);
    exitOverlayActive = true;
  }
  
  if (!changeScreen && nextScreenIsSet) {
    changeScreen = true;
  }
}
