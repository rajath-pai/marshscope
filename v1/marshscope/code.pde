import ddf.minim.*;      // for audio

import gifAnimation.*;  // for GIFs

PImage background;

Gif openingAnimation;

String scene;  // intro, act-one-scene-one, act-one-scene-two, act-one-scene-three, etc. 

String startingText;

JSONObject storyObjJson;

PFont customFont;

boolean rightKeyPressed, leftKeyPressed, startTimeSet;

float startTime, exitTime, maxTextWidth, padding = 20;

int i = 0;

JSONArray sceneImageObjs;
int sceneImageCount;

JSONObject sceneImageObj;
String sceneImagePath, sceneText;
float sceneImageDisplayDuration = 0;
PImage sceneImage;

void setup() {

  // TODO: Verify if code renders fine on mirror 
  // size(665, 686);
  fullScreen();
  // size(3024, 1964);

  // set up background image
  background = loadImage("background_main_v2.png");  // TODO: TO BE REPLACED
  background.resize(width, height); // RESIZE EVERY IMAGE TO BE PLACED IN THE BACKGROUND!!!
  
  imageMode(CENTER);
  
  // set up opening screen GIF
  openingAnimation = new Gif(this, "images/1_opening_scene/opening_animation.gif");

  storyObjJson = loadJSONObject("story_breakdown.json");

  // Set up custom font.
  customFont = createFont("Montserrat-Bold.ttf", 48); // Load custom font
  textFont(customFont);
  
  rightKeyPressed = false;
  leftKeyPressed = false;
  startTimeSet = false;
  
  maxTextWidth = width * 0.8; // Max width for text wrapping (80% of canvas width)
  
  startTime = 0;
  exitTime = 0;
  
  // Start experience with "intro" scene.
  scene = "intro-scene";
}

void draw() {

  switch (scene) {
    // OPENING SCENE
    case "intro-scene":

      // Set up background image and foreground crab animation
      image(background, width/2, height/2);
  
      openingAnimation.play();
      image(openingAnimation, width/2, height/2-60);

      JSONObject sceneJsonObj = getSceneJsonObj("intro-scene");
      
      // Parse stating message from JSON and print on screen
      startingText = sceneJsonObj.getString("startingText");
      printMessage(width/8, height/2+50, 64, 0, maxTextWidth, startingText);
      
      JSONArray buttonArray = sceneJsonObj.getJSONArray("actions");
      JSONObject rightButton = buttonArray.getJSONObject(0);
      JSONArray rightButtonImageSet = rightButton.getJSONArray("RIGHT");
      String buttonImgPath = rightButtonImageSet.getString(0);
      PImage buttonImg = loadImage(buttonImgPath);
      image(buttonImg, 2*width/3, height-height/6);

      if (rightKeyPressed) {
        scene = "act-one-scene-one-start-screen";
        rightKeyPressed = false;
      }
  
      break;
      
    // ACT ONE, SCENE ONE -- START SCREEN
    case "act-one-scene-one-start-screen": 
        background(242, 197, 0, 10); // GA Yellow
        
        sceneJsonObj = getSceneJsonObj("act-one-scene-one");
      
        // Parse stating message from JSON and print on screen
        startingText = sceneJsonObj.getString("startingText");
      
        printMessage(width/8, height/2-10, 64, 0, maxTextWidth, startingText);
        
        // Pause for 3s on this screen
        createDelay(3.0);
        if (checkDelayCompletion()) {
           scene = "act-one-scene-one-visual-section";
        }        
        break;
    
    // ACT ONE, SCENE ONE -- HOLLY LAYS HER EGGS
    case "act-one-scene-one-visual-section":
         background(0, 0, 0, 10); // Black
        
        sceneJsonObj = getSceneJsonObj("act-one-scene-one");

        sceneImageObjs = sceneJsonObj.getJSONArray("images");
        sceneImageCount = sceneJsonObj.getInt("imageCount");
        
        if (sceneImageDisplayDuration != 0) {
            createDelay(sceneImageDisplayDuration);
            if (sceneText != "") {
                printMessage(width/8, 2*height/3, 20, 0, width*0.75, sceneText);
              }
            for(; ;) {
              if (checkDelayCompletion()) {
                break;
              }
              println("Waiting for pause to end...", sceneImageObj);
            }
            i++;
            sceneImageDisplayDuration = 0;
        }

        if (i < sceneImageObjs.size()) {
            sceneImageObj = sceneImageObjs.getJSONObject(i);
            sceneImagePath = sceneImageObj.getString("filepath");
            sceneText = sceneImageObj.getString("accompanyingText");
            sceneImageDisplayDuration = sceneImageObj.getFloat("displayDuration");

             sceneImage = loadImage(sceneImagePath);
            //sceneImage = loadImage("background_main_v2.png");
            // sceneImage.resize(width/2, height/2);
            println("Found image! ", sceneImagePath);
            image(sceneImage, width/2, 0, width/2, height/2);
        } else {
            // change scene
            scene = "act-one-scene-two-start-screen";
            
            i = 0;
            sceneImageDisplayDuration = 0;
        }       
      
      break;
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    rightKeyPressed = true;
  } else if (keyCode == LEFT) {
    leftKeyPressed = true;
  }  
}

