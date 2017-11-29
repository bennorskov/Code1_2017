class EllieBug {
  float xPosition;
  float yPosition;
  float ySpeed = 4;
  float bugWidth = 70;
  float bugWSpot = 10;
  boolean mPressed = false;

  EllieBug() {
    xPosition = random(width);
    yPosition = height + 10;
    ySpeed = random(5, 10);
  }

  void display() {
    //bug body
    fill(227, 7, 7);
    stroke(0);
    strokeWeight(1);
    ellipse(xPosition, yPosition, bugWidth, bugWidth);
    fill(0);
    //spots
    ellipse(xPosition +5, yPosition, bugWSpot, bugWSpot);
    ellipse(xPosition +20, yPosition +8, bugWSpot, bugWSpot);
    ellipse(xPosition -20, yPosition -20, bugWSpot - 1, bugWSpot - 1);
    ellipse(xPosition -15, yPosition + 10, bugWSpot-3, bugWSpot -3);
    ellipse(xPosition +13, yPosition -15, bugWSpot - 2, bugWSpot- 2);
    //head
    ellipse(xPosition, yPosition +35, 50, 35 );
    fill(255);
    ellipse(xPosition -10, yPosition +39, 5, 5);
    ellipse(xPosition + 10, yPosition +39, 5, 5);
  }

  void move(boolean[] allKeys) {
    if (allKeys['m']) {
      yPosition += ySpeed;

      if (yPosition > height) {
        //reset at top
        yPosition = 0;
        xPosition = random(width);
      }
    }
  }
}