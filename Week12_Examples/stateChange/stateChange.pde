int STATE = 3;

void setup() {
  size(400, 400);
}

void draw() {
  switch(STATE) {
    case 1:
      background(0, 200, 120);
      noStroke();
      fill(255);
      ellipse(width/2, height/2, 40, 40);
      break;
    case 2:
      background(230, 100, 80);
      noStroke();
      fill(255);
      triangle(width/2, height/2 - 20, width/2 + 20, height/2+20, width/2 - 20, height/2+20);
      break;
    case 3:
      background(255, 255, 40);
      noStroke();
      fill(255);
      rectMode(CENTER);
      rect(width/2, height/2, 40, 40);
      break;
    case 4:
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
      break;
  }
}
void keyPressed() {
  switch(key) {
    case '1':
      STATE = 1;
      break;
    case '2':
      STATE = 2;
      break;
    case '3':
      STATE = 3;
      break;
    case '4':
      STATE = 4;
      break;
  }
}
void mousePressed() {
  STATE -= 1;
  STATE++;
  STATE = STATE%4;
  STATE++;
}