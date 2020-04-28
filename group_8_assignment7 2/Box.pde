


class Box{
  float x, y, yVel;
  float grav = 0.05;
  Weapon w;
  boolean airborne;
  int size;
  
  Box(){
    x = random(200, width-10);
    y = -10;
    int type = (int) random(0, weapons.length-0.001);
    w = new Weapon(type);
    airborne = true;
    size = 10;
  }
  
  void update(){
    moveY();
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    image(box, 0, 0);
    popMatrix();
  }
  
  void moveY(){
    yVel += grav;
    y += yVel/5;
    if (y + box.height > height-20){
      yVel = 0;
      y = height-20 - box.height;
      airborne = false;
    }
  }
  
  Weapon getWeapon(){
    return w;
  }
}
