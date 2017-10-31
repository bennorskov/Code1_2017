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
    //draw particles on screen
    boolean allOffScreen = true;
    for (int i = 0; i<numParticles; i++) {
      parts[i].move();
      //reset algorithm
      if (parts[i].y < height) {
        //if any particle is onscreen, don't reset
        allOffScreen = false;
      }
    }
    if (allOffScreen) {
      //if all off screen, then reset the particles
      drawParticles = false;
      //buttonX = random(width);
      //buttonY = random(height);
    }
  }else{
    //rollover code
    if (dist(mouseX, mouseY, buttonX, buttonY) < buttonDiameter/2) {
      fill(255, 180, 0);
    } else {
      fill(50);
    }
    ellipse(buttonX, buttonY, buttonDiameter, buttonDiameter);
  }
}
void mousePressed() {
  if (dist(mouseX, mouseY, buttonX, buttonY) < buttonDiameter/2 && !drawParticles) {
    drawParticles = true;
    for (int i = 0; i<numParticles; i++) {
      parts[i] = new Particle();
    }
  }
}