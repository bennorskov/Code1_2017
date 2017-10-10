float countUp = 0;
void setup() {
  rectMode(CENTER);
}
void draw() {
  background(200);
  rect( sin(countUp) * 20 + 50, 50, 20, 20);
  countUp += .1;
}