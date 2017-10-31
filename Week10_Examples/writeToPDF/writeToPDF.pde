/* most of this code was taken from this page:
  https://www.andrew.cmu.edu/course/60-257/reference/libraries/pdf/index.html
*/
// bring in support for writing to a PDF 
import processing.pdf.*;
void setup() {
  //size(600, 280);
  size(600, 280, PDF, "pointersz.pdf");
}
void draw() {
  if (frameCount < 200) {
    //only draw 200 times. You cannot just press the stop button
    //you can't see what's happening on screen, so you'll have to figure out when to exit 
    ellipse(random(width), random(height), 20, 20);
  } else {
    exit(); //this will close the program
  }
}