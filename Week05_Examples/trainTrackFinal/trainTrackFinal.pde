// traintracks

int numTracks = 20;
float trackX = 40;
float[] trackY = new float[numTracks];
float trackSpeed = 2.3;

void setup() {
  size(80, 400);
  strokeWeight(4);
  for (int i = 0; i<numTracks; i++) {
    trackY[i] = i*20;
  }
}

void draw() {
  background(200);
  for (int i = 0; i<numTracks; i++) {
    trackY[i] += trackSpeed;
    line(trackX - 10, trackY[i] - 10, trackX -10, trackY[i]+10);
    line(trackX - 10, trackY[i], trackX + 10, trackY[i]);
    line(trackX + 10, trackY[i] - 10, trackX + 10, trackY[i]+10);

    if (trackY[i] > height) {
      trackY[i] = 0;
    }
  }
}