// Create a delay in seconds
void createDelay(float seconds) {
    if (!startTimeSet) {
      startTime = millis();
      startTimeSet = true;
      
      exitTime = startTime + seconds*1000;
      println("startTime", startTime);
      println("Seconds", seconds);
      println("Exit time", exitTime);
    }   
}

boolean checkDelayCompletion() {
    if (exitTime != 0 && millis() >= exitTime) {
        startTimeSet = false;
        startTime = 0;
        exitTime = 0;
        println("Delay complete", millis());
        return true;
    } else {
      return false;
    } 
}

JSONObject getSceneJsonObj(String scene) {
    return storyObjJson.getJSONObject(scene);
}

void printMessage(int startPositionX, int startPositionY, int textSize, int textColor, float maxTextBoxWidth, String message) {
// Split text into wrapped lines
  String[] wrappedLines = wrapText(message, maxTextBoxWidth);
  
  // Calculate total height needed for text
  float lineHeight = textAscent() + textDescent();
  // float lineHeight = 64;
  float textBlockHeight = wrappedLines.length * lineHeight + padding * 2;
  
  // Position the background box
  //float boxX = (width - maxTextWidth) / 2;
  //float boxY = height - textBlockHeight - 40; // Position towards the bottom
  
  float boxX = startPositionX;
  float boxY = startPositionY; // Position towards the bottom
  
  // Draw semi-transparent background box
  fill(0, 0, 0, 180); // Black box with transparency
  rect(boxX, boxY, maxTextBoxWidth, textBlockHeight, 10); // Rounded edges
  
  // Draw wrapped text inside the box
  fill(255); // White text
  // textAlign(CENTER, CENTER);
  textSize(textSize);
  float textY = boxY + padding;
  for (String line : wrappedLines) {
    text(line, boxX + padding, textY, boxX+maxTextWidth-padding, boxY+textBlockHeight-padding);
    textY += lineHeight;
  }  
}

/*
void printMessage(int startPositionX, int startPositionY, int noOfLines, int textColor, int printDelayInMs, String message) {
  //   fill(textColor);
  //   textSize(textSize);
  
  // Set rectangle size based on text width
  float padding = 24;
  float textWidthSize = textWidth(message) + padding * 2;
  float textHeightSize = noOfLines*64;
  
  // Position for rectangle
  float x = (width - textWidthSize) / 2;
  float y = height - startPositionY;

  // Draw semi-transparent background box
  fill(0, 0, 0, 180); // Black box with transparency
  rect(x, y, textWidthSize, textHeightSize, 10); // Rounded edges

  // Draw white caption text
  fill(255); 
  textAlign(CENTER, CENTER);
  text(message, width / 2, y + textHeightSize / 2, width/2, height/2);

  /*int startPosition = startPositionX;
  for (int i = 0; i < message.length(); i++) {
    text(message.charAt(i), startPosition, startPositionY);
    // textWidth() spaces the characters out properly.
    startPosition += textWidth(message.charAt(i));
    delay(printDelayInMs);
  }
  
} */

// Function to wrap text based on max width
String[] wrapText(String text, float maxWidth) {
  String[] words = text.split(" ");
  String line = "";
  ArrayList<String> lines = new ArrayList<String>();
  
  for (String word : words) {
    String testLine = line + word + " ";
    if (textWidth(testLine) > maxWidth) {
      lines.add(line.trim());
      line = word + " ";
    } else {
      line = testLine;
    }
  }
  lines.add(line.trim()); // Add the last line
  
  return lines.toArray(new String[0]);
}
