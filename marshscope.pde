import ddf.minim.*;      // for audio

import gifAnimation.*;  // for GIFs

PImage background, screenImage;

Gif screenGif;

Gif[] screenGifSet = new Gif[20];

String screen, nextScreen;

int level;

boolean changeScreen;

void setup() {
  size(1512, 982); //set canvas size
  
  // fullScreen();

  imageMode(CENTER); //the image coordiantes are based on the center not the corner
  
  /* 
  
  //load sounds
  songLoading = new Minim(this);
  ambient = songLoading.loadFile("ambient.mp3"); //load background music
  
  */
  
  //screen = "entry-screen"; //set up intro screen to start
  screen = "act-one-scene-four-chunk-five-end"; //set up intro screen to start
  
  changeScreen = false;
  
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
  
  // Chunk 7
  screenGifSet[9] = new Gif(this, getImagePath("A1 S4 - Chunk 7 p2", "gif", 7));
  
  // Chunk 8
  screenGifSet[10] = new Gif(this, getImagePath("A1 S4 - Chunk 8 p2", "gif", 8));  
  
  // Chunk 9
  screenGifSet[11] = new Gif(this, getImagePath("A2 S1 - Chunk 9 p2", "gif", 9));
  screenGifSet[12] = new Gif(this, getImagePath("A2 S1 - Chunk 9 p5", "gif", 9));
  
  screenGifSet[13] = new Gif(this, getImagePath("A2 S1 - Chunk 9.1 p1", "gif", 9));
  screenGifSet[14] = new Gif(this, getImagePath("A2 S1 - Chunk 9.1 post-transition screen", "gif", 9));
  
  
  screenGifSet[15] = new Gif(this, getImagePath("A2 S1 - Chunk 9.2 p1", "gif", 9));
  screenGifSet[16] = new Gif(this, getImagePath("A2 S1 - Chunk 9.2 p2", "gif", 9));
  
  
  
  
}

