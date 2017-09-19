float elX = 30;
float elY = 40;
float elDiameter = 20;

float elXSpeed = 2;
float elYSpeed = 2;

float lineY = 300;

void setup() {
  size(500, 400);
}

void draw() {
  background(200);
  elX += elXSpeed;
  elY += elYSpeed;
  ellipse(elX, elY, elDiameter, elDiameter);
  
  if (elY > lineY) {
    // move up if you go passed the line
    elYSpeed = elYSpeed * -1;
  }
  line(0, lineY, width, lineY);
}