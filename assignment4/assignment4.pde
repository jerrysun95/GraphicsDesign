Robot robot = new Robot(220,250,60,75,1);
void setup(){
  size(500,500);
}

void draw(){
  background(255);
  robot.display();
  robot.update();
}
