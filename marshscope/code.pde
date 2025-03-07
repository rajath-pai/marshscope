import ddf.minim.*;

import gifAnimation.*;

PImage background;

Gif opening_animation;

String scene;  // intro, act-one-scene-one, act-one-scene-two, act-one-scene-three, etc. 

void setup() {

  // TODO: Verify if code renders fine on mirror 
  // size(665, 686);
  fullScreen();
  // size(3024, 1964);

  background = loadImage("background_main_v2.png");  // TODO: TO BE REPLACED
  background.resize(width, height);
  
  imageMode(CENTER);
  
  opening_animation = new Gif(this, "images/1_opening_scene/opening_animation.gif");
  
  // Start experience with "intro" scene.
  scene = "intro";
}

void draw() {
  
  switch (scene) {
    // OPENING SCENE
    case "intro":
      image(background, width/2, height/2);
  
      opening_animation.play();
      image(opening_animation, width/2, height/2-60);
      
      break;
      
    // ACT ONE, SCENE ONE
  }
}
