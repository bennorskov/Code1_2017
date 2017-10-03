int numCircles = 5;
float[] circleX = new float[numCircles];
float[] circleY = new float[numCircles];
float[] circleXSpeed = new float[numCircles];
float[] circleYSpeed = new float[numCircles];
float circleDiameter = 20;
float circleRadius = circleDiameter/2;
float maxSpeed = 4;

int boxX = 150;
int boxY = 250;
int boxW = 200;
int boxH = 300;
boolean foundBox = false;

void setup() {
  size(500, 800);
  //fill starting positions and speeds randomly
  for(int i = 0; i<numCircles; i++) {
    circleX[i] = random(width);
    circleY[i] = random(height);
    circleXSpeed[i] = random(-maxSpeed, maxSpeed);
    circleYSpeed[i] = random(-maxSpeed, maxSpeed);
  }
}
void draw() {
   background(200);
  for(int i = 0; i<numCircles; i++) {
    circleX[i] += circleXSpeed[i];
    circleY[i] += circleYSpeed[i];
    ellipse(circleX[i], circleY[i], circleDiameter, circleDiameter);
    
    //hit detection
    if (circleX[i] > width - circleRadius) {
      circleXSpeed[i] *= -1;
      circleX[i] = width - circleRadius;
    }
    if (circleY[i] > height - circleRadius) {
      circleYSpeed[i] *= -1;
      circleY[i] = height - circleRadius;
    }
    if (circleX[i] < circleRadius) {
      circleXSpeed[i] *= -1;
      circleX[i] = circleRadius;
    }
    if (circleY[i] < circleRadius) {
      circleYSpeed[i] *= -1;
      circleY[i] = circleRadius;
    }
    
    // ——————————— // ——————————— // ———————————  box hit detection
    // Sides:
    if ((circleY[i] > boxY) && (circleY[i] < boxY + boxH)) {
      // Left Side
      if ((circleX[i] > boxX - circleRadius) && (circleX[i] < boxX + boxW)){
        circleX[i] = boxX-circleRadius;
        circleXSpeed[i] *= -1;
        foundBox = !foundBox;
      } else if ((circleX[i] < boxX + boxW + circleRadius) && (circleX[i] > boxX)){
        circleX[i] = boxX+circleRadius+boxW;
        circleXSpeed[i] *= -1;
        foundBox = !foundBox;
      }
    } else if ((circleX[i] > boxX) && (circleX[i] < boxX + boxW)) {
      // Top
      if ((circleY[i] > boxY - circleRadius) && (circleY[i] < boxY + boxH)){
        circleY[i] = boxY-circleRadius;
        circleYSpeed[i] *= -1;
        foundBox = !foundBox;
      } else if ((circleY[i] < boxY + boxH + circleRadius) && (circleY[i] > boxY)){
        //Bottom
        circleY[i] = boxY + circleRadius + boxH;
        circleYSpeed[i] *= -1;
        foundBox = !foundBox;
      }
    }
  }
  if (foundBox == true) {
    rect(boxX, boxY, boxW, boxH);
  }
}

void mousePressed() {
  if ((mouseX > boxX) && (mouseX < boxX + boxW) && (mouseY > boxY) && (mouseY < boxY + boxH)) {
    foundBox = !foundBox;
  } 
}