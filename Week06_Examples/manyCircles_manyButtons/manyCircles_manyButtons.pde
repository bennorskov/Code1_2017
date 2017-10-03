int numCircles = 5;
float[] circleX = new float[numCircles];
float[] circleY = new float[numCircles];
float[] circleXSpeed = new float[numCircles];
float[] circleYSpeed = new float[numCircles];
float circleDiameter = 20;
float circleRadius = circleDiameter/2;
float maxSpeed = 4;

int numBoxes = 5;
int[] boxX = new int[numBoxes];
int[] boxY = new int[numBoxes];
int[] boxW = new int[numBoxes];
int[] boxH = new int[numBoxes];
boolean[] foundBox = new boolean[numBoxes];
int boxWMin = int(circleDiameter);
int boxHMin = int(circleDiameter);
int boxWMax = 200;
int boxHMax = 200;

void setup() {
  size(500, 800);
  //fill starting positions and speeds randomly
  for(int i = 0; i<numCircles; i++) {
    circleX[i] = random(width);
    circleY[i] = random(height);
    circleXSpeed[i] = random(-maxSpeed, maxSpeed);
    circleYSpeed[i] = random(-maxSpeed, maxSpeed);
  }
  
  for(int i = 0; i<numBoxes; i++) {
    boxX[i] = int(random(width));
    boxY[i] = int(random(width));
    boxW[i] = int(random(boxWMin, boxWMax));
    boxH[i] = int(random(boxHMin, boxHMax));
    foundBox[i] = true;
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
    for (int boxIter = 0; boxIter<numBoxes; boxIter++) {
      // Sides:
      if ((circleY[i] > boxY[boxIter]) && (circleY[i] < boxY[boxIter] + boxH[boxIter])) {
        // Left Side
        if ((circleX[i] > boxX[boxIter] - circleRadius) && (circleX[i] < boxX[boxIter] + boxW[boxIter])){
          circleX[i] = boxX[boxIter] - circleRadius;
          circleXSpeed[i] *= -1;
          foundBox[boxIter] = !foundBox[boxIter];
        }else if ((circleX[i] < boxX[boxIter] + boxW[boxIter] + circleRadius) && (circleX[i] > boxX[boxIter])){
          // right side
          circleX[i] = boxX[boxIter] + circleRadius + boxW[boxIter];
          circleXSpeed[i] *= -1;
          foundBox[boxIter] = !foundBox[boxIter];
        }
      }else if ((circleX[i] > boxX[boxIter]) && (circleX[i] < boxX[boxIter] + boxW[boxIter])) {
        // Top
        if ((circleY[i] > boxY[boxIter] - circleRadius) && (circleY[i] < boxY[boxIter] + boxH[boxIter])){
          circleY[i] = boxY[boxIter] - circleRadius;
          circleYSpeed[i] *= -1;
          foundBox[boxIter] = !foundBox[boxIter];
        }else if ((circleY[i] < boxY[boxIter] + boxH[boxIter] + circleRadius) && (circleY[i] > boxY[boxIter])){
          //bottom
          circleY[i] = boxY[boxIter] + circleRadius + boxH[boxIter];
          circleYSpeed[i] *= -1;
          foundBox[boxIter] = !foundBox[boxIter];
        }
      }
    }
  }
  for (int i = 0; i < numBoxes; i++) {
    if (foundBox[i] == true) {
      rect(boxX[i], boxY[i], boxW[i], boxH[i]);
    }
  }
}

void mousePressed() {
  for (int i = 0; i < numBoxes; i++) {
    if ((mouseX > boxX[i]) && (mouseX < boxX[i] + boxW[i]) && (mouseY > boxY[i]) && (mouseY < boxY[i] + boxH[i])) {
      foundBox[i] = !foundBox[i];
    } 
  }
}