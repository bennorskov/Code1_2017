Fly f = new Fly();
IanBug ib;
EllieBug eb;
OjasvinBug ob;
AndyBug ab = new AndyBug();
Bateel b;
Spider s;
Natasha n;
Butterfly bf;

boolean[] keys = new boolean[255];

void setup() {
  size(800, 800);
  ob = new OjasvinBug();
  eb = new EllieBug();
  ib = new IanBug();
  b = new Bateel();
  s = new Spider();
  n = new Natasha();
  bf = new Butterfly();
}
void draw() {
  background(100);
  //chella
  f.display();
  f.move();
  
  //Ian
  ib.display();
  ib.move();
  
  //Ellie
  eb.move(keys);
  eb.display();
  
  //Ojasvin
  ob.update();
  ob.handleKeys(keys);
  
  //Andy
  ab.display();
  ab.move(keys);
  
  //Bateel
  b.display();
  b.move(keys);
  
  //Julie
  s.display();
  s.move(keys);
  
  //Natasha
  n.display();
  n.regen();
  n.control(keys);
  
  //Qinglin
  bf.update(keys);
}

void keyPressed() {
  int keyNumber = (key == CODED) ? keyCode : key;
  keys[keyNumber] = true;
  //println(keys['w'], "other w", int('w'), keyCode, int(key));
}

void keyReleased() {
  int keyNumber = (key == CODED) ? keyCode : key;
  keys[keyNumber] = false;
}