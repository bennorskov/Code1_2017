DarkBug d; 
void setup() {
  size(500, 500);
  d = new DarkBug();
}
void draw() {
  background(200);
  d.draw();
  d.update();
}
class DarkBug {
  int redValue; 
  float x, y;
  float xSpeed = random(-2, 2);
  float ySpeed = random(-2, 2); 

  DarkBug (){  
    x = width/2;
    y = height/2;
    redValue = int(random(255));
  }
  void update() {
    x += xSpeed;
    y += ySpeed;
  }
  void draw() {
    beginShape(); //draw some legs!
    vertex(x, y+5);
    vertex(x + 30, y + 30);
    vertex(x, y);
    vertex(x + 30, y);
    endShape();
    
    fill(redValue, 20, 20);
    ellipse(x, y, 20, 20);
  }
} 