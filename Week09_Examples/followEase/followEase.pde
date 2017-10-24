float xPos, yPos;
float targetX, targetY;

float easeAmount = .12;
void setup() {
  size(400, 400);
  xPos = random(width);
  yPos = random(height);
}

void draw() {
  background(200);
  ellipse(xPos, yPos, 30, 30);
  // get the distance
  // move a percentage of that amount each frame
  
  xPos += (targetX - xPos) * easeAmount;
  yPos += (targetY - yPos) * easeAmount;
}

void mousePressed() {
  targetX = mouseX;
  targetY = mouseY;
}