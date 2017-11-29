class XiaBug {
  float x;
  float y;
  float d = 70;
  float speed = 5;
  int directionX = 0;
  int directionY = 0;
  int t = 0;
  int p = 0;
  float px = -30;
  float py = -30;
  boolean start;

  XiaBug() {
    x = random(width);
    y = random(height);
  }

  void move() {
    x += speed * directionX;
    y += speed * directionY;
  }

  void display(boolean[] keys) {
    if(keys[UP]) {
      directionX = 0;
      directionY = -1;
    } else if (keys[RIGHT]) {
      directionX = 1;
      directionY = 0;
    } else if (keys[DOWN]) {
      directionX = 0; 
      directionY = 1;
    } else if (keys[LEFT]) {
      directionX = -1;
      directionY = 0;
    }

    if (directionX == 1) {
      stroke(219, 54, 57); 
      strokeWeight(5);
      line(x-20, y, x-60, y);    
      line(x-20, y-10, x-50, y-20);
      line(x-20, y+10, x-50, y+20);
      line(x-10, y+20, x-10, y+50);
      line(x-10, y-20, x-10, y-50);
      noStroke(); 
      fill(249, 201, 4);
      arc(x, y, d, d, radians(30), radians(330));    //go right
    } else if (directionX == -1) {
      stroke(219, 54, 57); 
      strokeWeight(5);
      line(x+20, y, x+60, y);  
      line(x+20, y-10, x+50, y-20);
      line(x+20, y+10, x+50, y+20);
      line(x+10, y+20, x+10, y+50);
      line(x+10, y-20, x+10, y-50);
      noStroke(); 
      fill(249, 201, 4);
      arc(x, y, d, d, radians(210), radians(510));    //go left
    } else if (directionY == 1) {
      stroke(219, 54, 57); 
      strokeWeight(5);
      line(x, y-20, x, y-60);    
      line(x+10, y-20, x+20, y-50);
      line(x-10, y-20, x-20, y-50);
      line(x-20, y-10, x-50, y-10);
      line(x+20, y-10, x+50, y-10);
      noStroke(); 
      fill(249, 201, 4);
      arc(x, y, d, d, radians(120), radians(420));    //go down
    } else if (directionY == -1) {
      stroke(219, 54, 57); 
      strokeWeight(5);
      line(x, y+20, x, y+60);    
      line(x+10, y+20, x+20, y+50);
      line(x-10, y+20, x-20, y+50);
      line(x-20, y+10, x-50, y+10);
      line(x+20, y+10, x+50, y+10);
      noStroke(); 
      fill(249, 201, 4);
      arc(x, y, d, d, radians(300), radians(600));    //go up
    } else {
      stroke(219, 54, 57); 
      strokeWeight(5);
      line(x-20, y, x-60, y);    
      line(x-20, y-10, x-50, y-20);
      line(x-20, y+10, x-50, y+20);
      line(x-10, y+20, x-10, y+50);
      line(x-10, y-20, x-10, y-50);
      noStroke(); 
      fill(249, 201, 4);
      arc(x, y, d, d, radians(30), radians(330));    //start position
    } 

    if ((x+d/2>width) || (x-d/2<0)) {
      directionX = -directionX;
    } else if ((y+d/2>height) || (y-d/2<0)) {
      directionY = -directionY;
    }
    
    if (x>width || x<0 || y>height || y<0){
      x = width/2;
      y = height/2;
    }
  }
}