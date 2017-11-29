class Demonbug {
  float xPos;
  float yPos;
  float xSpeed = 4;
  float ySpeed = 4;
  float sW = 100; //spiderWidth

  Demonbug() {
    xPos = random(width);
    yPos = random(height);
  }
  void move() {
    xPos += xSpeed;
    yPos += ySpeed;

    if (yPos > height) {
      xPos = random(width);
      yPos = 20;
      xSpeed = random(-10, 10);
      ySpeed = random(5, 10);
    }
  }
  void display() {
    fill(90);
    ellipse(xPos, yPos, sW, sW/-5); //body

    fill(117, 72, 59);
    ellipse(xPos+1000, yPos+100.5, sW/100, sW/150); 
    ellipse(xPos+1200, yPos+120.5, sW/100, sW/150);


    strokeWeight(5);
    line(xPos-50, yPos, xPos-80, yPos-25); 
    line(xPos-50, yPos, xPos-80, yPos-8.3);
    line(xPos-50, yPos, xPos-80, yPos+8.3);
    line(xPos-50, yPos, xPos-80, yPos+25);

    line(xPos+50, yPos, xPos+80, yPos-20); 
    line(xPos+50, yPos, xPos+80, yPos-8);
    line(xPos+50, yPos, xPos+80, yPos+8);
    line(xPos+50, yPos, xPos+80, yPos+20);

    line(xPos+50, yPos, xPos+180, yPos-120); 
    line(xPos+50, yPos, xPos+180, yPos-80);
    line(xPos+50, yPos, xPos+180, yPos+80);
    line(xPos+50, yPos, xPos+180, yPos+120);


    line(xPos-100, yPos, xPos-30, yPos-250); 
    line(xPos-100, yPos, xPos-30, yPos-80);
    line(xPos-100, yPos, xPos-30, yPos+80);
    line(xPos-100, yPos, xPos-30, yPos+250);
  }
}