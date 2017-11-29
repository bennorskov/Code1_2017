class Food {
  float foodX;
  float foodY;
  int foodD;
  float px, py, p;
  Food() {
    foodD = 20;
    newPlace(80);
  }
  boolean testHit(float x, float y, float d) {
    if ((foodX<x+d/2)&&(foodX>x-d/2)&&(foodY<y+d/2)&&(foodY>y-d/2)) {
      p++;
      newPlace(d);
    }
    if (p >= 3) {
      p=0;
      return true;
    } else {
      return false;
    }
  }
  void display() {
    fill(39, 125, 211);
    ellipse(foodX, foodY, foodD, foodD);
  }
  void newPlace(float d) {
    foodX = random(d/2, width-d/2);
    foodY = random(d/2, height-d/2);
  }
}