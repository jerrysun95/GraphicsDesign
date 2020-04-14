

Environment e;

PImage food;
PImage shrubbery;
PImage cat;
PImage dog;
PImage bluejay;
PImage eagle;
PImage ant;
PImage tarantula;

int timer; 
int numTicks;

void setup(){
  
  fullScreen();
  
  frameRate(30);
  
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
  ant = loadImage("ant.png");
  ant.resize(20, 20);
  tarantula = loadImage("tarantula.png");
  tarantula.resize(40, 30);
  
  
}


void draw(){
  numTicks++;
  
  image(cat, 100, 100);
  image(dog, 200, 100);
  image(ant, 100, 200);
  image(tarantula, 200, 200);
  image(eagle, 300, 100);
  
  //e.simulate();
  
  if (numTicks == timer){
    numTicks = 0;
    e.update();
  }
  
}
