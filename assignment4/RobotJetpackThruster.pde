


class RobotJetpackThruster{
  float innerSize; //controls size of inner flame
  boolean up = true;
  
  RobotJetpackThruster(){
    this.innerSize = 1;
  }
  
  void display(float x, float y, float size){
    fill(210, 60, 60);
    circle(x, y + 40 * size, 30 * size);
    fill(150, 40, 40);
    circle(x, y + 40 * size, this.innerSize);
    updateInnerSize(size);
  }
  
  void updateInnerSize(float size){
    if (this.up){
      innerSize += 0.5;
      if (innerSize >= 20 * size){
        this.up = false;
      }
    } else {
      innerSize -= 0.5;
      if (innerSize <= 7.5 * size){
        this.up = true;
      }
    }
  }
  
}
