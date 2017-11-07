float penLength = 300;
float penMass = 20;
PVector penPos, penVel, penAcc, anchorPos;
float springStrength = .2;
float weightDiameter = 30;
float gravity = 1;
float damping = .99;

boolean followMouse = false;

void setup() {
  size(500, 500);
  anchorPos = new PVector(width/2, 100);
  
  penPos = new PVector(200, 300);
  penVel = new PVector(0, 0);
}
void draw() {
  background(200);
  if (!followMouse) {
    penAcc = new PVector(0, gravity);
    float accX = -springStrength * (penPos.x - anchorPos.x);
    float accY = -springStrength * (penPos.y - anchorPos.y);
    
    penAcc.add(new PVector(accX/penMass, accY/penMass));
    penVel.mult(damping);
    penVel.add(penAcc);
    penPos.add(penVel);
  } else {
    penPos = new PVector(mouseX, mouseY);
  }
  
  noFill();
  line(penPos.x, penPos.y, anchorPos.x, anchorPos.y);
  fill(40, 200, 255);
  ellipse(penPos.x, penPos.y, weightDiameter, weightDiameter);
}

void mousePressed() {
  if (!followMouse && dist(mouseX, mouseY, penPos.x, penPos.y) < weightDiameter) {
    followMouse = true;
  } else if (followMouse) {
    followMouse = false;
    penVel = new PVector(0, 0);
  }
}