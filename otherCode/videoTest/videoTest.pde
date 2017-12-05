/* Basic Camera Effects Demo
 * Ben Norskov`
 * 
 * Use '-' and '=' for blur
 * Use '[' and ']' for brightness
 * Use 'e' and 'r' for Red
 * Use 'f' and 'g' for Green
 * Use 'v' and 'b' for Blue
 * Use SPACE to reset
 * Use q to save an image (This can be spammed! Be careful!)
 *
 */
import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture video;
PImage src;

int blurAmount = 2;
int brightness = 0;
int redTint = 255;
int blueTint = 255;
int greenTint = 255;

boolean keyHandler[] = new boolean[255];

void setup() {
  size(640, 480, P2D);

  video = new Capture(this, 640, 480);
  video.start();

  opencv = new OpenCV(this, 640, 480);
  opencv.useColor();
}

void draw() {
  // Read last captured frame
  if (video.available()) {
    video.read();
  }

  // Load the new frame of our camera in to OpenCV
  opencv.loadImage(video);

  // Apply image effects
  if (blurAmount > 0) opencv.blur(blurAmount);  
  opencv.brightness(brightness);

  //Grab frame after image effects are processed
  src = opencv.getSnapshot();

  //Tint and draw to the screen
  tint(redTint, greenTint, blueTint);
  image(src, 0, 0);

  // Figure out which keys have been pressed lately
  handleKeys();
}

// Keyboard control
void keyPressed() {
  if (key < keyHandler.length) {
    keyHandler[key] = true;
  }
}
void keyReleased() {
  if (key < keyHandler.length) {
    keyHandler[key] = false;
  }
}

void handleKeys() {
  if (keyHandler['=']) {
    blurAmount++;
  }
  if (keyHandler['-']) {
    blurAmount--;
  }
  if (keyHandler[']']) {
    brightness++;
  }
  if (keyHandler['[']) {
    brightness--;
  }
  if (keyHandler[' ']) {
    reset();
  }
  // ———————  // ———————  // ——————— Tint Control
  if (keyHandler['r']) {
    redTint++;
  }
  if (keyHandler['e']) {
    redTint--;
  }
  if (keyHandler['g']) {
    greenTint++;
  }
  if (keyHandler['f']) {
    greenTint--;
  }
  if (keyHandler['b']) {
    blueTint++;
  }
  if (keyHandler['v']) {
    blueTint--;
  }
  if (keyHandler['q']) {
    saveFrame("screen-######.png");
    keyHandler['q'] = false;
  }

  keepEffectsWithinRange();
}

void keepEffectsWithinRange() {
  // Sketch crashes without limits
  blurAmount = max(blurAmount, 0);
  redTint = constrain(redTint, 0, 255);
  greenTint = constrain(greenTint, 0, 255);
  blueTint = constrain(blueTint, 0, 255);
}
void reset() {
  // Sometimes it's nice to reset and start over 
  blurAmount = 0;
  brightness = 0;
  redTint = 255;
  greenTint = 255;
  blueTint = 255;
}