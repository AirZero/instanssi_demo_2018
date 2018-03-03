//pallomeri
float yoff = 0.0;        // 2nd dimension of perlin noise
int palloX = 300;
int palloY = 160;



//valoviivat
int numBalls = 50;
float spring = 0.5;
float gravity = 0.00;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

void setup() {
  
  size(1920, 1080);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
   frameRate(30);
  }
    
  
}

void draw() {

  background(0);
  if(millis()<10000){
  for (Ball ball : balls) {
    ball.display();  
  }
  }
  
  if(millis()>10000){
    background(0, 255, 0);
  
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 400,800); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    vertex(x, y-310);
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

}

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  }
  
  void display() {
    line(0, 1000, random(2000), random(800));
    stroke(random(255), random(255), random(255));
    fill(random(255), random(255), random(255));
  }
}

boolean jee = false;
void pallo() {
  if(palloY>200){
  jee = true;}
  if(palloY<100){
  jee = false;
  }
  
  if(jee==false){
  ellipse(960, palloY, 200, 200);
 // fill(random(255),random(255),random(255));
  palloY++;
  }
  
  if(jee == true){
  ellipse(960, palloY, 200, 200);
 // fill(random(255),random(255),random(255));
  palloY--;
  }
  
}