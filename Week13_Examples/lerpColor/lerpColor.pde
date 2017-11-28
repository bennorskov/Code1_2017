
void setup() {
  size(400, 400);
}
void draw() {
  color c = color(0, 100, 30);
  color c2 = color(200, 70, 100);
  
  float lerpAmount = map(mouseX, 0, width, 0, 1);
  background( lerpColor(c, c2, lerpAmount) );
}