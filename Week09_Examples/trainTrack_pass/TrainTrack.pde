class TrainTrack {
  float trackX = 40;
  float trackY = 40;
  float trackSpeed = 2;
  
  TrainTrack(float startX, float startY, float startSpeed) {
    trackX = startX;
    trackY = startY;
    trackSpeed = startSpeed;
  }
  
  void update() {
    trackY += trackSpeed;
    line(trackX - 10, trackY - 10, trackX -10, trackY+10);
    line(trackX - 12, trackY, trackX + 12, trackY);
    line(trackX + 10, trackY - 10, trackX + 10, trackY+10);

    if (trackY > height) {
      // set off screen so it comes on
      trackY = -20;
    }
  }
}