// one key at a time code
void setup() {}
void draw() {
  background(200);
  if(keyPressed) {
    if (key == CODED) {
      // arrow key, shift, control, etc...
      if (keyCode == 16) {
        rect(23, 2, 100, 23);
      } 
    } else {
      if (key == ' ') {
        background(255, 200, 2);
      }
      if (key == 'f'){
        ellipse(40, 40, 30, 20);
      }
    }
    println(key, keyCode);
  } 
}