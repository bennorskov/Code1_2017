int numParticles = 200;
Particle[] parts = new Particle[numParticles];

float buttonX, buttonY, buttonDiameter;

boolean drawParticles = false;
void setup() {
  size(800, 600);
  buttonX = width/2;
  buttonY = 200;
  buttonDiameter = 60;
  noStroke();
}
void draw() {
  background(#0AF7BE);
  if (drawParticles) {
    boolean allOffScreen = true;
    for (int i = 0; i<numParticles; i++) {
      parts[i].move();
      if (parts[i].y < height) {
        allOffScreen = false;
      }
    }
    if (allOffScreen) {
      drawParticles = false;
    }
  }else{
    if (dist(mouseX, mouseY, buttonX, buttonY) < buttonDiameter/2) {
      fill(255, 150, 0);
    } else {
      fill(50);
    }
    ellipse(buttonX, buttonY, buttonDiameter, buttonDiameter);
  }
}
void mousePressed() {
  if (dist(mouseX, mouseY, buttonX, buttonY) < buttonDiameter/2) {
    drawParticles = true;
    for (int i = 0; i<numParticles; i++) {
      parts[i] = new Particle();
    }
  }
}