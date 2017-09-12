boolean drawASquare = false;
void setup() {
  size(400, 400);
}
void draw() {
  background(200);
  if (drawASquare == true) {
    rect(200, 200, 100, 100);
  }
  line(200, 0, 200, 400);
  line(0, 200, 400, 200);
  if (mouseX > 200) {
    if (mouseY < 200) {
      println(mouseX, mouseY);
    }
  }
}
void mouseClicked() {
  if (drawASquare == true) {
    drawASquare = false;
  } else if (drawASquare == false) {
    drawASquare = true;
  }
  // drawASquare = !drawASquare; // same as five lines above
}