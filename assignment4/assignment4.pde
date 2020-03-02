


import processing.sound.*;
SoundFile file;
String audioName = "SpaceCruise.mp3";
String path;
//empty array of Robot object
Robot[] robots = new Robot[8];

//empty array of Star objects
Star[] backgroundStars = new Star[500];

void setup(){
  frameRate(60);
  fullScreen();
  background(25);
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
  
  for (int i = 0; i < robots.length; i++){
    if (random(0, 1) < 0.5){
      robots[i] = new ZigZagRobot();  
    } else {
      robots[i] = new Robot();
    }
  }
  
  //fills array with Star objects of random sizes, x/y positions
  for (int i = 0; i < backgroundStars.length; i++){
    backgroundStars[i] = new Star();
  }
  
}

void draw(){
  background(25);
  
  //display and update all Star objects in stars[]
  for (int i = 0; i < backgroundStars.length; i++){
    backgroundStars[i].display();
    backgroundStars[i].update();
  }
  
  //display and update all Robot objects in robots[]
  for (int i = 0; i < robots.length; i++){
    robots[i].display();
    robots[i].update();
  }

}
