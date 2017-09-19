// ellipse Variables
float elX = 30;
float elY = 40;
float elDiameter = 20;
float elXSpeed = 4;
float elYSpeed = 2;

// bounds to bounce off of
float bottom = 300;
float top = 100;
float rightSide = 350;
float leftSide = 230;

void setup() {
  size(500, 400);
}
void draw() {
  background(200);
  
  // move and draw the circle
  elX += elXSpeed;
  //elY += elYSpeed; //same as below
  elY = elY + elYSpeed;
  ellipse(elX, elY, elDiameter, elDiameter);

  // top and bottom hit detection
  if (elY > bottom) {
    // move up if you go past the line
    elYSpeed = elYSpeed * -1;
    elY = bottom;
  }
  if (elY < top) {
    elYSpeed = elYSpeed * -1;
    elY = top;
  }
  
  // left and right hit detection
  if (elX > rightSide) {
    elXSpeed *= -1;
    elX = rightSide;
  }
  if (elX < leftSide) {
    elXSpeed = elXSpeed * -1;
    elX = leftSide;
  }
  
  //draw bounds
  line(0, bottom, width, bottom);
  line(0, top, width, top);
  line(leftSide, 0, leftSide, height);
  line(rightSide, 0, rightSide, height);
}