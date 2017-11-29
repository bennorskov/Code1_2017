class CrazyBF {
  int numberOfButterflies = 100;
  float x[] = new float[numberOfButterflies];
  float y[] = new float[numberOfButterflies];
  float angle = 0;

  CrazyBF() {
    for (int i = 0; i <numberOfButterflies; i++) {
      x[i]=random(0, width);
      y[i]=random(0, height);
    }
  }


  void display(boolean[] keys) {
    if (!keys['k']) return;

    for (int i = 0; i <numberOfButterflies; i++) {
      x[i]=random(0, width);
      y[i]=random(0, height);

      x[i]+=random(-5, 10);
      y[i]+=random(-5, 10);

      translate(x[i], y[i]);
      rotate(angle);
      angle+=0.1;

      noStroke();
      fill(255);
      triangle(x[i]-3, y[i]-30, x[i]-15, y[i]-60, x[i]-12, y[i]-62);
      triangle(x[i]+3, y[i]-30, x[i]+15, y[i]-60, x[i]+12, y[i]-62);

      //body[i]
      noStroke();
      fill(255);
      rect(x[i]-5, y[i]-30, 10, 60);
      ellipse(x[i], y[i]-30, 10, 10);
      ellipse(x[i], y[i]+30, 10, 10);



      beginShape();
      vertex(x[i]-5, y[i]-30);
      vertex(x[i]-45, y[i]-80);
      vertex(x[i]-95, y[i]-90);
      vertex(x[i]-105, y[i]-60);
      vertex(x[i]-95, y[i]-30);
      vertex(x[i]-85, y[i]-10);
      vertex(x[i]-55, y[i]);
      vertex(x[i]-75, y[i]+20);
      vertex(x[i]-65, y[i]+50);
      vertex(x[i]-35, y[i]+60);
      vertex(x[i]-5, y[i]+30);
      endShape();

      noStroke();
      beginShape();
      vertex(x[i]+5, y[i]-30);
      vertex(x[i]+45, y[i]-80);
      vertex(x[i]+95, y[i]-90);
      vertex(x[i]+105, y[i]-60);
      vertex(x[i]+95, y[i]-30);
      vertex(x[i]+85, y[i]-10);
      vertex(x[i]+55, y[i]);
      vertex(x[i]+75, y[i]+20);
      vertex(x[i]+65, y[i]+50);
      vertex(x[i]+35, y[i]+60);
      vertex(x[i]+5, y[i]+30);
      endShape();

      fill(#97CAFC);
      triangle(x[i]+5, y[i]-30, x[i]+45, y[i]-80, x[i]+95, y[i]-90);
      fill(#99D6FF);
      triangle(x[i]+5, y[i]-30, x[i]+95, y[i]-90, x[i]+105, y[i]-60);
      fill(#B8E4FF);
      triangle(x[i]+105, y[i]-60, x[i]+5, y[i]-30, x[i]+95, y[i]-30);
      fill(#A9CEF7);
      triangle(x[i]+5, y[i]-30, x[i]+95, y[i]-30, x[i]+85, y[i]-10);
      fill(#94BDF7);
      triangle(x[i]+5, y[i]-30, x[i]+85, y[i]-10, x[i]+55, y[i]);
      fill(#8A99CE);
      triangle(x[i]+5, y[i]-30, x[i]+55, y[i], x[i]+75, y[i]+20);
      fill(#99CCFF);
      triangle(x[i]+5, y[i]-30, x[i]+75, y[i]+20, x[i]+65, y[i]+50);
      fill(#B8DDFF);
      triangle(x[i]+5, y[i]-30, x[i]+35, y[i]+60, x[i]+65, y[i]+50);
      fill(#92CCF7);
      triangle(x[i]+5, y[i]-30, x[i]+35, y[i]+60, x[i]+5, y[i]+30);

      fill(#97CAFC);
      triangle(x[i]-5, y[i]-30, x[i]-45, y[i]-80, x[i]-95, y[i]-90);
      fill(#99D6FF);
      triangle(x[i]-5, y[i]-30, x[i]-95, y[i]-90, x[i]-105, y[i]-60);
      fill(#B8E4FF);
      triangle(x[i]-105, y[i]-60, x[i]-5, y[i]-30, x[i]-95, y[i]-30);
      fill(#A9CEF7);
      triangle(x[i]-5, y[i]-30, x[i]-95, y[i]-30, x[i]-85, y[i]-10);
      fill(#94BDF7);
      triangle(x[i]-5, y[i]-30, x[i]-85, y[i]-10, x[i]-55, y[i]);
      fill(#8A99CE);
      triangle(x[i]-5, y[i]-30, x[i]-55, y[i], x[i]-75, y[i]+20);
      fill(#99CCFF);
      triangle(x[i]-5, y[i]-30, x[i]-75, y[i]+20, x[i]-65, y[i]+50);
      fill(#B8DDFF);
      triangle(x[i]-5, y[i]-30, x[i]-35, y[i]+60, x[i]-65, y[i]+50);
      fill(#92CCF7);
      triangle(x[i]-5, y[i]-30, x[i]-35, y[i]+60, x[i]-5, y[i]+30);
    }
  }
}