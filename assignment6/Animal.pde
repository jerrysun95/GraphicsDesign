


enum DIRECTION{
  R, L, U, D;
  
  static DIRECTION getRandomDirection(int i){
    return values()[i];
  }
}


class Animal{
  float x, y, speed;
  boolean isAlive;
  float stamina; // keeps track of how full an animal is, which determines how fast it can move -1.0 - 1.0
  int size, timeSinceLastMate;
  DIRECTION d;
  String type;
  String[] attackTypes; //keeps track of what Animals it will fight
  
  
  Animal(float x, float y){
    this.x = x; this.y = y;
    isAlive = true;
    stamina = .5;
    randomDirection();
    timeSinceLastMate = (int) random(0, 50);
  }
  
  
  //moves in specified direction at a speed determined by base speed and stamina
  void move(){
    float distanceMoved = speed + (.05 * stamina);
    if (d == DIRECTION.R){
      x += distanceMoved;
    } else if (d == DIRECTION.L){
      x -= distanceMoved;
    } else if (d == DIRECTION.U){
      y -= distanceMoved;
    } else if (d == DIRECTION.D){
      y += distanceMoved;
    } 
    clamp();
    if (random(0, 1) < 0.05){ //may change direction randomly
      randomDirection();
    }
    update();
  }
  
  //clamps x and y positions to proper limits
  void clamp(){
    if (x < 0){
      x = 0;
      d = DIRECTION.R;
    } else if (x > width){
      x = width - size;
      d = DIRECTION.L;
    }
    if (y < 0){
      y = 0;
      d = DIRECTION.D;
    } else if (y > height){
      y = height - size;
      d = DIRECTION.U;
    }
  }
  
  //displays Animal at x, y
  void display(){}
  
  //updates any values an Animal may have
  void update(){
    timeSinceLastMate++;
    stamina -= 0.001; //lose stamina every step
    if (stamina < -1.0){ //if stamina drops below -1, the Animal dies
      isAlive = false;
    }
  }
  
  //eats Food
  boolean tryEat(Food f){
    if (stamina < .9 && f.uneaten){
      f.getEaten();
      stamina += .1;
      return true;
    }
    return false;
  }
  
  //gets into contact with another animal
  boolean tryMate(Animal b){
    if (type == b.type && stamina >= 0.5 && b.stamina >= 0.5 && timeSinceLastMate > 80 && b.timeSinceLastMate > 80){
      stamina -= 0.1;
      b.stamina -= 0.1;
      timeSinceLastMate = 0; b.timeSinceLastMate = 0;
      return true;
    }
    return false;
  }
  
  //determines outcome of two Animals coming into contact
  //Animal will die, kill, or nothing will happen
  void contact(Animal b){
    if (b.isAlive){
      for (int i = 0; i < attackTypes.length; i++){
        if (b.type == attackTypes[i]){
          attack(b);
        }
      }
    }
  }
  
  //fights another Animal
  //will either win and gain stamina (eats) or lose and die
  void attack(Animal b){}
  
  void kills(Animal b){
    stamina += 0.1;
    b.isAlive = false;
  }
  
  void killsChance(Animal b, float prob){
    if (random(0, 1) < prob){
      kills(b);
    } else {
      b.kills(this);
    }
  }
  
  //picks a random direction to move in
  void randomDirection(){
    int i = (int) random(0, 3.999);
    d = DIRECTION.getRandomDirection(i);
  }
  
  Animal mate(){return null;}
}
