Drop myDrop = new Drop();

void setup () {
  size( 400, 600);
  myDrop.xPosition = random(width);
  myDrop.yPosition = random(height);
  noStroke();
}
void draw() {
  background(100);
  fill(100, 100, 255);
  triangle(myDrop.xPosition-myDrop.dropWidth/2, myDrop.yPosition, 
            myDrop.xPosition+myDrop.dropWidth/2, myDrop.yPosition, 
            myDrop.xPosition, myDrop.yPosition-myDrop.dropWidth);
    ellipse(myDrop.xPosition, myDrop.yPosition, myDrop.dropWidth, myDrop.dropWidth);
    
    myDrop.yPosition += myDrop.ySpeed;
    
    if (myDrop.yPosition > height) {
      //reset at top
      myDrop.yPosition = 0;
      myDrop.xPosition = random(width);
      myDrop.ySpeed = random(5, 10);
    }
}