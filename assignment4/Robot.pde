class Robot {
  float x, y,wid,hei ,speed;
 
  //default constructor
  Robot() {
    x = 50;
    y = 50;
    wid = 50;
    hei = 50;
    speed = 1;
  }
 

  Robot(float x, float y, float wid, float hei, float speed) {
    this.x = x;
    this.y = y;
    this.wid = wid;
    this.hei = hei;
    this.speed = speed;
  };
 
  // display the robot body
  void display() {
    fill(0,128,0);
    rect(x, y, wid,hei);
  }
 
  
  void updatePosition(){
    y -=1;
  }
  void update() {
    fill(128,0,0);
    updatePosition();
    
 }
}
