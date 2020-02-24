class Planet {
  Sun s; 
  int radius; 
  float speed; 
  float distance;
  float angle;
  boolean clockwise;

  //default constructor has speed = 1
  Planet(Sun s, int radius, float distance) {
    this.radius = radius;
    this.speed = 1;
    this.distance = distance;
    this.s = s;
    this.angle = 0;
    this.clockwise = true;
  }
  
  //overloaded constructor has modifiable speed
  Planet(Sun s, int radius, float distance,  float speed) {
    this.radius = radius;
    this.distance = distance;
    this.speed = speed;
    this.s = s;
    this.angle = 0;
    this.clockwise = true;
  }

  //sets direction to clockwise
  void clockwise(){
    //speed = abs(speed);
    clockwise = true;
  }
  
  //sets direction to counterclockwise
  void counterclockwise(){
    speed = -abs(speed);
    clockwise = false;
  }
  
  //adds or subtracts to angle, depending on boolean clockwise
  void updateAngle(){
    
    angle += 0.01 * speed;
    
    //if (clockwise){
    //  angle += 0.01 * speed;
    //  //if (angle > TWO_PI){
    //  //  angle = 0;
    //  //}
    //} else {
    //  angle -= 0.01 * speed;
    //  //if (angle < 0){
    //  //  angle = TWO_PI;
    //  //}
    //}
  }

  //moves and draws Planet relative to host Sun
  void update() {
    fill(150, 210, 150);
    
    pushMatrix();
    translate(s.x, s.y);
    rotate(angle);
    circle(distance + s.radius/2, distance + s.radius/2, radius);
    popMatrix();
    
    updateAngle();
    
  }
}
