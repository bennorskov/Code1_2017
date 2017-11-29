class AndyBug {
  float xPosition = 450;
  float ySpeed = -8;
  float yPosition = 450;
  AndyBug() {
  }
  void display() {
    //head
    ellipse(xPosition-2, yPosition-100, 70, 85);
    //eyes
    ellipse(xPosition-13, yPosition-130, 20, 10);
    ellipse(xPosition+13, yPosition-130, 20, 10);
    //body
    ellipse(xPosition, yPosition, 100, 200);
    //antenna
    pushStyle();
    noFill();
    arc(xPosition-20, yPosition-200, 150, 140, HALF_PI, PI);
    arc(xPosition-20, yPosition-200, 209, 140, 0, HALF_PI);
    popStyle();

    //legs
    line(xPosition-50, yPosition-80, xPosition-40, yPosition-50);
    line(xPosition+50, yPosition-80, xPosition+40, yPosition-50);
    line(xPosition-20, yPosition+70, xPosition-50, yPosition+100);
    line(xPosition+20, yPosition+70, xPosition+50, yPosition+100);
  }

  void move(boolean[] keys) {
    yPosition += ySpeed;
    if (keys['w']) {
      yPosition += ySpeed;
    }

    if (yPosition<0) {
      yPosition=width;
    }
  }
}   