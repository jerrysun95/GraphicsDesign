


class Weapon{
  int type;
  int fireTime, downTime;
  
  Weapon(int type){
    this.type = type;
  }
  
  void display(boolean lastDirection){
    pushMatrix();
    translate(0, 6);
    if (lastDirection){
      image(weapons[type], 0, 0);
    } else {
      image(weapons[type], -10, 0);
    }
    popMatrix();
  }
  
  void update(){
    if (downTime > 0){
      downTime -= 1;
    }
  }
  
  void shoot(float x, float y, boolean lastDirection){
    if (downTime == 0){
      if (lastDirection){
        h.addBullet(new Bullet(x+weapons[type].width, y+6, lastDirection, type));
      } else {
        h.addBullet(new Bullet(x-weapons[type].width+10, y+6, lastDirection, type));
      }
      if (type == 0){
        downTime = 15;
      } else if (type == 1){
        downTime = 5;
      }
    }
  }
}
