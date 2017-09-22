/*
  Code to talk about conditional hit detection
  Click to change the Y position of the circle
  (Note: the circle can get stuck behind the line
    Fix it by adding one more "&&" condition to the hit detection (line 27))
*/
float lineX = 250;
float lineY = 130;
float lineH = 40;

float elX = 120;
float elY = 150;
float elW = 15;
float elXSpeed = 4;
float elYSpeed = 0;

void setup() {
  size(400, 300);
}

void draw() {
  background(200);
  elX += elXSpeed;
  elY += elYSpeed;

  // bounce off of the line, but nothing else:
  if ((elX > lineX) && (elY > lineY) && (elY < lineY + lineH)) {
    // note I'm testing to see where the Y position of the circle is as well
    // I only want it to bounce if the X is beyond the side AND
    // the Y is between the top and bottom of the line
    elXSpeed *= -1;
  }

  //bounce off sides of screen:
  if ((elX > width) || (elX < 0)) {
    elXSpeed *= -1;
  }
  // I'm not going up and down, but if you change this and do:
  if ((elY > height) || (elY < 0)) {
    elYSpeed *= -1;
  }

  stroke(#89a310);
  strokeWeight(4);
  line(lineX, lineY, lineX, lineY + lineH);
  noStroke();
  fill(#0032a8);
  ellipse(elX, elY, elW, elW);
}

void mouseClicked() {
  if (elY == 150) {
    elY = 200;
  } else if (elY == 200) {
    elY = 100;
  } else {
    elY = 150;
  }
}