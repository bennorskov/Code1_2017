float angle = 60;
float lerpAmount = 0;
float lerpStep = .01;

void setup() {
  size(300, 200);
}
void draw() {
  background(100);
  float newAngle = lerp(0, 60, lerpAmount);
  lerpAmount += lerpStep;
  if (lerpAmount > 1) {
    lerpAmount = 1;
    lerpStep = -lerpStep;
  }
  if (lerpAmount < 0) {
    lerpAmount = 0;
    lerpStep = -lerpStep;
  }
  translate(150, 100);
  rotate(radians(newAngle));
  ellipse(80, 0, 40, 40);
  line(0, 0, 80, 0);
}