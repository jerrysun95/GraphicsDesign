

  
import processing.sound.*;
SoundFile background;
SoundFile die;
SoundFile jump;
SoundFile gun1;
SoundFile gun2;
SoundFile gun3;

PImage[] pIdle = new PImage[4];
PImage[] pWalk = new PImage[7];
PImage[] weapons = new PImage[3];
PImage[] bullets = new PImage[weapons.length];
PImage flag, box;
PImage[] flyer = new PImage[4];
PImage[] crawler = new PImage[2];

Handler h;

PFont pixelmania; //stores font

void setup(){
  
  size(600, 400);
  
  //allow different characters by waiting until a character is chosen to do this
  //likely start this at the beginning of the level to avoid unnecessary loading
  for (int i = 0; i < pIdle.length; i++){
    String imageName = "data/player/idle/idle" + nf(i+1, 2) + ".gif";
    pIdle[i] = loadImage(imageName);
  }
  for (int i = 0; i < pWalk.length; i++){
    String imageName = "data/player/walk/walk" + nf(i+1, 2) + ".gif";
    pWalk[i] = loadImage(imageName);
  }
  for (int i = 0; i < weapons.length; i++){
    String imageName = "data/weapons/weapon" + nf(i+1, 2) + ".png";
    weapons[i] = loadImage(imageName);
    imageName = "data/bullets/bullet" + nf(i+1, 2) + ".png";
    bullets[i] = loadImage(imageName);
  }
  flag = loadImage("data/items/flag.png");
  box = loadImage("data/items/box.png");
  for (int i = 0; i < flyer.length; i++){
    String imageName = "data/enemies/flyer/flyer" + nf(i+1, 2) + ".gif";
    flyer[i] = loadImage(imageName);
  }
  
  // loading crawler  
  for (int i = 0; i < crawler.length; i++){
    String imageName = "data/enemies/crawler/crawler" + nf(i+1, 2) + ".gif";
    crawler[i] = loadImage(imageName);
  }
  
  //imports and sets font
  pixelmania = createFont("data/font/Pixelmania.ttf", 25);
  textFont(pixelmania);
  
  
  //background soundtrack
  background = new SoundFile(this, "data/sounds/background.mp3");
  background.play();
  // other soundtracks
  die = new SoundFile(this, "data/sounds/die.mp3");
  gun1 = new SoundFile(this, "data/sounds/gunOne.mp3");
  gun2 = new SoundFile(this, "data/sounds/gunTwo.mp3");
  gun3 = new SoundFile(this, "data/sounds/gunThree.mp3");
  noSmooth();
  noStroke();
  rectMode(CORNERS);
  
  h = new Handler();
  
}



void draw(){
  
  h.update();
  h.display();
  
}



void keyPressed(){
  if (key == 'a'){
    h.p.setGoingLeft(true);
  }
  if (key == 'd'){
    h.p.setGoingRight(true);
  }
  if (key == 'w'){
    h.p.jump();
    if (h.paused){
      h.selection-=1;
    }
  }
  if (key == 's'){
    if (h.paused){
      h.selection+=1;
    }
  }
  if (key == 'l'){
    h.p.shoot();
  }
}



void keyReleased(){
  if (key == 'a'){
    h.p.setGoingLeft(false);
  }
  if (key == 'd'){
    h.p.setGoingRight(false);
  }
  if (key == ' '){
    h.select();
  }
}



void newGame(){
  h = new Handler();
}
