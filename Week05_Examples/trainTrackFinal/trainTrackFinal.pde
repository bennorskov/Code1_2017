// traintracks
int numTracks = 21;
float trackX = 40;
float[] trackY = new float[numTracks];
float trackSpeed = 2;

void setup() {
  size(80, 400);
  strokeWeight(4);
  for (int i = 0; i<numTracks; i++) {
    trackY[i] = i * 20;
  }
}

void draw() {
  background(200);
  for (int i = 0; i<numTracks; i++){
    trackY[i] += trackSpeed;
    line(trackX - 10, trackY[i] - 10, trackX -10, trackY[i]+10);
    line(trackX - 12, trackY[i], trackX + 12, trackY[i]);
    line(trackX + 10, trackY[i] - 10, trackX + 10, trackY[i]+10);

    if (trackY[i] > height) {
      // set off screen so it comes on
      trackY[i] = -20;
    }
  }
  }