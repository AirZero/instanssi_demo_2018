 
int num = 3000;
int range = 200;

float[] ax = new float[num];
float[] ay = new float[num]; 


void setup() 
{
  size(1920, 1080);
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
  frameRate(30);
}

void draw() 
{
  background(51);
  
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
    float val = float(i)/num * 204.0 + 51;
    stroke(random(255), random(255), random(255));
    strokeWeight(2);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
  }
  
}