float whereYouAre = 20;
float whereYoureGoing = 400;
float easeAmount = .5;

void setup() {
  size(500, 200);
  noStroke();
  frameRate(1);
}
void draw() {
  background(100);
  fill(255);
  ellipse(whereYouAre, 100, 50, 50);
  
  fill(255, 0, 0);
  ellipse(whereYoureGoing, 100, 10, 10);
  
  float distanceLeft = whereYoureGoing - whereYouAre;
  float percentageDist = distanceLeft * easeAmount;
  whereYouAre += percentageDist;
  
  //in one line it looks like this:
  //whereYouAre = whereYouAre + (whereYoureGoing - whereYouAre) * easeAmount;
}
void mouseClicked() {
  whereYouAre = 0;
}