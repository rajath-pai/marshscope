//Once again I continue my tradition of making these assignments far more detailed than
//they techincally need to be. I'm having so much fun.
//Welcome to Hoard
//Instructions are in the readme file 
//or accesible by clicking the "Instructions" button on the menu screen. 
//Quick instructions are to use arrow keys to move around and collect gold coins,
//while avoiding the mountains onscreen.

import ddf.minim.*; //import minim library to use sound

//global variables
int level; //Controls level in level mode
String mode; //Controls what mode the game is in

int duration, timePassed, timeLeft; //controls timer for level mode
int recoverDuration, recoverTimePassed, recoverTimeLeft; //controls recovery timer

PImage background, gold_coin, menu_screen; //images to import/use
PImage[] dragonAnim = new PImage[12]; //image array to hold images for animation

Dragon dragon; //player character object
Coin[] coinArray = new Coin[10]; //coin array to hold gold coins
Mountain[] mountArray = new Mountain[7]; //mountain array to hold mountains

AudioPlayer ambient, crash, collect; //sounds to be used while playing
Minim songLoading; //songloader for minim

float[] starX = new float[30]; //float array to hold x positions of stars for level 3
float[] starY = new float[30]; //float array to hold y positions of stars for level 3

void setup() {
  size(1280, 889); //set canvas size

  //load in all images
  background = loadImage("mountains_background.png"); //load background mountains
  gold_coin = loadImage("gold_coin.png"); //load gold coin image
  menu_screen = loadImage("menu_screen.png"); //load menu screen + buttons
  
  //populate image array with images in correct order for animation
  dragonAnim[0] = loadImage("dragon_mid.png");
  dragonAnim[1] = loadImage("dragon_slight_up.png");
  dragonAnim[2] = loadImage("dragon_mid_up.png");
  dragonAnim[3] = loadImage("dragon_full_up.png");
  dragonAnim[4] = loadImage("dragon_mid_up.png");
  dragonAnim[5] = loadImage("dragon_slight_up.png");
  dragonAnim[6] = loadImage("dragon_mid.png");
  dragonAnim[7] = loadImage("dragon_slight_down.png");
  dragonAnim[8] = loadImage("dragon_mid_down.png");
  dragonAnim[9] = loadImage("dragon_full_down.png");
  dragonAnim[10] = loadImage("dragon_mid_down.png");
  dragonAnim[11] = loadImage("dragon_slight_down.png");

  imageMode(CENTER); //the image coordiantes are based on the center not the corner

  for (int i = 0; i < 30; i++) {
    starX[i] = random(0, width+1); //generate star x coordinates
    starY[i] = random(0, height/2); //generate star y coordinates where mountains won't block them
  }

  //load sounds
  songLoading = new Minim(this);
  ambient = songLoading.loadFile("ambient.mp3"); //load background music
  crash = songLoading.loadFile("collision.wav"); //load crash sound
  collect = songLoading.loadFile("collect_coin.wav"); //load collect coin sound

  dragon = new Dragon(100, height/2, 10); //create player character

  for (int i = 0; i<coinArray.length; i++) {
    coinArray[i] = new Coin(); //generate the coins to collect
  }

  for (int i = 0; i<mountArray.length; i++) {
    mountArray[i] = new Mountain(); //generate the mountains to avoid
  }

  mode = "intro"; //set up intro screen to start
  level = 1; //set level to lowest setting

  frameRate(24); //I'm animating on twos so this will make the animation feel more natural
}

