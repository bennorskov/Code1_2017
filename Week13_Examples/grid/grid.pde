int stepSize = 40;
int circW = 30; 

void setup() {
  size(500, 500);
}
void draw() {
  background(80, 80, 200);
  for (int x = 0; x < width; x += stepSize) {
    for (int y = 0; y<height; y+=stepSize) {
      ellipse(x, y, circW, circW);
    }
  }
}