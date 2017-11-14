int STATE = 3;

void setup() {
  size(400, 400);
}

void draw() {
  if (STATE == 1) {
    background(0, 200, 120);
    noStroke();
    fill(255);
    ellipse(width/2, height/2, 40, 40);
  } else if (STATE == 2) {
    background(230, 100, 80);
    noStroke();
    fill(255);
    triangle(width/2, height/2 - 20, width/2 + 20, height/2+20, width/2 - 20, height/2+20);
  } else if (STATE == 3) {
    background(255, 255, 40);
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(width/2, height/2, 40, 40);
  } else if (STATE == 4) {
    background(100, 100, 255);
    stroke(255);
    strokeWeight(5);
    noFill();
    beginShape();
    for (float a = 0; a < TWO_PI; a+= TWO_PI/5) {
      float radius = 22;
      vertex(cos(a-radians(90)) * radius + width/2, sin(a-radians(90)) * radius + height/2);
    }
    endShape(CLOSE);
  }
}
void keyPressed() {
  if (key == '1') {
    STATE = 1;
  } else if (key == '2') {
    STATE = 2;
  } else if (key == '3') {
    STATE = 3;
  } else if (key == '4') {
    STATE = 4;
  }
}
void mousePressed() {
  STATE++;
  if (STATE > 4) STATE = 1;
}