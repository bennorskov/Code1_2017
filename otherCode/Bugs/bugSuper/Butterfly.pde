class Butterfly {
  float a = 0;
  float x;
  float y;
  Butterfly() {
  }
  void update(boolean[] allKeys) {

    display();
    if (allKeys['c']) {
      circle();
    }
    if (allKeys['r']) {
      mess();
    }
  }
  void display() {

    float x = width/2 + cos(a)*200;
    float y = height/2 + sin(a)*200;

    //tentacle
    noStroke();
    fill(255);
    triangle(x-3, y-30, x-15, y-60, x-12, y-62);
    triangle(x+3, y-30, x+15, y-60, x+12, y-62);

    //body
    noStroke();
    fill(255);
    rect(x-5, y-30, 10, 60);
    ellipse(x, y-30, 10, 10);
    ellipse(x, y+30, 10, 10);

    beginShape();
    vertex(x-5, y-30);
    vertex(x-45, y-80);
    vertex(x-95, y-90);
    vertex(x-105, y-60);
    vertex(x-95, y-30);
    vertex(x-85, y-10);
    vertex(x-55, y);
    vertex(x-75, y+20);
    vertex(x-65, y+50);
    vertex(x-35, y+60);
    vertex(x-5, y+30);
    endShape();

    noStroke();
    beginShape();
    vertex(x+5, y-30);
    vertex(x+45, y-80);
    vertex(x+95, y-90);
    vertex(x+105, y-60);
    vertex(x+95, y-30);
    vertex(x+85, y-10);
    vertex(x+55, y);
    vertex(x+75, y+20);
    vertex(x+65, y+50);
    vertex(x+35, y+60);
    vertex(x+5, y+30);
    endShape();

    fill(#97CAFC);
    triangle(x+5, y-30, x+45, y-80, x+95, y-90);
    fill(#99D6FF);
    triangle(x+5, y-30, x+95, y-90, x+105, y-60);
    fill(#B8E4FF);
    triangle(x+105, y-60, x+5, y-30, x+95, y-30);
    fill(#A9CEF7);
    triangle(x+5, y-30, x+95, y-30, x+85, y-10);
    fill(#94BDF7);
    triangle(x+5, y-30, x+85, y-10, x+55, y);
    fill(#8A99CE);
    triangle(x+5, y-30, x+55, y, x+75, y+20);
    fill(#99CCFF);
    triangle(x+5, y-30, x+75, y+20, x+65, y+50);
    fill(#B8DDFF);
    triangle(x+5, y-30, x+35, y+60, x+65, y+50);
    fill(#92CCF7);
    triangle(x+5, y-30, x+35, y+60, x+5, y+30);

    fill(#97CAFC);
    triangle(x-5, y-30, x-45, y-80, x-95, y-90);
    fill(#99D6FF);
    triangle(x-5, y-30, x-95, y-90, x-105, y-60);
    fill(#B8E4FF);
    triangle(x-105, y-60, x-5, y-30, x-95, y-30);
    fill(#A9CEF7);
    triangle(x-5, y-30, x-95, y-30, x-85, y-10);
    fill(#94BDF7);
    triangle(x-5, y-30, x-85, y-10, x-55, y);
    fill(#8A99CE);
    triangle(x-5, y-30, x-55, y, x-75, y+20);
    fill(#99CCFF);
    triangle(x-5, y-30, x-75, y+20, x-65, y+50);
    fill(#B8DDFF);
    triangle(x-5, y-30, x-35, y+60, x-65, y+50);
    fill(#92CCF7);
    triangle(x-5, y-30, x-35, y+60, x-5, y+30);
  }

  void circle() {
    a=a+0.05;
    if (a>2*PI) {
      a = 0;
    }
  }
  void mess() {
    a=cos(a)*random(100);
  }
}