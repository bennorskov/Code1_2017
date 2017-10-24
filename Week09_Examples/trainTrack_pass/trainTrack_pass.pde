// traintracks
int numTracks = 21;
TrainTrack[] Tracks = new TrainTrack[numTracks];

TrainTrack[] Tracks2 = new TrainTrack[numTracks];

void setup() {
  size(120, 400);
  strokeWeight(4);
  for (int i = 0; i<numTracks; i++) {
    Tracks[i] = new TrainTrack(40, i * 20, 4);
    Tracks2[i] = new TrainTrack(80, i * 20, 6); 
  }
}

void draw() {
  background(200);
  for (int i = 0; i<numTracks; i++){
    Tracks[i].update();
    Tracks2[i].update();
  }
}