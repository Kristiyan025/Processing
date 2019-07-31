
int totalFrames = 1200;
void setup() {
  size(640, 360);
  background(0);
  frameRate(24);
}

int counter = 1;
int x;
void draw() { 
  if(counter < totalFrames){
    counter++;
    x = counter % 640;
    stroke(255);
    line(x, 0 , x, 360);
  }
  else noLoop();
  
  saveFrame("frames/####.png");
}
