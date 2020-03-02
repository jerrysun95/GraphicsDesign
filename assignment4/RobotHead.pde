


class RobotHead{
  boolean type;
  
  RobotHead(boolean type){
    this.type = type;
    
    
  }
  
  void display(float x, float y, float size){
    fill(100, 210, 210);
    if (type){
      circle(x, y - 50 * size, 80 * size);
    } else {
      square(x, y - 75 * size, 60 * size);
    }
  }
  
  
}
