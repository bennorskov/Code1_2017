int timeUntilRed = 2000;
int lastRedTime = 0;
void setup() {
  size(200, 200);
}

void draw() {
  if (millis() > lastRedTime + timeUntilRed) {
    background(255, 0, 0);
  } else {
    background(0);
  }
}
 
void mouseClicked() {
  // only change if the screen is red
  if (millis() > lastRedTime + timeUntilRed) {
    lastRedTime = millis();
  }
}