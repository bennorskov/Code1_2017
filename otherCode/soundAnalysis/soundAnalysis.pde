// import audio anaylysis library

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// this is the mimin object used to play music
Minim minim;

AudioPlayer song; 

// FFT is the algorithm to analyze sound by frequency. 
FFT fft;

int[] hertzForSampling = new int[6];
/* 
  I'm making hertz to analyze the waveform
  I'm sampling at 50, 150, etc... hertz
*/

void setup() {
  size(1000, 500);
  /*
    You can stick in any number of hertz here.
    If you have an audiogram, you can use the data from that to stick in this array
    (I'd definitely use a for loop for that)
  */
  hertzForSampling[0] = 50;
  hertzForSampling[1] = 150;
  hertzForSampling[2] = 200;
  hertzForSampling[3] = 250;
  hertzForSampling[4] = 300;
  hertzForSampling[5] = 500;

  minim = new Minim(this);

  song = minim.loadFile("Unn.mp3");
  song.play();
  
  // fft has to initialize with the size for the song you're analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());
}

void draw() {
  background(100);

  fft.forward( song.mix ); // this line breaks the sound down into bands
  // I'm cycling through the hertz we picked above. For each hertz, I'm drawing a line. 
  for (int i = 0; i < hertzForSampling.length; i++) {
    // map the number of hertz you'd like to use to the width of the screen
    float pos = map(i, 0, hertzForSampling.length, 50, width);
    
    // draw the line for frequency hertzForSampling[i], scaling it up a bit so we can see it
    line( pos, height/2, pos, height/2 - fft.getFreq( hertzForSampling[i] )*3 );
    line( pos, height/2, pos, height/2 + fft.getFreq( hertzForSampling[i] )*3 );
    text(hertzForSampling[i], pos, height/2); //which band is this one?
  }
}