//How to use this file:
//It will auto-generate two birds which move at different speeds
//You can make them fly by pressing the UP arrow key
//You can make them fly left or right by pressing the LEFT or RIGHT arrow keys
//You can make them do a bird call by clicking your mouse button
//You can make them lay an egg by pressing TAB
//When they stop moving they will fall out of the sky and land on the ground

//Yes I made this more complicated than it needed to be, but I was having fun
//Thanks for giving me an excuse to try animating something for the first time

import ddf.minim.*; //import minim library to use sound

//global variables
AudioPlayer song;
Minim songLoading;
PImage background, baseBird, fly_pose_1, fly_pose_2, fly_pose_3; //images to be loaded
PImage[] imageArray = new PImage[5]; //image array to hold images for 4-frame flying animation, plus an extra resting bird image;
Bird bird1, bird2;

void setup(){
  size(800, 600); //set canvas size
  
  //load in all images and populate image array with images in correct order for animation
  background = loadImage("mountains.jpg");
  baseBird = loadImage("base_bird.png");
  imageArray[0] = baseBird;
  fly_pose_1 = loadImage("bird_flying_1.png");
  imageArray[1] = fly_pose_1;
  imageArray[3] = fly_pose_1;
  fly_pose_2 = loadImage("bird_flying_2.png");
  imageArray[2] = fly_pose_2;
  fly_pose_3 = loadImage("bird_flying_3.png");
  imageArray[4] = fly_pose_3;
  
  imageMode(CENTER); //the image coordiantes are based on the center not the corner
  
  //load birdsong
  songLoading = new Minim(this);
  song = songLoading.loadFile("bird_call.mp3");
  
  //make birds!
  bird1 = new Bird(500, 500, 8, imageArray); //slow bird
  bird2 = new Bird(300, 550, 12, imageArray); //speedy bird
}

void draw(){
  image(background, 500, 0); //grab background image to make background
  bird1.display(); //make bird 1 appear onscreen
  bird2.display(); //make bird 2 appear onscreen
}

class Bird{
  
  PImage[] animationImages; //image array to hold images for animation;
  int imageNum; //controls what image we're on in the image array, helps control animation
  PImage currentBird; //the current image in the animation loop
  float speed; //controls how fast the bird can fly
  float x, y; //bird position on the canvas
  boolean right; //used to change the direction the bird faces
  boolean moving; //used to indicate if the bird is flying or if gravity should take effect
  boolean eggExists; //used to indicate if the bird laid an egg
  float eggX, eggY; //keeps track of the position of the egg at any given moment
  
  Bird(float startX, float startY, float airspeed, PImage[] animation){
    x = startX; //set starting position
    y = startY; //set starting position
    speed = airspeed; //set how fast the bird can move
    right = true; //begin by facing right
    moving = false; //begin staying still
    animationImages = animation; //provide the array of images to be used for animation
    imageNum = 0; //start with the resting animation, the first image in the array
    currentBird = animation[0]; //start with the base/resting bird image
  }
  
  void display(){
    currentBird = imageArray[imageNum]; //grab the current image in the animation loop
    pushMatrix();
    if (right){ //if facing right
      scale(1, 1); //set the size of the bird and make it face right
      image(currentBird, x, y);//using images I drew for base display
    } else { //if facing left
      scale(-1, 1); //set the size of the bird and make it face left
      image(currentBird, -x, y);//using images I drew for base display
    }
    popMatrix();
    
    if (moving == false){ //if not moving up or sideways
      gravity(); //gravity should pull it down
    }
    
    if (eggExists && eggY < height-50){ //if you hit tab to generate an egg and it hasn't hit the ground
      fill(255); //egg color
      ellipse(eggX, eggY, 20, 30); //egg shape
      eggY = eggY + 5; //egg falls out of the sky since it doesn't have wings
    } else if (eggExists && eggY >= height-50){ //once the egg hits the ground
      noStroke();
      fill(#e7f207); //smashed egg yellow color
      rectMode(CENTER);
      rect(eggX, height-50, 40, 5); //smashed egg remains appear
      eggExists = false; //the egg is now gone, so you can lay another one
    }
  }
  
  void fly(){ 
    moving = true;
    if (y > 0){ //height limit so it can't fly too high
      y = y - speed; //makes the bird move up/fly
      println("Flying!");
    }
    if (right){
        x = x + speed/10; //momentum means they keep going in the same direction
      } else {
        x = x - speed/10; //momentum means they keep going in the same direction
      }
    animateFlying(); //cycle through the animation images so it appears to be flying
  }
  
  void animateFlying(){
    imageNum++; //move image through the image array to make animation
    if (imageNum >=5){
      imageNum = 1; //once it's gone through the flying images reset back to first image
    }
  }
  
  void moveLeft(){
    moving = true;
    right = false;
    if (x > (currentBird.width/3)){ //if the x position isn't at the edge of the canvas
      x = x - speed; //move to the left
      println("Moving left");
    }
    animateFlying(); //cycle through the animation images so it appears to be flying
  }
  
  void moveRight(){
    moving = true;
    right = true;
    if (x < (width - (currentBird.width/3))){ //if the x position isn't at the edge of the canvas
      x = x + speed; //move to the right
      println("Moving right");
    }
    animateFlying(); //cycle through the animation images so it appears to be flying
  }
  
  void tweet(){
    println("Tweet!");
    song.play(); //play birdcall sound
    song.rewind(); //rewind so you can play it again from the top
  }
  
  void gravity(){
    if (y <= height - 100){ //if bird isn't on the ground already
      y = y + 5; //gravity pulls the bird down from the sky, always at the same rate
      println("Falling!");
      if (right){
        x = x + speed/10; //momentum means they keep going in the same direction when falling
      } else {
        x = x - speed/10; //momentum means they keep going in the same direction when falling
      }
    } else{
      imageNum = 0; //if on the ground they return to the resting pose/image
    }
  }
  
  void stopMoving(){
    moving = false; //indicate the bird has stopped moving so gravity takes effect
  }
  
  void layEgg(){
    eggExists = true; //make an egg appear
    eggX = x; //egg appears at same x position as the bird
    eggY = y + currentBird.height/4; //egg appears below the bird
    println("Egg bomb!");
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    bird1.moveRight(); //move bird 1 right when the right arrow key is pressed
    bird2.moveRight(); //move bird 2 right when the right arrow key is pressed
  } else if (keyCode == LEFT) {
    bird1.moveLeft(); //move bird 1 left when the right arrow key is pressed
    bird2.moveLeft(); //move bird 2 left when the right arrow key is pressed
  } else if (keyCode == UP){
    bird1.fly(); //move bird 1 up when the up arrow key is pressed
    bird2.fly(); //move bird 2 up when the up arrow key is pressed
  } else if (keyCode == TAB){
    bird1.layEgg(); //bird 1 lays an egg when tab is pressed
    bird2.layEgg(); //bird 2 lays an egg when tab is pressed
  }
}

void keyReleased(){
  bird1.stopMoving(); //bird 1 stops moving and falls out of the air when key is released
  bird2.stopMoving(); //bird 2 stops moving and falls out of the air when key is released
}

void mouseReleased(){
  bird1.tweet(); //bird call sound plays for bird 1 when the mouse button is clicked
  bird2.tweet(); //bird call sound plays for bird 2 when the mouse button is clicked
}
