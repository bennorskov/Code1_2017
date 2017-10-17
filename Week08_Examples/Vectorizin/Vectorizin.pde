PVector speed, position; 
float maxSpeed = 3;
void setup() {
  size(380, 500);
  speed = PVector.random2D();
  speed.mult(maxSpeed);
  position = new PVector(50, 50);
}

void draw() {
  rect(position.x, position.y, 34, 51);
  position.add(speed);
  
  println(degrees(speed.heading() ));
}

void mousePressed() {
  speed = PVector.random2D();
  speed.mult(maxSpeed);
}