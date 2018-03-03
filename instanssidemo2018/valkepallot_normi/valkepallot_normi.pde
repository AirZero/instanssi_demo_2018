import hypermedia.net.*;
import java.nio.ByteBuffer;

int PORT_RX=0x26B5;
String HOST_IP = "192.168.104.131";//IP Address of the PC in which this App is running
UDP udp;//Create UDP object for recieving
//1, 0, 0, 255, 0, 0'



int numBalls = 18;
float spring = 0.5;
float gravity = 0.00;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
//char data[] = {1, 0, 116, 0, 255, 0, 0, 0, 116, 0, 255, 0, 0};
//byte data[] = {1, 0, 0, 112, 122, 122};
char valo = 0;
ByteBuffer out = ByteBuffer.allocateDirect(8);
ByteBuffer bb = ByteBuffer.wrap(new byte[] {1, 0, 0, 111, 0, 0});
String jee = bb.toString();

void setup() {
  udp= new UDP(this, PORT_RX, HOST_IP);
  udp.log(true);
  udp.listen(true);
  //noLoop();
  size(640, 360);
  //udp.send("1, 0, 0, 0, 0, 255", "valot.party", 9909);
  
  
  for (int i = 0; i < numBalls; i++) {
    //bb = ByteBuffer.wrap(data[]{});
    String jee = bb.toString();
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
    valo = char(i);
    println(valo);
    //data[2] = valo;
    //data[13] = char(i*3);
    //String str2 = new String(data);
    udp.send(bb, "valot.party", 9909);
    //println(data + "valot.party" + 9909);
  }
    
  
}

void draw() {
  background(0);
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();  
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
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    ellipse(x, y, diameter, diameter);
    noStroke();
    fill(random(255), random(255), random(255));
  }
}