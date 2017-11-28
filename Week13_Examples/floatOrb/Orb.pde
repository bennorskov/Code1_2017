class Orb {
  PVector pos;

  boolean isFloating = false;
  int startFloatTime = 0;
  int floatDuration = 4500;

  float floatOffset = 20;
  float originalY;
  float easing = .1;
  float colorPosition = 0;

  float heightD = 40;
  float squishAmount = 30;
  float widthD = 40;

  color drawColor = color(100, 100, 150);
  color activeColor = color(250, 100, 150);
  Orb(float x, float y) {
    pos = new PVector(x, y);
    originalY = pos.y;
  }
  void update() {
    color currentColor; 
    if (isFloating) {
      colorPosition += (1-colorPosition) * easing;
      currentColor = lerpColor(drawColor, activeColor, colorPosition);
      pos.y += ((originalY - floatOffset) - pos.y) * easing;
      heightD += (squishAmount - heightD) * easing;
    } else {
      colorPosition += (0-colorPosition) * easing;
      currentColor = lerpColor(drawColor, activeColor, colorPosition);
      pos.y += (originalY - pos.y) * easing;
      heightD += (widthD - heightD) * easing;
    }
    fill(currentColor);
    ellipse(pos.x, pos.y, widthD, heightD);
    testToStopFloat();
  }
  void handleClick() {
    if (!isFloating) {
      startFloatTime = millis();
      isFloating = true;
    }
  }
  void testToStopFloat() {
    if (millis() > startFloatTime + floatDuration) {
      isFloating = false;
    }
  }
}