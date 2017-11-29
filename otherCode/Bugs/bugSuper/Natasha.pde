class Natasha {
  float xPosition = 300;
  float xSpeed = -5;
  float yPosition = 300;
  Natasha() {}
  void display(){
    strokeWeight(5);
    stroke(145,145,145);
    //body
    ellipse(xPosition,yPosition,100,100);
    //head
    ellipse(xPosition-75,yPosition,75,75);
    //eyes
    ellipse(xPosition-95,yPosition-20,20,20);
    ellipse(xPosition-95,yPosition+15,20,20);
    //antennae
    pushStyle();
    noFill();
    arc(xPosition-100, yPosition-70, 80, 80, HALF_PI, PI);
    arc(xPosition-138, yPosition+33, 80, 80, 0, HALF_PI);
    popStyle();
    //right legs
    line(xPosition-50, yPosition-80, xPosition-20, yPosition-50);
    line(xPosition, yPosition-100, xPosition, yPosition-50);
    line(xPosition+50, yPosition-80, xPosition+20, yPosition-50);
    //left legs
    line(xPosition-20, yPosition+45, xPosition-50, yPosition+75);
    line(xPosition, yPosition+50, xPosition, yPosition+100);
    line(xPosition+20, yPosition+45, xPosition+50, yPosition+75);
  }
  
  void regen(){
    if(xPosition<0){
      xPosition=width;
   }
  }
  
 
  void control(boolean[] allKeys) {
    if (allKeys['w']) {
      yPosition -= 5;
    } else if (allKeys['s']) {
      yPosition += 5;
    } else if (allKeys['a']) {
      xPosition -= 5;
    } else if (allKeys['d']) {
      xPosition += 5;
    }  
  }

}