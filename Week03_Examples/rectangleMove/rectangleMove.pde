int rectX = 0;
void setup() { //only runs once
  size(400, 300);
}
void draw() {
  //hey, like, do this a lot:
  rectX = rectX + 5;
  rect(rectX, 10, 5, 5);
  rect(rectX, 20, 5, 5);
  //rect( pow(rectX, 1.4), 20, 5, 5); //if you like exponents!
}