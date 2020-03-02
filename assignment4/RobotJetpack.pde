


//position depends on RobotBody
class RobotJetpack{
  RobotJetpackThruster thruster;
  boolean position; //left side if true, right side if false
  
  RobotJetpack(boolean position){
    this.position = position;
    thruster = new RobotJetpackThruster();
  }
  
  void display(float x, float y, float size){
    if (this.position){
      thruster.display(x - 55 * size, y + 5 * size, size);
      fill(150, 150, 150);
      rect(x - 55 * size, y + 5 * size, 30 * size, 80 * size);
    } else {
      thruster.display(x + 55 * size, y + 5 * size, size);
      fill(150, 150, 150);
      rect(x + 55 * size, y + 5 * size, 30 * size, 80 * size);
    }
    
  }
  
}
