Robot robot = new Robot(220,250,60,75,1);

//empty array of Star objects
Star[] backgroundStars = new Star[500];

void setup(){
  size(500,500);
  background(25);
  
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
