class Fly {
  float xPosition;
  float yPosition;
  float xSpeed = 1;
  float bugWidth = 20;
  color displayColor;
  boolean red = false;

  Fly() {
    xPosition = random(width);
    yPosition = random(0, height);
    xSpeed = random(5, 15);
    if (random(0, 2) > 1) {
      displayColor = color(23, 533, 234);
    } else {
      displayColor = color(100, 100, 255, 100);
    }
  }

  void display() {
    //draw bug
    if (keyPressed) {
      if (key == 'r') {
        fill(255, 0, 0);
      }
      if (key == 'g') {
        fill(0, 255, 0);
      }
      if (key == 'b') {
        fill(0, 0, 255);
      }
    } else {
      fill (displayColor);
    }
    ellipse(xPosition, yPosition, bugWidth+ 100, bugWidth);
    //spots
    fill(0);
    ellipse(xPosition -20, yPosition, bugWidth /2, bugWidth/2);
    fill(0);
    ellipse(xPosition, yPosition, bugWidth /2, bugWidth/2);
    fill(0);
    ellipse(xPosition +20, yPosition, bugWidth /2, bugWidth/2);
    //head
    fill(0);
    ellipse(xPosition +50, yPosition, bugWidth * 2, bugWidth * 2);
    //top hairs
    stroke(10);
    line(xPosition +50, yPosition, xPosition + 40, yPosition - 30);
    line(xPosition +50, yPosition, xPosition + 60, yPosition - 30);
    //face
    fill(255);
    ellipse(xPosition +50, yPosition, bugWidth-30, bugWidth-30);
    //eyes
    fill(255);
    ellipse(xPosition +40, yPosition - 30, 10, 10);
    ellipse(xPosition +60, yPosition - 30, 10, 10);
    //wings
    fill(66, random(25), random(255));
    arc(xPosition, yPosition + 10, 30, 40, 0, PI);
    arc(xPosition, yPosition -10, 30, 40, PI, TWO_PI);
  }
  void move() {
    xPosition += xSpeed;

    if (xPosition > width) {
      //reset at top
      yPosition = random(height);
      xPosition = 0;
      xSpeed = random(5, 10);
    }
    //shift key
    if (keyCode == UP)
    {
      yPosition -= 10;
    } else if (keyCode ==DOWN) {
      yPosition += 10;
    } else if (keyCode == LEFT) {
      xPosition -= 15;
    }
  }
}