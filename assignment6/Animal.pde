


enum DIRECTION{
  R, L, U, D;
  
  static DIRECTION getRandomDirection(int i){
    return values()[i];
  }
}


class Animal{
  float x, y, speed;
  boolean alive, isMating, isFighting;
  int stamina; // keeps track of how full an animal is, which determines how fast it can move -1.0 - 1.0
  int size, matingTimer, fightingTimer;
  DIRECTION d;
  
  
  
  Animal(float x, float y){
    this.x = x; this.y = y;
    alive = true;
    isMating = false;
    stamina = 50;
    matingTimer = 0; fightingTimer = 0;
    randomDirection();
  }
  
  //moves in specified direction at a speed determined by base speed and stamina
  void move(){
    if (!isMating && !isFighting){ 
      float distanceMoved = speed + (.5 * stamina);
      if (d == DIRECTION.R){
        x += distanceMoved;
      } else if (d == DIRECTION.L){
        x -= distanceMoved;
      } else if (d == DIRECTION.U){
        y -= distanceMoved;
      } else if (d == DIRECTION.D){
        y += distanceMoved;
      }
    }
  }
  
  //displays Animal at x, y
  void display(){}
  
  //eats Food
  void tryEat(Food f){
    if (stamina < .8){
      f.getEaten();
      stamina += 5;
    }
  }
  
  //gets into contact with another animal
  void contact(Animal b){}
    //if (!a.isFighting && !isFighting){
      
    //}
  
  void randomDirection(){
    int i = (int) random(0, 3.999);
    d = DIRECTION.getRandomDirection(i);
  }
}
