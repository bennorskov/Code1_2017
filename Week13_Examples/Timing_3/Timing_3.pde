int timeUntilRed = 2000;
int lastRedTime = 0;
boolean drawBlack;
void setup() {
  size(200, 200);
}

void draw() {
  if (!drawBlack) {
    background(255, 0, 0);
  } else {
    background(0);
  }
  
  if (millis() > lastRedTime + timeUntilRed) {
    drawBlack = !drawBlack;
    lastRedTime = millis();
  }
}