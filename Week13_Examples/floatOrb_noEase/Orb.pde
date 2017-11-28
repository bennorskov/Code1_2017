class Orb {
  PVector pos;

  boolean isFloating = false;
  int startFloatTime = 0;
  int floatDuration = 1500;

  float floatOffset = 20;
  float originalY;

  float heightD = 40;
  float squishAmount = 30;
  float widthD = 40;

  color drawColor = color(100, 100, 150);
  color activeColor = color(200, 100, 150);
  
  Orb(float x, float y) {
    pos = new PVector(x, y);
    originalY = pos.y;
  }
  void update() {
    color currentColor; 
    if (isFloating) {
      currentColor = activeColor;
      pos.y = originalY - floatOffset;
      heightD = squishAmount;
    } else {
      currentColor = drawColor;
      pos.y = originalY;
      heightD = widthD;
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