
ArrayList<Orb> orbs = new ArrayList<Orb>();

void setup() {
  size(450, 400);
  noStroke();
  smooth();
  int margin = 40;
  for (int x = margin; x<width-margin; x+=60) {
    for (int y = margin; y<height-margin; y+=60) {
      Orb o = new Orb(x, y);
      orbs.add(o);
    }
  }
  
}
void draw() {
  background(240, 240, 255);
  for(int i = 0; i<orbs.size(); i++) {
    Orb o = orbs.get(i);
    o.update();
  }
}
void mouseClicked() {
  for(int i = 0; i<orbs.size(); i++) {
    Orb o = orbs.get(i);
    if (dist(mouseX, mouseY, o.pos.x, o.pos.y) < o.widthD * .5) {
      o.handleClick();
    }
  }
}