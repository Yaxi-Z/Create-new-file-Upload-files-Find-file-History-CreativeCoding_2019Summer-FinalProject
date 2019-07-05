PImage bus;
PImage sunshine;
PImage cloud;

int x=0;
int y=150;
import processing.serial.*;
Serial myPort;

int distance=0;

void setup() {
  size (640, 480);
  bus=loadImage("bus.png");
  sunshine=loadImage("sunshine.png");


  myPort=new Serial(this,"COM3",9600);}
void draw(){
   background(255);
   
  image(sunshine,20,20);
  
  if (myPort.available()>0){
    distance=myPort.read();
    println(distance);
  }
  
   fill(30,40,40);
  rect(600, 80, 30, 200);
  x=(450-distance)*(600-bus.width)/450;
    image(bus, x, y);
    text("Distance is"+distance+"CM",400,40);
}
  
 




  

  
void keyPressed() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      if (x>0) {
        x=x-1;
      } else {
        x=0;
      }
      break;
    case RIGHT:
      if (x<(600-bus.width)) {
        x=x+1;
      } else {
        x=600-bus.width;
      }
      break;
      default:
      break;
    }
  }
}
