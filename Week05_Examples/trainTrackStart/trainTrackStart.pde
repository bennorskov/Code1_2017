// traintracks

float trackX = 40;
float trackY = 20;
float trackSpeed = 2.3;

void setup() {
  size(80, 400);
  strokeWeight(4);
}

void draw() {
  background(200);
  trackY += trackSpeed;
  line(trackX - 10, trackY - 10, trackX -10, trackY+10);
  line(trackX - 10, trackY, trackX + 10, trackY);
  line(trackX + 10, trackY - 10, trackX + 10, trackY+10);
  
  if (trackY > height) {
    trackY = 0;
  }
}