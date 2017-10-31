// bring in support for writing to a PDF 
import processing.pdf.*;
int loops = 0;
void setup() {
  size(6000, 2800, PDF, "testPrint.pdf");
}
void draw() {
  if (loops < 200) {
    //only draw 200 times. You can also just press the stop button
    // you can't see what's happening on screen, so you'll have to figure out when to exit 
    loops++;
    ellipse(random(width), random(height), 200, 200);
  } else {
    exit(); //this will close the program
  }
}