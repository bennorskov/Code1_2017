float rectX = 250;
float rectY = 130;
float rectH = 120;
float rectW = 160;

float elX = 120;
float elY = 150;
float elW = 15;
float elXSpeed = 4;
float elYSpeed = 4;

void setup() {
  size(600, 300);
  noStroke();
}

void draw() {
  background(200);
  elX += elXSpeed;
  elY += elYSpeed;
 
  // rect collision detection
  if ((elX > rectX - elW/2) && (elY > rectY - elW/2) && (elY < rectY + rectH + elW/2) && (elX < rectX + rectW + elW/2)) {
    if ((elX < rectX) || (elX > rectX + rectW)) {
      // if on the sides, change x Speed
      elXSpeed *= -1;
    } else {
      //if not on the sides, you must be on the top or bottom, so change Y speed
      elYSpeed *= -1;
    }
  } 

  //bounce off sides of screen:
  if ((elX > width) || (elX < 0)) {
    elXSpeed *= -1;
  }
  if ((elY > height) || (elY < 0)) {
    elYSpeed *= -1;
  }

  //draw everything:
  fill(#f032a8);
  rect(rectX, rectY, rectW, rectH);
  
  fill(#0032a8);
  ellipse(elX, elY, elW, elW);
}

void mouseClicked() {
}