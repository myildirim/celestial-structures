import oscP5.*;
import netP5.*;
import controlP5.*;

ControlP5 cp5;
OscP5 oscP5;
NetAddress myRemoteLocation;
int messageLength = 3;

float speed1 = PI/180;
float speed2 = PI/90;
float speed3 = PI/3;

void setup() {
  size(250, 100);
  frameRate(25);
  myRemoteLocation = new NetAddress("127.0.0.1", 8000);
  oscP5 = new OscP5(this, 8001);
  noStroke();
  cp5 = new ControlP5(this);

  cp5.addSlider("speed1")
    .setPosition(50, 10)
      .setSize(10, 70)
        .setRange(0, PI/4)
            ;
  cp5.addSlider("speed2")
    .setPosition(100, 10)
      .setSize(10, 70)
        .setRange(0, PI/4)
            ;
  cp5.addSlider("speed3")
    .setPosition(150, 10)
      .setSize(10, 70)
        .setRange(0, PI/4)
            ;
}

void draw() {
  background(0);
  OscMessage myMessage = new OscMessage("/test/1");
  myMessage.add(speed1);
  myMessage.add(speed2);
  myMessage.add(speed3);
  oscP5.send(myMessage, myRemoteLocation);
}

