


class RobotBody {
  boolean type;
 
  RobotBody() {

  }
 
  // display the robot body
  void display(float x, float y, float size) {
    rectMode(CENTER);
    fill(0, 128, 0);
    rect(x, y, 30 * size, 40 * size);

  }
 
}
