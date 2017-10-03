class Drop {
  float xPosition;
  float yPosition;
  float ySpeed = 4;
  float dropWidth = 20;
  color displayColor;

  Drop() {
    xPosition = random(width);
    yPosition = random(height);
    ySpeed = random(5, 10);
    if (random(2) > 1) {
      displayColor = color(100, 100, 255);
    } else {
      displayColor = color(100, 100, 255, 127);
    }
  }
  void display() {
    fill(displayColor);
    triangle(xPosition-dropWidth/2, yPosition, 
      xPosition+dropWidth/2, yPosition, 
      xPosition, yPosition-dropWidth);
    ellipse(xPosition, yPosition, dropWidth, dropWidth);
  }
  void move() {
    yPosition += ySpeed;

    if (yPosition > height) {
      //reset at top
      yPosition = 0;
      xPosition = random(width);
      ySpeed = random(5, 10);
    }
  }
}