void draw() {
  //loop background music
  if (!ambient.isPlaying()) { //if the song isn't playing
    ambient.rewind(); //rewind song to make sure it starts at the beginning
    ambient.play(); //play ambient background music
  }

  switch(mode) {
  case "intro": //main menu
    background(#87CEEB); //sky color background
    image(background, width/2, height/2); //grab mountain image for the background
    image(menu_screen, width/2, height/2); //grab menu image to show menu screen options
    break;

  case "instructions": //instructions page
    background(#87CEEB); //sky color background
    textAlign(CENTER);
    textSize(30);
    fill(0); //black text
    String instructions = "You are a dragon seeking to fill your hoard with gold!\n\n" +
      "Use the arrow keys to move your dragon up, down, left, and right to collect gold coins.\n" +
      "Avoid crashing into mountains or you'll lose health!\n\n" +
      "Choose level mode to traverse different levels and race against the clock.\n" +
      "Choose infinity mode to continue gathering coins until your health runs out.\n\n" +
      "Click anywhere onscreen to return to the main menu.";
    text(instructions, width/2, 100); //display instruction text
    image(dragonAnim[3], width/3, 600, 300, 208); //show player character (sized up)
    image(gold_coin, width/1.5, 600); //show example gold coin
    break;

  case "level": //level mode, where yuo have a time limit and distinct levels to pass through
    timeLeft = int((duration - (millis() - timePassed))*0.001); //set up the timer
    if (timeLeft <=0) { //if time runs out
      level = 4; //end the game
    }

    if (dragon.recover) { //if the dragon is in recovery mode
      recoverTimeLeft = int((recoverDuration - (millis() - recoverTimePassed))*0.001); //set up the recovery timer
      if (recoverTimeLeft <=0) { //when recover time runs out
        dragon.recover = false; //the dragon is vulnerable again
      }
    }

    switch(level) { //controls what each level looks like
    case 1:
      background(#87CEEB); //sky blue background for daytime
      noStroke(); //remove outline for sun
      fill(#FFE87C); //sun color
      ellipse(width/3, 200, 150, 150); //sun position
      image(background, width/2, height/2); //grab mountain image for the background
      dragon.displayScore(); //display score
      dragon.displayHealth(); //display health bar
      dragon.displayTimeRemaining(); //display time left
      for (int i = 0; i < mountArray.length; i++) {
        mountArray[i].display(); //display the mountains
      }
      for (int i = 0; i < coinArray.length; i++) {
        coinArray[i].display(); //display the coins
      }
      dragon.display(); //display the player character
      break;

    case 2:
      background(#FF9506); //orange background for the sunset
      image(background, width/2, height/2); //grab mountain image for the background
      dragon.displayScore(); //display the score
      dragon.displayHealth(); //display health bar
      dragon.displayTimeRemaining(); //display time left
      for (int i = 0; i < mountArray.length; i++) {
        mountArray[i].display(); //display the mountains
      }
      for (int i = 0; i < coinArray.length; i++) {
        coinArray[i].display(); //display the coins
      }
      dragon.display(); //display the player character
      break;

    case 3:
      background(#041A40); //dark blue/black background for nighttime
      noStroke(); //remove outline for the moon
      fill(#F6F1D5); //moon color
      ellipse(width/3, 200, 150, 150); //moon position
      for (int i = 0; i < 30; i++) {
        ellipse(starX[i], starY[i], 4, 4); //add the stars to the background
      }
      image(background, width/2, height/2); //grab mountain image for the background
      dragon.displayScore(); //display the score
      dragon.displayHealth(); //display health bar
      dragon.displayTimeRemaining(); //display time left
      for (int i = 0; i < mountArray.length; i++) {
        mountArray[i].display(); //display mountains
      }
      for (int i = 0; i < coinArray.length; i++) {
        coinArray[i].display(); //display coins
      }
      dragon.display(); //display player character
      break;

    case 4:
      background(#041A40); //dark background for contrast
      textAlign(CENTER);
      textSize(70);
      fill(#F6F1D5); //light text color for contrast
      text("Final Score: " + dragon.score, width/2, 300); //display the final score
      textSize(50);
      text("Press the spacebar to return to the main menu.", width/2, 500); //display instructions on how to reset
      break;
    }
    break;

  case "infinity": //infinity mode, without true levels but where the coins continually move faster and you go until you loose all health
    if (level == 4) { //makes sure the final screen works even though levels aren't really a thing in infinity mode
      background(#041A40); //dark background for contrast
      textAlign(CENTER);
      textSize(70);
      fill(#F6F1D5); //light text color for contrast
      text("Final Score: " + dragon.score, width/2, 300); //display the final score
      textSize(50);
      text("Press the spacebar to return to the main menu.", width/2, 500); //display instructions on how to reset
    } else {
      
      if (dragon.recover) { //if dragon is in recovery mode after a crash
        recoverTimeLeft = int((recoverDuration - (millis() - recoverTimePassed))*0.001); //set up the recovery timer
        if (recoverTimeLeft <=0) { //when recover time runs out
          dragon.recover = false; //dragon is vulnerable again
        }
      }

      background(#87CEEB); //sky blue color background
      noStroke(); //remove outline for sun
      fill(#FFE87C); //sun color
      ellipse(width/3, 200, 150, 150); //sun position
      image(background, width/2, height/2); //grab mountain image for the background

      dragon.displayScore(); //display the score
      dragon.displayHealth(); //display health bar
      for (int i = 0; i < mountArray.length; i++) {
        mountArray[i].display(); //display mountains
      }
      for (int i = 0; i < coinArray.length; i++) {
        coinArray[i].display(); //display coins
      }
      dragon.display(); //display the player character
    }
    break;
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    dragon.moveRight = true; //move right when the right arrow key is pressed
  }
  if (keyCode == LEFT) {
    dragon.moveLeft = true; //move left when the left arrow key is pressed
  }
  if (keyCode == UP) {
    dragon.moveUp = true; //move up when the up arrow key is pressed
  }
  if (keyCode == DOWN) {
    dragon.moveDown = true; //move down when the down arrow key is pressed
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {
    dragon.moveRight = false; //stop moving right when the right arrow key is released
  }
  if (keyCode == LEFT) {
    dragon.moveLeft = false; //stop moving left when the left arrow key is released
  }
  if (keyCode == UP) {
    dragon.moveUp = false; //stop moving up when the up arrow key is released
  }
  if (keyCode == DOWN) {
    dragon.moveDown = false; //stop moving down when the down arrow key is released
  }
  if (key == ' ') { //when the spacebar is pressed
    if (level == 4) { //and the final screen is displayed
      dragon.reset(); //reset the dragon, coins and mountains
      level = 1; //set the level back to 1
    }
  }
}

void mouseReleased() {
  if (mode == "intro") { //if on the main menu screen
    if (mouseX < 550 & mouseX > 290 && mouseY > 220 && mouseY < 350) {
      mode = "level"; //click on level mode button to start playing in level mode
      timePassed = millis(); //start the timer for level mode
      timeLeft = duration = 35500;  //35.5 seconds on the clock for level mode
    } else if (mouseX < 990 & mouseX > 730 && mouseY > 220 && mouseY < 350) {
      mode = "infinity"; //click on infinity mode button to start playing in infinity mode
    } else if (mouseX < 760 & mouseX > 540 && mouseY > 400 && mouseY < 540) {
      mode = "instructions"; //click on instructions button to visit the instructions page
    }
  } else if (mode == "instructions") { //if on the instructions page
    mode = "intro"; //go back to the main menu screen after visiting the instructions
  }
}

class Dragon {

  float x, y; //dragon's x and y position on the canvas
  float vx, vy; //x and y movement values
  boolean moveLeft, moveRight, moveUp, moveDown; //controls where the dragon moves
  float speed; //controls how fast the dragon moves in any direction
  float health; //controls dragon health, goes down due to crashes
  int score; //records dragon score, goes up as you collect coins
  int animNum; //the index of the current image in the animation array
  boolean recover; //tells the system to avoid crashes for a bit after a crash

  Dragon(float startX, float startY, float flySpeed) {
    x = startX; //set the x starting position
    y = startY; //set the y starting position
    speed = flySpeed; //set the dragon's speed
    score = 0; //score starts at 0
    health = 200; //initial health value
    animNum = 0; //start with the resting animation, the first image in the array
    recover = false; //start out not invulnerable
  }

  void display() {
    //movement controls
    vx = 0; //set x movement to 0
    if (moveRight) vx += speed; //if moving right, add speed value to x movement
    if (moveLeft) vx -= speed; //if moving left, subtract speed value from x movement
    x += vx; //add x movement value to x position to get movement

    if (x >= width) {
      x = width; //prevent the dragon from moving past the right edge of the window
    } else if (x <= 0) {
      x = 0; //prevent the dragon from moving past the left edge of the window
    }

    vy = 0; //set y movement value to 0
    if (moveUp)vy -= speed; //if moving up, subtract speed value from y movement
    if (moveDown)vy += speed; //if moving down, add speed value to y movement
    y += vy; //add y movement value to y position to get movement

    if (y >= height) {
      y = height; //prevent the dragon from moving past bottom of the window
    } else if (y <= 0) {
      y = 0; //prevent the dragon from moving past the top of the window
    }

    //coin collision controls
    for (int i = 0; i<coinArray.length; i++) {
      float d = sq(x - coinArray[i].x) + sq(y - coinArray[i].y); //get distance between coin center and dragon center
      d = sqrt(d);
      if (mode == "level") {
        if (d < 105 && level == 1) { //have to change distance to collect as coins get smaller
          score +=100; //increase score
          coinArray[i].collect(); //reset coin position and play collection noise
        } else if (d < 92 && level == 2) { //have to change distance to collect as coins get smaller
          score +=100; //increase score
          coinArray[i].collect(); //reset coin position and play collection noise
        } else if (d < 87 && level == 3) { //have to change distance to collect as coins get smaller
          score +=100; //increase score
          coinArray[i].collect(); //reset coin position and play collection noise
        }
      } else if (mode == "infinity") {
        if (d < 92) { //correct distance/collision check for infinity mode coin size
          score +=100; //increase score
          coinArray[i].collect(); //reset coin position and play collection noise
        }
      }
    }

    //mountain collision controls
    //check for collision with dragon via rectangle-line collision detection methods
    //add ten to mountain x to account for mountain moving
    for (int i = 0; i < mountArray.length; i++) {
      if (mountainCollision(mountArray[i].x + 10, mountArray[i].tall, mountArray[i].wide) && !recover) {
        health -= 50; //crash causes health to drop
        crash.play(); //play crash sound to indicate collision detected
        crash.rewind(); //rewind the sound after it has played so it can play again next time

        recover = true; //allow the player a period of invulnerability to recover from the crash
        recoverTimePassed = millis(); //start the recovery timer
        recoverTimeLeft = recoverDuration = 3000;  //3 seconds for recovery
      }
    }
    if(recover){ //if in recovery mode
      tint(220, 20, 60, 85);  //give the dragon a red cast to indicate recovery mode
    }

    //draw image and increment animation counter
    image(dragonAnim[animNum], x, y); //draw the current animation image at x and y
    animNum++; //move image through the image array to make animation
    if (animNum >= 12) { //once it's gone through the flying images
      animNum = 0; //reset back to first image in the array
    }
    noTint(); //remove tint so it doesn't affect anything but the dragon
  }

  void displayScore() {
    textAlign(CENTER);
    textSize(50);
    if (mode == "level") { //if in level mode
      if (score < 1000) { //level 1 is before you score 1000
        level = 1;
        fill(0); //black to stand out against the lighter background
      }
      if (score >= 1000) { //level 2 is scores 1000 to 1999
        level = 2;
        fill(0); //black to stand out against the lighter background
      }
      if (score >= 2000) { //level 3 is scores 2000 to 2999
        level = 3;
        fill(#F6F1D5); //moon color to make it stand out against a dark background
      }
      if (score >= 3000) { //winning score is 3000+ in level mode
        level = 4;
        fill(#87CEEB); //hide the score text because it'll display your final score anyway
      }
    } else if (mode == "infinity") { //no levels or winning score in infinity mode
      fill(0); //black to stand out against the lighter background
    }
    text("Score: " + score, 150, 70); //display the current score in the left hand corner of the screen
  }

  void displayHealth() {
    stroke(0); //use black for outline of health bar
    strokeWeight(4); //background outline thickness of health bar
    fill(#A9A9A9); //background gray color for health bar
    rect(width-255, 35, 210, 30); //display dragon health bar at top right of screen
    fill(#C41E3A); //bloodred color for remaining health
    noStroke(); //no outline for inner bar
    rect(width-250, 40, health, 20); //inner health bar length matches health percentage
    if (health <= 0) {
      println("Game over!");
      level = 4; //if dragon health hits 0 you lose, instantly go to the final screen
    }
  }

  void displayTimeRemaining() {
    textAlign(CENTER);
    textSize(50);
    if (timeLeft <= 5) {
      fill(#FF0000); //red text color for running out of time
    } else if (level == 3 && timeLeft > 5) {
      fill(#F6F1D5); //moon color to stand out against dark background
    } else {
      fill(0); //black text color
    }
    text("Time Left: " + timeLeft, width/2, 70); //display the time remaining for level mode
  }

  void reset() {
    score = 0; //reset player score
    health = 200; //reset player health

    x = 100; //return to starting place
    y = height/2; //return to starting place

    for (int i = 0; i<coinArray.length; i++) {
      coinArray[i] = new Coin(); //regenerate the coins to collect
    }

    for (int i = 0; i<mountArray.length; i++) {
      mountArray[i] = new Mountain(); //regenerate the mountains to avoid
    }

    mode = "intro"; //reset mode to return to intro screen
    level = 1; //reset level to start over
  }
}

class Coin {

  float x, y; //controls coin position onscreen
  float speed; //controls coin movement speed

  Coin() {
    x = random(300, width+200); //start all coins in random x between in front of dragon and offscreen
    y = random(height); //start coins at any height between 0 and the screen height
    speed = 10; //starting speed for infinity mode
  }

  void display() {
    int imageW = 50; //original width of image
    int imageH = 48; //original height of image
    if (mode == "level") {
      switch(level) {
      case 1:
        speed = 10; //slow speed for earlier level
        break;
      case 2:
        imageW = 25; //smaller size for next level
        imageH = 24; //smaller size for next level
        speed = 15; //faster speed as level increases
        break;
      case 3:
        imageW = 15; //smallest size for final level
        imageH = 14; //smallest size for final level
        speed = 20; //fastest speed for final level
        break;
      }
    } else if (mode == "infinity") {
      speed += .01; //speed increases a little every frame as infinity mode progresses
      imageW = 25; //use average size coin for infinity mode
      imageH = 24; //use average size coin for infinity mode
    }
    x -= speed; //make the coins move left across the screen to simulate the dragon moving
    if (x <= 0) {
      x = random(width, width+200); //if you miss a coin it reappears at or behind left side of screen
    }
    image(gold_coin, x, y, imageW, imageH); //use gold coin image for coin display
  }

  void collect() {
    collect.play(); //play collect coin sound
    collect.rewind(); //rewind collect coin sound so it can be played again
    
    x = width + random(200); //reset coin position so it has to come from the left side again
    y = random(height); //restart coin at any height between 0 and the screen height
  }
}

class Mountain {

  float x; //sets the bottom left x point/position of the mountain
  float tall, wide; //controls how tall and wide the mountain is

  Mountain() {
    x = random(400, width + 300); //start the mountains onscreen or just offscreen
    tall = random(200, (height * 3/4)); //set how tall the mountain will be
    wide = random(200, 700); //set how wide the base of the mountain will be
  }

  void display() {
    x -= 10; //mountains move at a consistent speed across the screen
    if ((x + wide) <= 0) { //when mountain moves offscreen
      tall = random(200, (height * 3/4)); //regenerate mountain with new height
      wide = random(200, 700); //regenerate mountain with new width
      x = random(width, width+500); //regenerate mountain on the right side of the screen
    }
    stroke(0); //black color for outline
    strokeWeight(3); //give the mountain an outline to make it more visible
    if (mode == "level") { //if in level mode, change the mountain color with the levels so it matches apparent light level
      switch(level) {
      case 1:
        fill(#e4ded4); //light gray mountain color for daytime
        break;
      case 2:
        fill(#d1c7b6); //darker gray mountain color for sunset
        break;
      case 3:
        fill(#beb098); //darkest gray mountain color for night
        break;
      }
    } else {
      fill(#e4ded4); //light gray mountain color for daytime
    }
    triangle(x, height, (x + wide/2), (height - tall), (x + wide), height); //draw the mountain
  }
}

//method to figure out if two lines intersect
boolean lineLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

  // calculate the distance to intersection point
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  // if uA and uB are between 0-1, lines are colliding
  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    return true;
  }
  return false;
}

//method to figure out if a line crosses a rectangle
boolean lineRect(float x1, float y1, float x2, float y2, float rx, float ry, float rw, float rh) {

  // check if the line has hit any of the rectangle's sides
  // uses the Line/Line function from above
  boolean left = lineLine(x1, y1, x2, y2, rx, ry, rx, ry+rh); //did it hit the left side
  boolean right = lineLine(x1, y1, x2, y2, rx+rw, ry, rx+rw, ry+rh); //did it hit the right side
  boolean top = lineLine(x1, y1, x2, y2, rx, ry, rx+rw, ry); //did it hit the top
  boolean bottom = lineLine(x1, y1, x2, y2, rx, ry+rh, rx+rw, ry+rh); //did it hit the bottom

  // if ANY of the above are true, the line has hit the rectangle
  if (left || right || top || bottom) {
    return true;
  }
  return false;
}

//figure out if the player character has collided with one of the mountains
boolean mountainCollision(float mountainX, float mountainH, float mountainW) {

  // check if the line has hit the left or right side of the mountain using the Line/Rect function defined above
  // we'll never touch the bottom so we can skip it
  // we also have to adjust dragon coordinates
  // to account for them being in the center of the dragon not the top right corner
  // I've given them a little extra leeway because the bounding box is a little bigger than the dragon body
  boolean left = lineRect(mountainX, height, (mountainX + (mountainW/2)), height - mountainH, dragon.x - 95, dragon.y - 50, 190, 100);
  boolean right = lineRect((mountainX + (mountainW/2)), height - mountainH, mountainX + mountainW, height, dragon.x - 95, dragon.y - 50, 190, 100);

  //if ANY of the above are true, the player collided with the mountain
  if (left || right) {
    return true;
  }
  return false;
}
