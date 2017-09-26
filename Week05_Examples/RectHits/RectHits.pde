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
  frameRate(50);
}

void draw() {
  background(200);
  elX += elXSpeed;
  elY += elYSpeed;

  // rect collision detection
  if ((elX > rectX - elW/2) && (elY > rectY - elW/2) && 
      (elY < rectY + rectH + elW/2) && (elX < rectX + rectW + elW/2)
  ) {
    if (elX < rectX){
      // if on the sides, change x Speed
      elXSpeed *= -1;
      elX = rectX - elW/2;
    } else if(elX > rectX + rectW) {
      elXSpeed *= -1;
      elX = rectX + rectW + elW/2;
    } else if (elY < rectY) {
      elYSpeed *= -1;
      elY = rectY - elW/2;
    } else {
      elYSpeed *= -1;
      elY = rectY + rectH + elW/2;
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