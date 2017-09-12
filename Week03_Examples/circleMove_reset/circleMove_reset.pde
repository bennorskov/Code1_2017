int circleX = 50;
int circleY = 5;
int velocityY = 20;
int velocityX = 20;
void setup() {
  size(800, 500);
}
void draw() {
  background(20);
  fill(100, 30, 211);
  circleY = circleY + velocityY; 
  circleX = circleX + velocityX;
  ellipse(circleX, circleY, 20, 20);
  //if the circle is on the bottom of the screen
  //if circleY is 300
  //if circleY is bigger than 300
  if (circleY > height) { //height is 300
    //move the circle to the top
    circleY = 0;
  }
  if (circleX > width) {
    circleX = 0;
  }
}