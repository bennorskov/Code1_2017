class Spider {
  float xPos;
  float yPos;
  float xSpeed = 2;
  float ySpeed = 2;
  float sW = 100; //spiderWidth
  
  Spider() {
    xPos = random(width);
    yPos = random(height);
  }
  void move(boolean[] allKeys) {
    xPos += xSpeed;
    yPos += ySpeed;
    
    if (yPos > height) {
      xPos = random(width);
      yPos = 0;
      xSpeed = random(-10, 10);
      ySpeed = random(5, 10);
    }
    
    if (allKeys['d']) {
      xPos += 10;
    }
    if (allKeys['a']) {
      xPos -= 10;
    }
    if (allKeys['w']) {
      yPos -= 10;
    }
    if (allKeys['s']) {
      yPos += 10;
    }
  }
  void display() {
    //background(#0BDE21);
    
    fill(0);
    stroke(0);
    ellipse(xPos, yPos, sW, sW/3); //body
    
    fill(#FFFFFF);
    ellipse(xPos+25, yPos+12.5, sW/10, sW/10); //right eyes
    ellipse(xPos+12.5, yPos+12.5, sW/10, sW/10);
    ellipse(xPos-25, yPos+12.5, sW/10, sW/10); //left eyes
    ellipse(xPos-12.5, yPos+12.5, sW/10, sW/10);
    
    strokeWeight(3);
    line(xPos-50, yPos, xPos-80, yPos-25); //left legs
    line(xPos-50, yPos, xPos-80, yPos-8.3);
    line(xPos-50, yPos, xPos-80, yPos+8.3);
    line(xPos-50, yPos, xPos-80, yPos+25);
    
    line(xPos+50, yPos, xPos+80, yPos-25); //right legs
    line(xPos+50, yPos, xPos+80, yPos-8.3);
    line(xPos+50, yPos, xPos+80, yPos+8.3);
    line(xPos+50, yPos, xPos+80, yPos+25);
  }
}