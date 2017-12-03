Level turtleLevel, bearLevel, catLevel;

void setup() {
  size(800, 800);
  turtleLevel = new Level(0, "turtle.jpg", 15, 0, 0);
  bearLevel = new Level(100, "bear.jpeg", 10, 0, 100);
  catLevel = new Level(150, "kitters.jpg", 5, 0, 200);
}
void draw() {
  background(0);
  
  turtleLevel.drawToMask();
  bearLevel.drawToMask();
  catLevel.drawToMask();
  
  turtleLevel.renderWave();
  bearLevel.renderWave();
  catLevel.renderWave();
}