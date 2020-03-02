Robot robot;

//empty array of Star objects
Star[] backgroundStars = new Star[500];

void setup(){
  size(800,600);
  //fullScreen();
  background(25);
  
  robot = new Robot(1, 1, true, true);
  
  //fills array with Star objects of random sizes, x/y positions
  for (int i = 0; i < backgroundStars.length; i++){
    backgroundStars[i] = new Star();
  }
  
}

void draw(){
  background(25);
  
  //display all stars
  for (int i = 0; i < backgroundStars.length; i++){
    backgroundStars[i].display();
    backgroundStars[i].update();
  }
  
  robot.display();
  robot.update();
  
  
  
}
