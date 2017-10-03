int numCircles = 300;
float[] circleX = new float[numCircles];
float[] circleY = new float[numCircles];
float[] circleXSpeed = new float[numCircles];
float[] circleYSpeed = new float[numCircles];
float circleDiameter = 20;

void setup() {
  size(500, 800);
  //fill starting positions and speeds randomly
  for(int i = 0; i<numCircles; i++) {
    circleX[i] = random(width);
    circleY[i] = random(height);
    circleXSpeed[i] = random(-2, 2);
    circleYSpeed[i] = random(-2, 2);
  }
}
void draw() {
  // background(200);
  for(int i = 0; i<numCircles; i++) {
    circleX[i] += circleXSpeed[i];
    circleY[i] += circleYSpeed[i];
    ellipse(circleX[i], circleY[i], circleDiameter, circleDiameter);
    
    //hit detection
    if (circleX[i] > width - circleDiameter/2) {
      circleXSpeed[i] *= -1;
      circleX[i] = width - circleDiameter/2;
    }
    if (circleY[i] > height - circleDiameter/2) {
      circleYSpeed[i] *= -1;
      circleY[i] = height - circleDiameter/2;
    }
    if (circleX[i] < circleDiameter/2) {
      circleXSpeed[i] *= -1;
      circleX[i] = circleDiameter/2;
    }
    if (circleY[i] < circleDiameter/2) {
      circleYSpeed[i] *= -1;
      circleY[i] = circleDiameter/2;
    }
  }
}