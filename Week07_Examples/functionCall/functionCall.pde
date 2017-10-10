void setup() {
  size(200, 200);
}
void draw() {
  background(#3265E3);
  drawFace();
}

void drawFace() {
  fill(#E3CF32);
  ellipse(width/2, height/2, width-10, height-10);
  drawEyes();
  drawMouth();
}

void drawEyes() {
  fill(0);
  ellipse(50, 70, 25, 25);
  ellipse(150, 70, 25, 25);
}

void drawMouth() {
  noFill();
  arc(width/2, 100, 130, 100, PI/7, PI-PI/7);
}