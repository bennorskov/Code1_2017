//Old code doing a cellular autonama simulation

Organism[] Orgs = new Organism[2];

int windowWidth = 720;
int windowHeight = 400;

//Organism Attributes
float orgSpeed = .5;
float startDiameter = 15;

void setup() {
  //frameRate(30);
  size(720, 400);
  Orgs[0] = new Organism(177, 177, startDiameter);
  Orgs[1] = new Organism(277, 77, startDiameter);
  stroke(0, 127);
  noStroke();
  smooth();
}

void draw() {
  background(127);
  for(int i=0; i<Orgs.length; i++) {
    Orgs[i].update();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    newOrg(mouseX, mouseY);
  } 
  else if (mouseButton == RIGHT) {
    newOrg(mouseX, mouseY);
    Orgs[Orgs.length-1].isFood = true;
  }
}

void newOrg(float x, float y) {
  Organism neen = new Organism(int(x), int(y), startDiameter);
  Orgs = (Organism[]) append(Orgs, neen);
}

void killOrg() {
  for (int i = 0; i<Orgs.length; i++) {
    if (!Orgs[i].isSelectable) {
      //switch it to the end of the array
      Organism tempOrg = Orgs[i];
      Organism tempOrg2 = Orgs[Orgs.length-1];
      Orgs[i] = tempOrg2;
      Orgs[Orgs.length-1] = tempOrg;
      Orgs = (Organism[]) shorten(Orgs);
      i += Orgs.length;
    }
  }
}

/////////////////////////////////////This Class is to create the tentacles from each organism////////////////////////////////////////


class Tentacle {

  int numberOfSegments = 24;
  float divider = .03; //how fast the tentacle rotates
  float widthMulti = .3; //i * this + 2 in the initialization script, gives width of each section
  int lengthConstructor = 30; //how long the tentacle is

  boolean isAttatched = false;
  boolean hasTarget = false;
  Organism targetOrg, parentOrg;

  float[] angleStorage = new float[numberOfSegments]; //these store values of angle for each segment. 
  int[] tentacleLength = new int[numberOfSegments] ;
  int[] tentacleWidth = new int[numberOfSegments];

  float initOrganWidth;
  float organWidth; //these two values are to handle organism growth

    float x, y; //the middle of the parent organism 
  float tentacle0x;     //so as to only call the sin/cos once each update;
  float tentacle0y;

  Tentacle(float orgWidth, Organism pOrg) {
    float direction = random(2)*PI-PI;

    for (int i = 0; i<numberOfSegments; i++) {  //create the length of each tentacle segment
      tentacleWidth[i] = int(i*widthMulti+2);
      tentacleLength[i] = int(((numberOfSegments-i)/float(numberOfSegments)*lengthConstructor)+orgWidth*.5);
      angleStorage[i] = direction;
    }
    initOrganWidth = orgWidth;
    parentOrg = pOrg;
  }

  void update(float X, float Y, float orgWidth) {
    tentacle0x = endTentacleX(angleStorage[0], tentacleLength[0]);
    tentacle0y = endTentacleY(angleStorage[0], tentacleLength[0]);
    x = X;
    y = Y;

    drawTentacle();
    updateAngle();
    getClosestOrg();
    pointTentacle();

    if (orgWidth != initOrganWidth) {
      tentLengthUpdate(orgWidth);
    }
  }

  void drawTentacle() {
    for (int i = 0; i < tentacleLength.length; i++) {
      ellipse(endTentacleX(angleStorage[i], tentacleLength[i]), endTentacleY(angleStorage[i], tentacleLength[i]), tentacleWidth[i], tentacleWidth[i]);
    }
  }

  void updateAngle() {
    for (int i = angleStorage.length-1; i >= 1; i--) {
      angleStorage[i] -= angleStorage[i] - angleStorage[i-1]; //update the angles from the bottom of the array up, to make sure that each element of the tentacle follows another. 
    }
  }

  int endTentacleY(float tentAngle, int currentLength) {
    float returned = sin(tentAngle)*currentLength;
    return int(returned+y);
  }
  int endTentacleX(float tentAngle, int currentLength) {
    float returned = cos(tentAngle)*currentLength;
    return int(returned+x);
  }

  void tentLengthUpdate(float oW) {
    for (int i = 0; i<tentacleLength.length; i++) {
      tentacleLength[i] = int(((numberOfSegments-i)/float(numberOfSegments)*lengthConstructor)+oW*.5);
    }
    initOrganWidth = oW; //avoids exponential growth.
  }

  void getClosestOrg() {
    float[][] distanceHolder = new float[Orgs.length][2];
    int targetInt = 0;
    float tempFloat = float(windowWidth);

    for (int i = 0; i<Orgs.length; i++) {

      if ((Orgs[i].isSelectable) && (parentOrg.x != Orgs[i].x)) {
        distanceHolder[i][0] = dist(tentacle0x, tentacle0y, Orgs[i].x, Orgs[i].y);
        distanceHolder[i][1] = i;
      }

      if ((distanceHolder[i][0] < tempFloat) && (distanceHolder[i][0] != 0.0)) {
        targetInt = int(distanceHolder[i][1]);
        tempFloat = distanceHolder[i][0];
      }
    }
    //check the distance between each org and the tent0x,y
    // if the distance is less than the current distance, then assign the index to the target org.

    targetOrg = Orgs[targetInt];
    hasTarget = true;
  }

