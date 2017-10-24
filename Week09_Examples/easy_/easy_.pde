float ypos = 0;
float ypos2 = 0;
float speed = 60;
void setup() {
  size( 240, 800);
  frameRate(2);
}
void draw() {
  fill(255);
  ellipse(40, ypos, 20, 20);
  
  ypos += (height - ypos)*.25;
  
  float redValue = map(ypos2, 0, height, 0, 255);
  fill(redValue, 255-redValue, 0);
  ellipse( 140, ypos2, 20, 20);
  ypos2 += speed;
  speed *= .93;
}