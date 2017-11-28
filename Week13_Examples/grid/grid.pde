int stepSize = 80;
int circW = 50; 

void setup() {
  size(500, 500);
}
void draw() {
  background(80, 80, 200);
  for (int x = 0;x < width; x += stepSize) {
    ellipse(x, stepSize, circW, circW);
  } 
  //for (int y = 0; y<height; y+=stepSize) {
  //  ellipse(stepSize, y, circW, circW);
  //}
}