  void pointTentacle() {   //This is to point the Tentacle in the direction of its chosen prey

    float proximityCheck = dist(targetOrg.x, targetOrg.y, tentacle0x, tentacle0y);

    if (proximityCheck < targetOrg.diameter * .5) {
      isAttatched = true;
      targetOrg.diameter -= targetOrg.growthAmount;
    } 
    else if ((isAttatched == true) && (proximityCheck > targetOrg.diameter * .5)) {
      isAttatched = false;
    }

    float holderAngle = angleStorage[0];
    float neededAngle = atan2((targetOrg.y - y), (targetOrg.x - x));

    //put the needed angle in the same quadrant as the holder angle so as to avoid nA == 1, hA == 360
    if (holderAngle > TWO_PI) {
      neededAngle += TWO_PI;
    } 
    else if (holderAngle < -TWO_PI) {
      neededAngle -= TWO_PI;  
    }

    //Get the shortest angle between the two E.G. nA == 170 and hA == -170
    if (abs(neededAngle - holderAngle) > PI) {
      if (holderAngle < neededAngle) {
        neededAngle -= TWO_PI;
      }
      else if (holderAngle > neededAngle) {
        neededAngle += TWO_PI;
      }
    }
    //finally update the angle
    neededAngle -= holderAngle;
    neededAngle *= divider;
    angleStorage[0] += neededAngle;
  }
}

/////////////////////////////////////////////////////////////////////////////ORANISM CLASS///////////////////////////////////////////


class Organism {
  float diameter, x, y;
  Tentacle[] tent = new Tentacle[1];

  boolean isFood = false;

  boolean isSelectable = true; //to determine if this org is alive
  boolean needsSplitting = false;
  int growthFrameCount = 0;
  float growthFactor;
  float growthAmount = .2; //the growth amount gets added to the grothfactor for each attatched tentacle

  Organism(int xpos, int ypos, float thewidth) {
    x = float(xpos);
    y = float(ypos);
    diameter = thewidth;
    tent[0] = new Tentacle(diameter, this);
  }

  void update() {
    if (!isFood) {
      if (needsSplitting == false) {
        int redValue = int(map(diameter, 10, 50, 0, 255));
        int blueValue = 255 - redValue;
        fill(redValue, 0, blueValue, 127);
      } 
      else {
        int growthColor = int(map(growthFrameCount, 0, 15, 0, 255));
        int growthC2 = 255 - growthColor;
        fill(0, growthC2, growthColor, 127);
      }

      //move each tentacle and move org
      for (int i = 0; i<tent.length; i++) {
        tent[i].update(x, y, diameter);
      }
      moveOrg();

      //draw
      ellipse(x, y, diameter, diameter);

      //check to see if the org needs to grow...
      grow();

      //split...
      if (diameter >= 49) {
        needsSplitting = true;
      }
      if (needsSplitting == true) {
        if (growthFrameCount <= 15) {
          growthFrameCount++;
        } 
        else if (growthFrameCount > 15) {
          splitOrg();
        }
      }

      //die...
      if ((diameter <= 10) || (((x > windowWidth) || (x < 0)) && ((y > windowHeight) || (y < 0)))) {
        diameter = 0;
        isSelectable = false;
        killOrg();
      }

      //or grow/kill a new tentacle
      if (int(diameter/10) != tent.length) {
        if (int(diameter/10) > tent.length) {
          growTentacle();
        }
        if (int(diameter/10) < tent.length) {
          killTentacle();
        } 
      }
    } 
    else {
      if (tent.length > 0) {
        killTentacle();
        diameter = 20;
      }
      fill(0, 127);
      ellipse(x, y, diameter, diameter);
      grow();
      if (diameter < 8) {
        diameter = 0;
        isSelectable = false;
        killOrg();
      }
    }
  }

  void moveOrg() {
    float motionVector = getMotionVector();
    if (motionVector != 0.0) {
      x += cos(motionVector)*orgSpeed;
      y += sin(motionVector)*orgSpeed;
    }
  }

  float getMotionVector() {
    float XAverage = 0;
    float YAverage = 0;
    //get the angles of all the tentacles, and average them into one angle.
    for (int i = 0; i<tent.length; i++) {
      if (tent[i].isAttatched == false) {
        XAverage += cos(tent[i].angleStorage[0]);
        YAverage += sin(tent[i].angleStorage[0]);
      }
    }
    return  atan2(YAverage, XAverage); //gives the angle of the forces in radians.
  }
  
  void splitOrg() {
    newOrg(x+random(-5, 5), y+random(-5, 5));
    newOrg(x+random(-5, 5), y+random(-5, 5));
    newOrg(x+random(-5, 5), y+random(-5, 5));
    newOrg(x+random(-5, 5), y+random(-5, 5));
    isSelectable = false;    
    killOrg();
  }

  void growTentacle() {
    Tentacle tenner = new Tentacle(diameter, this);
    tent = (Tentacle[]) append(tent, tenner);
  }
  void killTentacle() {
    tent = (Tentacle[]) shorten(tent);
  }
  void grow() {
    for (int i = 0; i < tent.length; i++) {
      if (tent[i].isAttatched) {
        growthFactor += growthAmount;
      }
    }
    if (needsSplitting == true) {
      growthFactor -= 2;
    }
    if (growthFactor != 0) {
      diameter += growthFactor;
      growthFactor = 0;
    }
  }
}