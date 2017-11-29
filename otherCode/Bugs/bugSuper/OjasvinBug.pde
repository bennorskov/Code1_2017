class OjasvinBug { 

  float x; 
  float y; 

  float speed = 4; 
  
  boolean leftPressed = false;
  boolean upPressed = false;
  boolean rightPressed = false;
  boolean downPressed = false;

  PImage bugImage;
  
  OjasvinBug() {
    x = width/2; 
    y = height/2;
    
    bugImage = loadImage("bug8.png");
  }

  void update() {

    float rotation = 0;
    if(leftPressed) {
      x-=speed;
      rotation= PI;
    } else if(rightPressed) {
      x+=speed;
    }
    
    if (upPressed) {
      y-=speed;
      rotation = 3*HALF_PI;
    } else if (downPressed) {
      y+=speed;
      rotation = HALF_PI;
    }

    fill(28, 116, 111);
    
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    image(bugImage, -50, -50);
    popMatrix();
    
  }
  void handleKeys(boolean[] allKeys) {
    leftPressed = allKeys[LEFT];
    rightPressed = allKeys[RIGHT];
    upPressed = allKeys[UP];
    downPressed = allKeys[DOWN];
  }
}