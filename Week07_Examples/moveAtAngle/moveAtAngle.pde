float ellipseX, ellipseY, ellipseXSpeed, ellipseYSpeed;
float maxSpeed = 10;
boolean drawEllipse = false;
void setup() {
  size(400, 400);
  rectMode(CENTER);
}
void draw() {
  background(100);
  rect(width/2, height/2, 20, 20);
  if (drawEllipse) {
    ellipseX += ellipseXSpeed;
    ellipseY += ellipseYSpeed;
    ellipse(ellipseX, ellipseY, 20, 20);
  }
}
void mousePressed() {
  drawEllipse= true;
  ellipseX = width/2;
  ellipseY = height/2;
  
  float angle = atan2(mouseY - height/2, mouseX - width/2);  
  ellipseXSpeed = cos(angle)*maxSpeed;
  ellipseYSpeed = sin(angle)*maxSpeed;
}