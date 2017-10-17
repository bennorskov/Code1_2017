float x, y, time;
float speed = 1;

void setup() {
  size(600, 200);
  y = height/2;
}

void draw() {
  //background(200);
  x += speed; 
  point(x, y + sin(x*.05)*20);
  
  point(x, y + sin(x*.1)*10);
}