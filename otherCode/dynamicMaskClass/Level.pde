class Level {
  float[] yValues; 
  float inc, dx, period, amplitude, theta;
  int xspacing = 6;

  PImage imageToMask;
  PGraphics mask;
  float imageX, imageY;

  Level(float yPos, String imageName, int amp, float iX, float iY) {
    inc = yPos;
    period = 400;
    dx = (TWO_PI/ period) * xspacing;  
    amplitude = amp;
    yValues = new float[width/xspacing];
    theta = 0;
    imageX = iX;
    imageY = iY;
    imageToMask = loadImage(imageName);
    mask = createGraphics(imageToMask.width, imageToMask.height);
  }

  void drawToMask() {
    theta += 0.3;
    float x = theta;

    mask.beginDraw();
    mask.fill(255);
    mask.noStroke();
    for (int i = 0; i < yValues.length; i++) {
      yValues[i] = inc + sin(x)*(amplitude + 20);
      x+= dx;
      theta += 0.003;
      mask.ellipse(x, yValues[i] + 200, 100, 100);
    }
    mask.endDraw(); // you forgot to put this in your code! 
    imageToMask.mask(mask);
    image(imageToMask, imageX, imageY);
  }

  void renderWave() {
    fill(102, 82, 40);
    noStroke();
    for (int i = 0; i < yValues.length; i++) {
      ellipse(i*xspacing, height/3+yValues[i], 15, 15);
    }
  }
}