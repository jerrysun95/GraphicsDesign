


class Platform{
  int x, y, w, h;
  
  Platform(int x, int y, int w, int h){
    this.x = x; this.y = y; this.w = w; this.h = h;
  }
  
  void display(){
    fill(100, 160, 100);
    rect(x, y, w, h);
  }
}
