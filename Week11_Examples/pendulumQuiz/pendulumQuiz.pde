float penLength = 300;
float penX, penY, anchorX, anchorY;
float weightDiameter = 30;

float swingAmount = radians(20);
float angle = radians(90);

void setup() {
  size(500, 500);
  anchorX = width/2;
  anchorY = 100;
}
void draw() {
  background(200);
  noFill();
  ellipse(anchorX, anchorY, penLength*2, penLength*2);
  
  float currentAngle = angle + sin(frameCount * .1) * swingAmount;
  penX = cos(currentAngle)*penLength + anchorX;
  penY = sin(currentAngle)*penLength + anchorY;
  
  line(penX, penY, anchorX, anchorY);
  fill(40, 200, 255);
  ellipse(penX, penY, weightDiameter, weightDiameter);
}