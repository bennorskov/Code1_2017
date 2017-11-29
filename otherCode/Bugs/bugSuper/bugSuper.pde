Fly f = new Fly();
IanBug ib;
EllieBug eb;
OjasvinBug ob;
AndyBug ab = new AndyBug();
Bateel b;
Spider s;
Natasha n;
Butterfly bf;
CrazyBF cbf;
ChanBug cb;
Alyssa a;
Demonbug d;
XiaBug xb;
Food jFood;

ArrayList<Poop> poops = new ArrayList();

boolean[] keys = new boolean[255];

void setup() {
  size(1000, 800);
  ob = new OjasvinBug();
  eb = new EllieBug();
  ib = new IanBug();
  b = new Bateel();
  s = new Spider();
  n = new Natasha();
  bf = new Butterfly();
  cbf = new CrazyBF();
  cb = new ChanBug();
  a = new Alyssa();
  d = new Demonbug();
  xb = new XiaBug();
  jFood = new Food();
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
  cbf.display(keys);
  
  //Kimberly
  cb.control(keys);
  cb.display();
  cb.reset();
  cb.draw();
  
  //Alyssa
  a.display(keys);
  
  //Mickell
  d.display();
  d.move();
  
  //Jackie
  xb.move();
  xb.display(keys);
  if (jFood.testHit(xb.x,xb.y,xb.d)) {
    poops.add(new Poop(xb.x, xb.y));
  }
  for(int i=0; i<poops.size(); i++) {
    Poop p = poops.get(i);
    p.display();
  }
  jFood.display();
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