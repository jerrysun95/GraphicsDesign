

Environment e;

PImage food;
PImage shrubbery;
PImage cat;
PImage dog;
PImage bluejay;
PImage eagle;
PImage ant;
PImage tarantula;

void setup(){
  
  //fullScreen();
  size(800, 600);
  frameRate(10);
  
  rectMode(CORNERS);
  
  food = loadImage("food.png");
  food.resize(20, 20);
  shrubbery = loadImage("shrubbery.png");
  //shrubbery.resize(40, 10);
  cat = loadImage("cat.png");
  cat.resize(50, 50);
  dog = loadImage("dog.png");
  dog.resize(50, 50);
  eagle = loadImage("eagle.png");
  eagle.resize(40, 40);
  bluejay = loadImage("bluejay.png");
  bluejay.resize(30, 30);
  ant = loadImage("ant.png");
  ant.resize(20, 20);
  tarantula = loadImage("tarantula.png");
  tarantula.resize(40, 30);
  
  e = new Environment(0, 0, 0, 0, 0, 0);
  
}

void keyPressed(){
  e.addNew(key);
  //slow down framerate with 1, speed up with 2
  if (key == '1'){
    if (frameRate <= 5) {
      frameRate(5);
    } else {
      frameRate(frameRate-5);
      fill(200, 100, 100);
      circle(50, 50, 50);
    } 
  } else if (key == '2'){
    frameRate(frameRate+5);
    fill(100, 200, 100);
    circle(50, 50, 50);
  }
}

void mousePressed(){
  e.tryDelete();
}


void draw(){
  background(150, 150, 90);
  
  e.simulate();
  
}
