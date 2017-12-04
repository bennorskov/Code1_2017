import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

OpenCV opencv;
Movie myMovie;

PImage src, colorFilteredImage;

int STATE = 0;
int MAX_STATES = 2;
int playbackStartTime = 0;
int recordStartTime = -1;
int ellipseDrawIndex = 0;

// <1> Store color data in this range. It's set in setup
// HSB color range is 0 => 360. Red is 0 and 360, Cyan is 180, etc....
// look at Processing => Tools => Color Selector for color examples
int rangeLow, rangeHigh;

// a Contour is a region of the image that openCV pulls out for you. 
ArrayList<Contour> contours;

//used for storing the center of the color you're tracking. 
ArrayList<timePositions> positions;

Rectangle ROI;

void setup() {
  size(1280, 360);
  myMovie = new Movie(this, "marker480.mov");
  myMovie.loop();

  opencv = new OpenCV(this, 640, 360);
  contours = new ArrayList<Contour>();
  positions = new ArrayList<timePositions>();

  // —————————————————————————————————  map the range of hues from the marker's color:
  color c = color(180, 63, 30); // I used Digital Color Meter (Apple tool) to find this color
  println("r: " + red(c) + " g: " + green(c) + " b: " + blue(c));
  int hue = int(map(hue(c), 0, 255, 0, 180));
  println("hue to detect: " + hue);

  //opencv wants a range of values:
  rangeLow = hue - 5;
  rangeHigh = hue + 5;

  // Using a Region of Interest (ROI) because there's some noise in the top left of the video
  ROI = new Rectangle(140, 100, 500, 250);
}

void draw() {
  if (STATE == 0) {
    recordState();
  } else if (STATE == 1) {
    playbackState();
  }
}

void recordState() {
  opencv.setROI(ROI.x, ROI.y, ROI.width, ROI.height); 
  opencv.loadImage(myMovie); 

  opencv.useColor();

  src = opencv.getSnapshot();

  // <3> Tell OpenCV to work in HSV color space.
  opencv.useColor(HSB);

  // <4> Copy the Hue channel of our image into 
  //     the gray channel, which we process.

  opencv.setGray(opencv.getH().clone());
  // <5> Filter the image based on the range of 
  //     hue values that match the object we want to track.
  opencv.inRange(rangeLow, rangeHigh);

  // <6> Get the processed image for reference.
  colorFilteredImage = opencv.getSnapshot();

  // <7> Find contours in our range image.
  //     Passing 'false', 'true' doesn't find holes and sorts them by descending area.
  contours = opencv.findContours(false, true);

  // <8> Display background images
  image(myMovie, 0, 0);
  image(src, ROI.x, ROI.y);
  image(colorFilteredImage, src.width + ROI.x *2, ROI.y);

  // <9> Check to make sure we've found any contours
  if (contours.size() > 0) {
    // <9> Get the first contour, which will be the largest one
    Contour biggestContour = contours.get(0);

    // <10> Find the bounding box of the largest contour,
    //      and hence our object.
    Rectangle r = biggestContour.getBoundingBox();

    // <11> Draw the bounding box of our object
    noFill(); 
    strokeWeight(2); 
    stroke(255, 0, 0);
    rect(r.x + ROI.x, ROI.y + r.y, r.width, r.height);

    // <12> Draw a dot in the middle of the bounding box, on the object.
    noStroke(); 
    fill(255, 0, 0);
    ellipse(r.x + r.width/2 + ROI.x, r.y + r.height/2 + ROI.y, 30, 30);
    if (recordStartTime == -1) {
      recordStartTime = millis();
    }
    positions.add( new timePositions( r.x + r.width/2 + ROI.x, r.y + r.height/2 + ROI.y, millis()-recordStartTime));
  }
}

void playbackState() {
  background(100);
  
  timePositions ellipsePosition = new timePositions(0, 0, 0);
  int currentTime = millis()%playbackStartTime;
  //draw the path
  noFill();
  stroke(200, 200, 90);
  beginShape();
  for (int i = 0; i<positions.size(); i++) {
    timePositions lastPoint = (i>0) ? positions.get(i-1) : positions.get(i);
    timePositions tp = positions.get(i);
    timePositions nextPoint = (i<positions.size()-1) ? positions.get(i+1) : positions.get(i);
    curveVertex(tp.x, tp.y);
    if (currentTime >= lastPoint.time && currentTime <= nextPoint.time) {
      ellipsePosition = tp;
    }
  }
  endShape();

  //move a circle along the path
  fill(200, 200, 90);
  noStroke();
  ellipse(ellipsePosition.x, ellipsePosition.y, 20, 20);
}

void mousePressed() {
  STATE++;
  STATE%=MAX_STATES;

  if (STATE == 0) {
    //reset playback and recording
    positions = new ArrayList<timePositions>();
    myMovie.jump(0);
    myMovie.play();
    int recordStartTime = -1;
  }

  if (STATE == 1) {
    myMovie.stop(); //movie keeps playing otherwise
    playbackStartTime = millis() - recordStartTime; //there's a slight delay to the recording of data
  }
}

void movieEvent(Movie m) {
  m.read();
}