//color example
size(500, 700); // width, height of window
background(45, 45, 100); // R, G, B color

point(4, 5); //black pixel
stroke(255, 0, 0);
strokeWeight(4);
point(140, 140); // red pixel, bigger

noFill();
rect(23,23,130,23); //unfilled rectangle

fill(#ff00ff); //this is exactly the same...
fill(255, 0, 255); // as this. Use which one you like better
ellipse(100, 100, 45, 150);

/*
  Quick Hexidecimal (base 16) lesson
  0, 1, 2, 3...8, 9, a, b, c, d, e, f
  
  #f= 15
  #10 = 16
  #11 = 16*1 + 1
  #f0 = 16*15
  #ff = 16*15 + 15
*/
