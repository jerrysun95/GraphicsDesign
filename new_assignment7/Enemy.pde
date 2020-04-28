


abstract class Enemy{
  float x, y;
  int size;
  
  Enemy(){
    
  }
  
  void update(){}
  
  void display(){}
}



class Flyer extends Enemy{
  boolean goingUp;
  int moveCount;
  float speed;
  
  Flyer(){
    size = 9;
    this.x = -10;
    this.y = height-40;
    if (random(0, 1) > 0.5){
      goingUp = true;
    }
    moveCount = 50;
    speed = 0.3;
  }
  
  void update(){
    move();
  }
  
  void display(){
    int currentFrame = frameCount * 15 / 60 % flyer.length;
    pushMatrix();
    translate(x, y);
    image(flyer[currentFrame], 0, 0);
    popMatrix();
  }
  
  void move(){
    x += speed;
    if (goingUp){
      y += 0.2;
    } else {
      y -= 0.2;
    }
    moveCount++;
    if (moveCount == 100){
      goingUp = !goingUp;
      moveCount = 0;
    }
  }
}
