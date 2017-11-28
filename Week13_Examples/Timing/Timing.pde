int timeUntilRed = 1500;
void setup() {
  size(200, 200);
}

void draw() {
  if (millis() > timeUntilRed) {
    background(255, 0, 0);
  } else {
    background(0);
  }
}