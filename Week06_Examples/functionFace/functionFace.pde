void setup() {
  size(400, 500);
  smooth();
  noStroke();
}

void draw() {
  background(200);
  for (int i = 0; i<width; i+= 101) {
    drawFace(i, 40);
  }
  
  // other stuff
}

void drawFace(int x, int y) {
  fill(255);
  rect(x, y, 100, 100);
  fill(100);
  ellipse(x + 20, y + 20, 10, 10);
  ellipse(x + 80, y + 20, 10, 10);
  if (x < width/2) drawNose(x, y);
}

void drawNose(int x, int y) {
  //code to draw a nose
  triangle(x + 50, y + 50, x + 40, y + 60, x + 60, y + 60);
}