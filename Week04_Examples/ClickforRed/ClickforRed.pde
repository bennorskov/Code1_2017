float rX = 200;
float rY = 150;
float rW = 50;
float rH = 30;

boolean useRed = false;

void setup() {
  size(500, 400);
}
void draw() {
  background(200);
  if (useRed == true) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  rect(rX, rY, rW, rH);
}
void mouseClicked() {
  if (useRed ==true) {
    useRed = false;
  } else {
    useRed = true;
  }
}