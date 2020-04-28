


class Flag{
  int x, y;
  
  Flag(int x, int y){
    this.x = x; this.y = y;
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    image(flag, 0, 0);
    popMatrix();
  }
}
