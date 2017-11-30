PImage turt;
PGraphics maskGraphics; // a pgraphics can work as an additional processing sketch
void setup() {
  turt = loadImage("turtle.jpg");
  maskGraphics = createGraphics(turt.width, turt.height); // the mask
  size(564, 450);
}

void draw() {
  background(100);
  /* 
  The beginDraw and endDraw functions have to be called to let
  the computer know when to write to the mask or the screen.
  You use the PGraphics object (maskGraphics) just like you would a normal draw loop,
  but you have to tell the computer to write to it instead of the screen.
  You do that by saying maskGraphics.rect() or maskGraphics.fill().
  */
  maskGraphics.beginDraw();
  maskGraphics.background(0); // this is just like background(0), but only works on the mask
  maskGraphics.fill(255); // only draw in greyscale to the mask. 
  maskGraphics.ellipse(mouseX, mouseY, 100, 100);
  maskGraphics.endDraw();
  
  turt.mask(maskGraphics); // apply the mask
  
  image(turt, 0, 0);
}