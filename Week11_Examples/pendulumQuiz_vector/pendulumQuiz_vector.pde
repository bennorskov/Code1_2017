PVector pos, anchor;
float penLength = 300;
float weightDiameter = 30;
float restAngle = 90;
float angleOffset = 20;

void setup() {
  smooth();
  size(500, 500);
  anchor = new PVector(width/2, 100);
}

void draw() {
  background(200);
  
  float tempAngle = restAngle + sin(frameCount*.1)*angleOffset;
  pos = PVector.fromAngle(radians(tempAngle));
  pos.mult(penLength);
  pos.add(anchor);
  
  noFill();
  ellipse(anchor.x, anchor.y, penLength*2, penLength*2);
  line(pos.x, pos.y, anchor.x, anchor.y);
  fill(40, 200, 255);
  ellipse(pos.x, pos.y, weightDiameter, weightDiameter);
}