void draw() {
  println("STARTING...");
  
  /*
  //loop background music
  if (!ambient.isPlaying()) { //if the song isn't playing
    ambient.rewind(); //rewind song to make sure it starts at the beginning
    ambient.play(); //play ambient background music
  }*/
  
  
  switch(screen) {
  case "entry-screen":
    background(#FFFFFF);
    screenImage = getImage("0_Entry screen", -1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      println("Key pressed");
      if (keyCode == RIGHT) {
         println("RIGHT----------------------");
         nextScreen = "act-one-scene-one-page-zero";
      }
    } else {
      println("Key NOT pressed!");
    }
    break;
    
  case "act-one-scene-one-page-zero":
    background(#FFFFFF);
    screenImage = getImage("A1 S1 - Chunk 1 p0", 1);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-one-page-one";
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
      }
    }
    break;
    
  case "act-one-scene-three-chunk-four-page-zero":
    background(#FFFFFF);
    screenImage = getImage("A1 S3 - Chunk 4 p0", 4);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-page-one";
      }
    }
    break;
    
  case "act-one-scene-three-chunk-four-page-one":
    background(#FFFFFF);
    screenImage = getImage("A1 S3 - Chunk 4 p1", 4);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-page-two";
      }
    }
    break;
   
  case "act-one-scene-three-chunk-four-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[5]; // A1 S3 - Chunk 4 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-page-three";
      }
    }
    break;
    
  case "act-one-scene-three-chunk-four-page-three":
    background(#FFFFFF);
    screenGif = screenGifSet[6]; // A1 S3 - Chunk 3 p3
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-three-chunk-four-page-four";
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
      }
    }
    break;
  
  case "act-one-scene-three-chunk-four-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S3 - Chunk 4 post-transition screen", 4);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-five-page-zero";
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
      }
    }
    break;

  // FIRST SITE OF CHOICE
  case "act-one-scene-four-chunk-five-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 5 post-transition screen", 5);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      println(key);
      if (key == 'L' || key == 'l') {
         nextScreen = "act-one-scene-four-chunk-six-page-one";
      } else if (key == 'A' || key == 'a') {
         nextScreen = "act-one-scene-four-chunk-eight-page-one";
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
      }
    }
    break;

  // SECOND SITE OF CHOICE
  case "act-one-scene-four-chunk-six-end":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 6 post-transition screen", 6);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (key == 'L' || key == 'l') {
         nextScreen = "act-one-scene-four-chunk-seven-page-one";
      } else if (key == 'A' || key == 'a') {
         nextScreen = "act-one-scene-four-chunk-six-variation-one-page-one"; // TODO: coin flip
      }
    }
    break;
    
  case "act-one-scene-four-chunk-six-variation-one-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[8]; // A1 S4 - Chunk 6.1 p1
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-six-variation-one-page-two";
      }
    }
    break;

  case "act-one-scene-four-chunk-six-variation-one-page-two":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 6.1 p2", 6);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-end-scene";
      }
    }
    break;
    
   // ADD VARIATION TWO

  case "act-one-scene-four-chunk-seven-page-one":
    background(#FFFFFF);
    screenImage = getImage("A1 S4 - Chunk 7 p1", 7);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-seven-page-two";
      }
    }
    break;
    
  case "act-one-scene-four-chunk-seven-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[8]; // A1 S4 - Chunk 7 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-seven-page-three";
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
      }
    }
    break;
    
  case "act-one-scene-four-chunk-eight-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[9]; // A1 S4 - Chunk 8 p2
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-one-scene-four-chunk-eight-page-three";
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
      }
    }
    break;
    
    case "act-two-scene-one-chunk-nine-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[11]; 
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-page-three";
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
      }
    }
    break;
    
    case "act-two-scene-one-chunk-nine-page-five":
    background(#FFFFFF);
    screenGif = screenGifSet[12]; 
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-post-transition";
      }
    }
    break;
    
    
    //SITE OF CHOICE
    case "act-two-scene-one-chunk-nine-post-transition":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9 post-transition screen", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (key == 'L' || key == 'l') {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-page-one";
      } else if (key == 'A' || key == 'a') {
         nextScreen = "act-two-scene-one-chunk-nine-point-two-page-one"; // TODO: coin flip
      }
    }
    break;
    
    case "act-two-scene-one-chunk-nine-point-two-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[15]; 
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-point-two-page-two";
      }
    }
    break;
    
    case "act-two-scene-one-chunk-nine-point-two-page-two":
    background(#FFFFFF);
    screenGif = screenGifSet[16]; 
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-last-screen";
      }
    }
    break;
    
    
    case "act-two-scene-one-chunk-nine-point-one-page-one":
    background(#FFFFFF);
    screenGif = screenGifSet[13]; 
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-page-two";
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
      }
    }
    break;
    
    case "act-two-scene-one-chunk-nine-point-one-post-transition":
    background(#FFFFFF);
    screenGif = screenGifSet[14]; 
    screenGif.play();
    image(screenGif, width/2, height/2);
    screenGif.noLoop(); // if GIF needs to be disabled for looping
    if (keyPressed) {
      if (key == 'L' || key == 'l') {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-point-one-page-one";
      } else if (key == 'A' || key == 'a') {
         nextScreen = "act-two-scene-one-chunk-nine-point-one-point-two-page-one"; // TODO: coin flip
      }
    }
    break;
    
    case "act-two-scene-one-chunk-nine-point-one-point-one-page-one":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9.1.1 p1", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-last-screen";
      }
    }
    break;
    
    case "act-two-scene-one-chunk-nine-point-one-point-two-page-one":
    background(#FFFFFF);
    screenImage = getImage("A2 S1 - Chunk 9.1.2 p1", 9);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-two-last-screen";
      }
    }
    break;
    
    case "act-two-last-screen":
    background(#FFFFFF);
    screenImage = getImage("A2 to A3 transition screen", -3);
    image(screenImage, width/2, height/2);
    if (keyPressed) {
      if (keyCode == RIGHT) {
         nextScreen = "act-three";
      }
    }
    break;
   
  }
  
  if (changeScreen) {
    screen = nextScreen;
    changeScreen = false;
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
  }
  
   if (fileType == "image") {
    imagePath += name + ".png";
  } else if (fileType == "gif") {
    imagePath += name + ".gif";
  }
  
  return imagePath;
}

void keyReleased() {
  if (!changeScreen) {
    changeScreen = true;
  }
}
  
  
