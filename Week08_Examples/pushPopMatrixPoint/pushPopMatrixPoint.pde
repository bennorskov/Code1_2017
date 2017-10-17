PVector position;
void setup() {
  size(300, 400);
  position = new PVector(200, 300);
}

void draw() {
  background(#ff02ff);
  float angle = atan2(mouseY-position.y, mouseX-position.x);
  pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    triangle(0, 0, -20, -5, -20, 5);
  popMatrix();
  ellipse(mouseX, mouseY, 20, 20);
}