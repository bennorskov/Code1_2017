class Particle {
  float x, y, xSpeed, ySpeed;
  float gravity = .6;
  float maxSpeed = 30;
  Particle() {
    x = buttonX;
    y = buttonY;
    PVector speed = PVector.random2D();
    xSpeed = speed.x * random(-maxSpeed, maxSpeed);
    ySpeed = speed.y * random(-maxSpeed, maxSpeed);
    //xSpeed = random(-maxSpeed, maxSpeed);
    //ySpeed = random(-maxSpeed, maxSpeed);
  }
  void move() {
    x+=xSpeed;
    y+=ySpeed;
    ySpeed += gravity;
    
    fill(0, 0, 255);
    ellipse(x, y, 20, 20);
  }
}