Drop myDrop = new Drop();
Drop a = new Drop();

Drop[] allthedrops = new Drop[500];
// initialize the Array for drops, but not the drops themselves. 

void setup () {
  size(400, 600);
  noStroke();
  for (int i=0; i<allthedrops.length; i++) {
    //must initialize the drops
    allthedrops[i] = new Drop();
  }
  smooth();
}
void draw() {
  background(100);
  
  for (int i=0; i<allthedrops.length; i++) {
    allthedrops[i].display();
    allthedrops[i].move();
  }
  
  a.display();
  a.move();
  myDrop.display();
  myDrop.move();
}