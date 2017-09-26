

size(500, 740);

/*
for (int x = 0; x < width; x+=25) {
 rect(x, 25, 20, 20);
 }
 
 for (int y = 0; y < height; y += 25) {
 rect(50, y, 20, 20);
 }
 */


for (int x = mouseX; x < width; x+=25) {
  for (int y = mouseY; y < height; y += 25) {
    rect(x, y, 20, 20);
  }
}

/* //draw on top of mouse:
 void setup() {
 size(500, 740);
 }
 void draw() {
 //background(200);
 for (int x = mouseX; x < width; x+=25) {
 for (int y = mouseY; y < height; y += 25) {
 rect(x, y, 20, 20);
 }
 }
 }
 */