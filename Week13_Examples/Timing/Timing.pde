int timeUntilRed = 5000;
void setup() {
  size(200, 200);
}
void draw() {
  println(millis());
  if (millis() > timeUntilRed) {
    background(255, 0, 0);
  } else {
    background(0);
  }
}