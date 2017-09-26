// breakout without classes

// brick 1
float rectX = 190;
float rectY = 70;
float rectW = 100;
float rectH = 50;
boolean drawBrick1 = true;
//brick 2
float rectX2 = 90;
float rectY2 = 270;
float rectW2 = 100;
float rectH2 = 50;
boolean drawBrick2 = true;

// paddle
float paddleX = 160;
float paddleY = 550;
float paddleW = 80;
float paddleH = 10;
float paddleMove = 10;

// circle
float elX = 30;
float elY = 50;
float elW = 25;
float elXSpeed = 4;
float elYSpeed = 4;

void setup() {
  size(400, 600);
}
void draw() {
  background(200);
  elX += elXSpeed;
  elY += elYSpeed;

  // ——————— ——————— ——————— bounce off walls:
  if (elX + elW*.5 > width) {
    elXSpeed *= -1;
    elX = width - elW*.5;
  }
  if (elX - elW*.5 < 0) {
    elXSpeed *= -1;
    elX = elW*.5;
  }
  if (elY + elW*.5 > height) {
    elYSpeed *= -1;
    elY = height - elW*.5;
  }
  if (elY - elW*.5 < 0) {
    elYSpeed *= -1;
    elY = elW*.5;
  }

  // —————— —————————— —————— paddle Collision
  if (
    (elX > paddleX)&&
    (elX < paddleX + paddleW) &&
    (elY > paddleY) &&
    (elY < paddleY + paddleW)
    ) {
    elYSpeed *= -1;
    // I'm not accounting for tunneling; it'll look funky sometimes 
  }

  // —————— —————————— —————— brick 1 Collision
  if (
    (drawBrick1) &&
    (elX > rectX)&&
    (elX < rectX + rectW) &&
    (elY > rectY) &&
    (elY < rectY + rectH)
    ) {
    if ((elY + elW*.5 > rectY + rectH) || (elY - elW*.5 < rectY)) {
      elYSpeed *= -1;
    } else {
      elXSpeed *= -1;
      // note: this isn't perfect, but it's good enough
      // I'm not accounting for tunneling 
    }
    drawBrick1 = false;
  }
  // —————— —————————— —————— brick 2 Collision
  if (
    (drawBrick2) &&
    (elX > rectX2)&&
    (elX < rectX2 + rectW2) &&
    (elY > rectY2) &&
    (elY < rectY2 + rectH2)
    ) {
    if ((elY + elW*.5 > rectY2 + rectH2) || (elY - elW*.5 < rectY2)) {
      elYSpeed *= -1;
    } else {
      elXSpeed *= -1;
    }
    drawBrick2 = false;
  }

  // —————— —————————— —————— move paddle
  if (keyPressed) {
    if (keyCode == 37) { //left arrow key
      paddleX -= paddleMove;
    }
    if (keyCode == 39) { //right arrow key
      paddleX += paddleMove;
    }
    // keep the paddle on screen. https://processing.org/reference/constrain_.html
    paddleX = constrain(paddleX, 0, width - paddleW);
  }
  
  // ——————— ———————— ——————— ————— Draw everything!
  fill(#99ff9f);
  ellipse(elX, elY, elW, elW);
  fill(#0000ff);
  rect(paddleX, paddleY, paddleW, paddleH);
  if (drawBrick1) {
    fill(#24900a);
    rect(rectX, rectY, rectW, rectH);
  }
  if (drawBrick2) {
    fill(#a5810f);
    rect(rectX2, rectY2, rectW2, rectH2);
  }
}