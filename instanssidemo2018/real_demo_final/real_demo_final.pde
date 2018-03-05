  
import processing.sound.*;
SoundFile file;
//3d
//PShape pieta;
int aloitusaika = 25000; 

float naytonkoko = 0.5;

//kimpoviivat 
int num = 3000;
int range = 200;
float[] ax = new float[num];
float[] ay = new float[num]; 

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
  //3d
  //pieta = loadShape("v2.obj");
   
  file = new SoundFile(this, "SoundBox-music.wav");
  file.play();
  
  size(960, 540);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width)*naytonkoko, random(height)*naytonkoko, random(30, 70), i, balls);
   frameRate(30);
  }
  
  //kimpoviivat
    for(int i = 0; i < num; i++) {
    ax[i] = naytonkoko*width/2;
    ay[i] = naytonkoko*height/2;
  }
    
  
}

void draw() {

  /*  
  //3d
  lights();
  camera(0, 0, height * .86602,
    0, 0, 0,
    0, 1, 0);
  shape(pieta);
  pieta.rotateY(.01);
  */
  
  background(0);
  ////if(millis()<(30000+aloitusaika)&&millis()<(aloitusaika+40000)){
  efekti4();
  //}
  
//  if(millis()>(aloitusaika+40000)&&millis()<(aloitusaika+50000)){
     //efekti2();
//  }
  
  //if(millis()>(aloitusaika+60000)){
  //    efekti3();
 // }
}
  

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = naytonkoko*xin;
    y = naytonkoko*yin;
    diameter = naytonkoko*din;
    id = idin;
    others = oin;
  }
  
  void display() {
    line(0, naytonkoko*1000, random(2000), random(800));
    stroke(random(255), random(255), random(255));
    fill(random(255), random(255), random(255));
  }
}

boolean jee = false;
void pallo() {
  if(palloY>naytonkoko*200){
  jee = true;}
  if(palloY<naytonkoko*100){
  jee = false;
  }
  
  if(jee==false){
  ellipse(naytonkoko*960, naytonkoko*palloY, naytonkoko*200, naytonkoko*200);
 // fill(random(255),random(255),random(255));
  palloY++;
  }
  
  if(jee == true){
  ellipse(naytonkoko*960, naytonkoko*palloY, naytonkoko*200, naytonkoko*200);
 // fill(random(255),random(255),random(255));
  palloY--;
  }
  
}

void efekti1(){
for (Ball ball : balls) {
    ball.display();  
  }
}

void efekti2(){
  fill(0, 102, 153);
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
    vertex(x, naytonkoko*(y-310));
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

void efekti3(){
  background(51);
  //fill(0,0,0);
  stroke(55, 0, 255);
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = naytonkoko*ax[i];
    ay[i-1] = naytonkoko*ay[i];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  ellipse(ax[num-1], ay[num-1], 50, 50);
  
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
    stroke(random(255), random(255), random(255));
    strokeWeight(2);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
  }
}

void efekti4(){
     textSize(90);
     text("Moi", naytonkoko*100, naytonkoko*millis()/10); 
     fill(0, 102, 153);
     
     if(millis()>3000){
       text("kaikki", naytonkoko*400, naytonkoko*millis()/10);
     fill(0, 102, 153);
     }
    
     if(millis()>7000){
       text("ja ", 850*naytonkoko, naytonkoko*millis()/10);
     }
     
     if(millis()>10000){
       if(millis()>10000&&millis()<aloitusaika+40000){
     efekti1();
     }
       
       text("Yaamboo, Teistiz, Zeggo, BFlorry, Logio, jyrama, fuksit", -millis()/10 + 2900*naytonkoko, 650*naytonkoko);
       text("RazorNova, KingThrill, Zouppen, Zipola, Maakuth, k2h", -millis()/10 + 2900*naytonkoko, 800*naytonkoko);
       
     }
     
     if(millis()>(aloitusaika+40000)&&millis()<(aloitusaika+50000)){
     efekti2();
     textSize(90*naytonkoko);
     text("Koodi: AirZero, Biisi: Tinuzka", 100*naytonkoko, 100*naytonkoko);
     }
     
     if(millis()>(aloitusaika+50000)){
      efekti3();
 }       
}