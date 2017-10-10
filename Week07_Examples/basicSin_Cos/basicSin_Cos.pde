float countUpX = 0;
float countUpY = 0;
void setup() {
  rectMode(CENTER);
}
void draw() {
  //background(200);
  fill(200, 200, 200, 10);
  rect(50, 50, width, height);
  fill(255);
  rect( sin(countUpX) * 20 + 50, cos(countUpY) * 20 +50, 20, 20);
  countUpX -= .07;
  countUpY -= .08;
}