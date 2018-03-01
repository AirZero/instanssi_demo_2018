import processing.net.*;

float yoff = 0.0;        // 2nd dimension of perlin noise
int palloX = 300;
int palloY = 30;

void setup() {
  size(640, 480);
  fill(90, 90, 190);
}

void draw() {
  background(0, 255, 0);
  
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    vertex(x, y-110);
    // Increment x dimension for noise
    xoff += 0.05;  
}
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  pallo();
  
}

boolean jee = false;
void pallo() {
  if(palloY>100){
  jee = true;}
  if(palloY<30){
  jee = false;
  }
  
  if(jee==false){
  ellipse(300, palloY, 50, 50);
 // fill(random(255),random(255),random(255));
  palloY++;
  }
  
  if(jee == true){
  ellipse(300, palloY, 50, 50);
 // fill(random(255),random(255),random(255));
  palloY--;
  }
  
}