#include <Keyboard.h>
#include <Adafruit_CircuitPlayground.h>

void setup() {
  Serial.begin(9600);
  delay(5000); // Safety delay before HID starts

  CircuitPlayground.begin();
  Keyboard.begin();
}

void loop() {
  // --- Touch A1 → Right arrow ---
  int capA1 = CircuitPlayground.readCap(A1);
  Serial.print("A1: ");
  Serial.println(capA1);
  if (capA1 > 1000) {
    sendKeyWithFeedback(KEY_RIGHT_ARROW, 0, 0, 255); // Blue 1
  }

  // --- Touch A2 → Left arrow ---
  int capA2 = CircuitPlayground.readCap(A2);
  Serial.print("A2: ");
  Serial.println(capA2);
  if (capA2 > 1000) {
    sendKeyWithFeedback(KEY_LEFT_ARROW, 0, 0, 255); // Blue 2
  }

  // --- Touch A3 → X ---
  int capA3 = CircuitPlayground.readCap(A3);
  Serial.print("A3: ");
  Serial.println(capA3);
  if (capA3 > 1000) {
    sendKeyWithFeedback('x', 255, 0, 0); // Purple
  }

  // --- Touch A4 → G ---
  int capA4 = CircuitPlayground.readCap(A4);
  Serial.print("A4: ");
  Serial.println(capA4);
  if (capA4 > 1000) {
    sendKeyWithFeedback('g', 0, 255, 0); // Purple
  }

  // --- Touch A5 → S ---
  int capA5 = CircuitPlayground.readCap(A5);
  Serial.print("A5: ");
  Serial.println(capA5);
  if (capA5 > 1000) {
    sendKeyWithFeedback('s', 255, 255, 0); // Purple
  }

  delay(100);
}

// Function to send key, light pixel, and play tone
void sendKeyWithFeedback(uint8_t keyCode, uint8_t r, uint8_t g, uint8_t b) {
  Keyboard.press(keyCode);
  CircuitPlayground.clearPixels();
  CircuitPlayground.setPixelColor(0, r, g, b); // Light up pixel 0

  // CircuitPlayground.playTone(440, 100); // 440Hz tone for 100ms

  if (keyCode == KEY_RIGHT_ARROW) {
    CircuitPlayground.playTone(523, 150); // 440Hz tone for 100ms
  }

  if (keyCode == KEY_LEFT_ARROW) {
    CircuitPlayground.playTone(330, 150); // 440Hz tone for 100ms
  }

  if (keyCode == 'g') {
    CircuitPlayground.playTone(880, 100); // 440Hz tone for 100ms
  }

  if (keyCode == 's') {
    CircuitPlayground.playTone(660, 75); // 440Hz tone for 100ms
    CircuitPlayground.playTone(880, 75); // 440Hz tone for 100ms
  }

  if (keyCode == 'x') {
    CircuitPlayground.playTone(880, 100); // 440Hz tone for 100ms
    CircuitPlayground.playTone(440, 100); // 440Hz tone for 100ms
  }
  
  delay(100);
  Keyboard.release(keyCode);
  CircuitPlayground.clearPixels();
}
