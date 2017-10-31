class Particle {
  float x, y, xSpeed, ySpeed;
  float gravity = 1;
  float maxSpeed = 10;
  color drawFill;
  
  Particle() {
    x = buttonX;
    y = buttonY;
    drawFill = color(random(255), 0, 100 + random(155));
    
    // normalized speed code pattern:
    PVector speed = PVector.random2D();
    xSpeed = speed.x * random(-maxSpeed, maxSpeed);
    ySpeed = speed.y * random(-maxSpeed, maxSpeed);
    
    // exploding circle code pattern:
    //PVector speed = PVector.random2D();
    //xSpeed = speed.x * maxSpeed;
    //ySpeed = speed.y * maxSpeed;
    
    // non-normalized speed code pattern:
    //xSpeed = random(-maxSpeed, maxSpeed);
    //ySpeed = random(-maxSpeed, maxSpeed);
    //the above version makes a squareish shape when run
  }
  void move() {
    x+=xSpeed;
    y+=ySpeed;
    ySpeed += gravity;
    
    fill(drawFill);
    ellipse(x, y, 20, 20);
  }
}