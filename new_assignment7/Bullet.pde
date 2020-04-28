


class Bullet{
  float x, y, speed;
  boolean lastDirection;
  int type;
  int decayCounter, decay;
  
  Bullet(float x, float y, boolean lastDirection, int type){
    this.x = x; this.y = y; this.lastDirection = lastDirection; this.type = type;
    decay = 60;
    speed = 5;
  }
  
  void update(){
    move();
    countDecays();
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    if (!lastDirection){
      scale(-1, 1);
    }
    image(bullets[type], 0, 0);
    popMatrix();
  }
  
  void move(){
    if (lastDirection){
      x += speed;
    } else {
      x -= speed;
    }
  }
  
  void countDecays(){
    decayCounter += 1;
    if (decayCounter == decay){
      h.removeBullet(this);
    }
  }
}
