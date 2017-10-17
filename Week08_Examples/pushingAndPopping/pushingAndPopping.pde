background(#93429F);
size(400, 500);
rect(0, 0, 40, 40);

pushMatrix();
  scale(2);
  translate(40, 100);
  rotate(radians(-75));
  rect(0, 0, 40, 40);
popMatrix();

ellipse(100, 100, 30, 30);