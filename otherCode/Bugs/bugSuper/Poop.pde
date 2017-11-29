class Poop {
  float px, py;
  Poop(float x, float y) {
    px = x;
    py = y;
  }
  void display() {
    noStroke();
    fill (112, 29, 8);
    rect(px, py, 10, 20, 5);
  }
}