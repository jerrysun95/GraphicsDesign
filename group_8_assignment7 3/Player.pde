


class Player{
  float x, y;
  boolean goingRight, goingLeft, airborne;
  boolean dead;
  boolean lastDirection; //if true, right. if false, left
  float speed, maxXVel;
  float xVel, yVel;
  float grav = 0.23;
  Weapon w;
  
  Player(){
    x = width-20; y = height-20-pWalk[0].height;
    airborne = true;
    maxXVel = 3; speed = 0.15;
    //w = new Weapon(1);
  }
  
  void update(){
    moveX();
    moveY();
    if (w != null){
      w.update();
    }
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    if (goingLeft || goingRight){
      int currentFrame = frameCount * 15 / 60 % pWalk.length;
      if (goingLeft){
        scale(-1, 1);
        image(pWalk[currentFrame], -pWalk[currentFrame].width, 0);
      } else {
        image(pWalk[currentFrame], 0, 0);
      }
    } else {
      int currentFrame = frameCount * 4 / 60 % pIdle.length;
      if (!lastDirection){ //if facing left
        scale(-1, 1);
        image(pIdle[currentFrame], -pWalk[currentFrame].width, 0);
      } else { //if facing right
        image(pIdle[currentFrame], 0, 0);
      }
    }
    if (w != null){
      w.display(lastDirection);
    }
    popMatrix();
  }
  
  void moveX(){
    if (goingLeft){
      if (xVel > 0){
        xVel = -speed;
      } else {
        xVel -= speed;
      }
    }
    if (goingRight){
      if (xVel < 0){
        xVel = speed;
      } else {
        xVel += speed;
      }
    }
    //slow down if not pressing a direction and still moving
    if (!goingRight && !goingLeft && xVel != 0){
      if (xVel < 0){
        xVel += speed * 1.5;
        xVel = h.clamp(xVel, -maxXVel, 0);
      } else if (xVel > 0){
        xVel -= speed * 1.5;
        xVel = h.clamp(xVel, 0, maxXVel);
      }
    }
    xVel = h.clamp(xVel, -maxXVel, maxXVel);
    x += xVel;
    x = h.clamp(x, 0, width-pWalk[0].width);
  }
  
  void moveY(){
    yVel += grav;
    y += yVel;
    if (y + pWalk[0].height > height-20){
      yVel = 0;
      y = height-20 - pWalk[0].height;
      airborne = false;
    }
  }
  
  void jump(){
    if (!airborne){
      airborne = true;
      yVel = -5;
      jump.play();
    }
  }
  
  void shoot(){
    if (w != null){
      w.shoot(x, y, lastDirection);
    }
  }
  
  void setGoingRight(boolean goingRight){
    this.goingRight = goingRight;
    if (goingRight){
      lastDirection = true;
    }
  }
  
  void setGoingLeft(boolean goingLeft){
    this.goingLeft = goingLeft;
    if (goingLeft){
      lastDirection = false;
    }
  }
  
  void setWeapon(Weapon w){
    this.w = w;
    h.hud.score += 1;
  }
  
  void die(){
    dead = true;
  }
}
