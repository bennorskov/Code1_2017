float countUpX = 0;
float countUpY = 0;
float sizeOfArc = 10;
void setup() {
  size(300, 300);
  rectMode(CENTER);
}
void draw() {
  //background(200);
  //fill(200, 200, 200, 10);
  //rect(0, 0, width, height);
  fill(255);
  rect( sin(countUpX) * sizeOfArc + width/2, cos(countUpY) * sizeOfArc +height/2, 20, 20);
  countUpX += .07;
  countUpY += .07;
  //sizeOfArc += 1; // makes a spiral
  sizeOfArc += sin(countUpX * 2) * 3;
}