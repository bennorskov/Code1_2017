class IanBug { 
  float xPos;
  float yPos;
  float ySpeed;
  float xSpeed;
  float bugSize = 20;
  color displayColor;

  IanBug() {
    xPos = random(width);
    yPos = random(height);
  }
  void display () {
    if (!keyPressed) {
      //draw legs
      stroke(0);
      strokeWeight(2);
      line(xPos, yPos-20, xPos-20, yPos-30);
      line(xPos, yPos, xPos-30, yPos);
      line(xPos, yPos+20, xPos-20, yPos+30);
      line(xPos, yPos-20, xPos+20, yPos-30);
      line(xPos, yPos, xPos+30, yPos);
      line(xPos, yPos+20, xPos+20, yPos+30);
      //draw a bugs
      noStroke();
      fill(displayColor);
      ellipse(xPos, yPos, bugSize, bugSize+50);
      stroke(0);
      curve(xPos-10, yPos, xPos-10, yPos+40, xPos-20, yPos+70, xPos, yPos+70);
      curve(xPos+10, yPos, xPos+10, yPos+40, xPos+20, yPos+70, xPos, yPos+70);
    }
  }
  void move() {
    yPos += ySpeed;
    xPos += xSpeed;
    if (yPos>height) {
      //reset top
      yPos =0;
    } else if (yPos<0) {
      yPos =height;
    } else if (xPos>width) {
      xPos=0;
    } else if (xPos<0) {
      xPos=width;
    }
    if (keyPressed) {
      if (key == CODED) {
        // arrow key, shift, control, etc...
        if (keyCode == 38) {
          yPos-=3;
          //draw legs
          stroke(0);
          strokeWeight(2);
          line(xPos, yPos-20, xPos-20, yPos-30);
          line(xPos, yPos, xPos-30, yPos);
          line(xPos, yPos+20, xPos-20, yPos+30);
          line(xPos, yPos-20, xPos+20, yPos-30);
          line(xPos, yPos, xPos+30, yPos);
          line(xPos, yPos+20, xPos+20, yPos+30);
          //draw a bugs
          noStroke();
          fill(displayColor);
          ellipse(xPos, yPos, bugSize, bugSize+50);
          stroke(0);
          curve(xPos-10, yPos, xPos-10, yPos-40, xPos-20, yPos-70, xPos, yPos-70);
          curve(xPos+10, yPos, xPos+10, yPos-40, xPos+20, yPos-70, xPos, yPos-70);
        }  
        if (keyCode == 40) {
          yPos+=3;
          //draw legs
          stroke(0);
          strokeWeight(2);
          line(xPos, yPos-20, xPos-20, yPos-30);
          line(xPos, yPos, xPos-30, yPos);
          line(xPos, yPos+20, xPos-20, yPos+30);
          line(xPos, yPos-20, xPos+20, yPos-30);
          line(xPos, yPos, xPos+30, yPos);
          line(xPos, yPos+20, xPos+20, yPos+30);
          //draw a bugs
          noStroke();
          fill(displayColor);
          ellipse(xPos, yPos, bugSize, bugSize+50);
          stroke(0);
          curve(xPos-10, yPos, xPos-10, yPos+40, xPos-20, yPos+70, xPos, yPos+70);
          curve(xPos+10, yPos, xPos+10, yPos+40, xPos+20, yPos+70, xPos, yPos+70);
        }
        if (keyCode == 39) {
          xPos+=3;
          //draw legs
          stroke(0);
          strokeWeight(2);
          line(xPos-20, yPos, xPos-30, yPos-20);
          line(xPos, yPos, xPos, yPos-30);
          line(xPos+20, yPos, xPos+30, yPos-20);
          line(xPos-20, yPos, xPos-30, yPos+20);
          line(xPos, yPos, xPos, yPos+30);
          line(xPos+20, yPos, xPos+30, yPos+20);
          //draw a bugs
          noStroke();
          fill(displayColor);
          ellipse(xPos, yPos, bugSize+50, bugSize);
          stroke(0);
          curve(xPos-10, yPos, xPos+40, yPos-10, xPos+70, yPos-20, xPos+70, yPos);
          curve(xPos+10, yPos, xPos+40, yPos+10, xPos+70, yPos+20, xPos+70, yPos);
        }
        if (keyCode == 37) {
          stroke(0);
          strokeWeight(2);
          line(xPos-20, yPos, xPos-30, yPos-20);
          line(xPos, yPos, xPos, yPos-30);
          line(xPos+20, yPos, xPos+30, yPos-20);
          line(xPos-20, yPos, xPos-30, yPos+20);
          line(xPos, yPos, xPos, yPos+30);
          line(xPos+20, yPos, xPos+30, yPos+20);
          //draw a bugs
          noStroke();
          fill(displayColor);
          ellipse(xPos, yPos, bugSize+50, bugSize);
          stroke(0);
          curve(xPos-10, yPos, xPos-40, yPos-10, xPos-70, yPos-20, xPos-70, yPos);
          curve(xPos+10, yPos, xPos-40, yPos+10, xPos-70, yPos+20, xPos-70, yPos);
          xPos-=3;
        }
      }
    }
  }
}