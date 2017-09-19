boolean isClicked = false;
void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  if (isClicked) {
    background(0, 0, 255);
  }
}

void mouseClicked() {
  isClicked = true;
}

void keyPressed() {
  isClicked = false;
}