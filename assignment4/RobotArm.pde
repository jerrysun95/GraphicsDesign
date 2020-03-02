


class RobotArm {
  boolean type; 
  boolean position;
  float angle;
  boolean up = true;
  
  RobotArm(boolean type, boolean position){
    this.type = type;
    this.position = position;
  }
  
  void display(float x, float y, float size, float speed){
    fill(0, 180, 0);
    
    pushMatrix();
    translate(x, y - 10 * size);
    if (this.position){
      rotate(this.angle);
      rect(20 * size, 0, 60 * size, 10 * size);
    } else {
      rotate(-this.angle);
      rect(-20 * size, 0, 60 * size, 10 * size);
    }
    popMatrix();
    
    this.updateAngle(speed);
  }
  
  void updateAngle(float speed){
    if (this.up){
      this.angle += 0.05 * speed;
      if (this.type && this.angle > HALF_PI){
        this.up = false;
      }
    } else {
      this.angle -= 0.05 * speed;
      if (this.type && this.angle < -HALF_PI){
        this.up = true;
      }
    }
    
  }
  
}
