boolean isClicked = false;
void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  //if (isClicked == false) {
  if (!isClicked) { //this line is the same as above
    background(0, 0, 255);
  }
}

void mouseClicked() {
  isClicked = true;
}

void keyPressed() {
  isClicked = false;
}