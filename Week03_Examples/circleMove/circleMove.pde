int circleX = 50;
int circleY = 5;
int velocityY = 2;
int velocityX = 2;
void setup() {
  size(400, 300);
  //noStroke();
  // frameRate(5); //slower to see the frames
}
void draw() {
  background(200);
  fill(100, 30, 211);
  circleY = circleY + velocityY; 
  circleX = circleX + velocityX;
  ellipse(circleX, circleY, 20, 20);
  // println(frameRate); //how fas are we going?
}