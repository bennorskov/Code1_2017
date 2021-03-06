void setup() {
  size(800, 200);
}
void draw() {
  background(#3265E3);
  for (int i = 50; i< width; i+=50) {
    drawFace(i, 100);
  }
}
void drawFace(float x, float y) {
  fill(#E3CF32);
  ellipse(x, y, 190, 190);
  drawEyes(x, y);
  drawMouth(x, y);
}
void drawEyes(float x, float y) {
  fill(0);
  ellipse(x-50, y-30, 25, 25);
  ellipse(x+50, y-30, 25, 25);
}
void drawMouth(float x, float y) {
  noFill();
  arc(x, y, 130, 100, PI/7, PI-PI/7);
}