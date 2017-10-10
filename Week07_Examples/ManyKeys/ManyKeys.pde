boolean fKeyDown = false;
boolean gKeyDown = false;
void setup() {}
void draw() {
  background(200);
  if (fKeyDown) {
    ellipse(20, 20, 100, 40);
  }
  if (gKeyDown) {
    rect(50, 50, 300, 100);
  }
}
void keyPressed() {
  if (key == 'f') {
    fKeyDown = true;
  }
  if (key == 'g') {
    gKeyDown = true;
  }
}
void keyReleased() {
  if (key == 'f') {
    fKeyDown = false;
  }
  if (key == 'g') {
    gKeyDown = false;
  }
}