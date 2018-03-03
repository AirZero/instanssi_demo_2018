import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class real_demo_final extends PApplet {

  

SoundFile file;
//3d
//PShape pieta;
int aloitusaika = 25000; 

//kimpoviivat 
int num = 3000;
int range = 200;
float[] ax = new float[num];
float[] ay = new float[num]; 

//pallomeri
float yoff = 0.0f;        // 2nd dimension of perlin noise
int palloX = 300;
int palloY = 160;

//valoviivat
int numBalls = 50;
float spring = 0.5f;
float gravity = 0.00f;
float friction = -0.9f;
Ball[] balls = new Ball[numBalls];

public void setup() {
  //3d
  //pieta = loadShape("v2.obj");
   
  file = new SoundFile(this, "SoundBox-music.wav");
  file.play();
  
  
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
   frameRate(30);
  }
  
  //kimpoviivat
    for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
    
  
}

public void draw() {

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
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  }
  
  public void display() {
    line(0, 1000, random(2000), random(800));
    stroke(random(255), random(255), random(255));
    fill(random(255), random(255), random(255));
  }
}

boolean jee = false;
public void pallo() {
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

public void efekti1(){
for (Ball ball : balls) {
    ball.display();  
  }
}

public void efekti2(){
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
    vertex(x, y-310);
    // Increment x dimension for noise
    xoff += 0.05f;  
}
  // increment y dimension for noise
  yoff += 0.01f;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  pallo();


  }

public void efekti3(){
  background(51);
  //fill(0,0,0);
  stroke(55, 0, 255);
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
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
    float val = PApplet.parseFloat(i)/num * 204.0f + 51;
    stroke(random(255), random(255), random(255));
    strokeWeight(2);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
  }
}

public void efekti4(){
     textSize(90);
     text("Moi", 100, millis()/10); 
     fill(0, 102, 153);
     
     if(millis()>3000){
       text("kaikki", 400, millis()/10);
     fill(0, 102, 153);
     }
    
     if(millis()>7000){
       text("ja ", 850, millis()/10);
     }
     
     if(millis()>10000){
       if(millis()>10000&&millis()<aloitusaika+40000){
     efekti1();
     }
       
       text("Yaamboo, Teistiz, Zeggo, BFlorry, Logio, jyrama, fuksit", -millis()/10 + 2900, 650);
       text("RazorNova, KingThrill, Zouppen, Zipola, Maakuth, k2h", -millis()/10 + 2900, 800);
       
     }
     
     if(millis()>(aloitusaika+40000)&&millis()<(aloitusaika+50000)){
     efekti2();
     textSize(90);
     text("Koodi: AirZero, Biisi: Tinuzka", 100, 100);
     }
     
     if(millis()>(aloitusaika+50000)){
      efekti3();
 }       
}
  public void settings() {  size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "real_demo_final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}