class Moon extends Planet{
  Planet p;
  
  Moon(Planet p, int radius, float distance) {
    super(p.s, radius, distance);
    this.p = p;
  }
  
  Moon(Planet p, int radius, float distance, float speed) {
    super(p.s, radius, distance, speed);
    this.p = p;
  }
  
  //sets angle equal to host Planet's angle
  void updateAngle(){
    //if (clockwise){
    //  angle = p.angle;
    //  if (angle > TWO_PI){
    //    angle = 0;
    //  }
    //} else {
    //  angle = -p.angle;
    //  //if (angle < 0) {
    //  //  angle = TWO_PI;
    //  //}
    //}
    
    angle = p.angle;
  }
  
  //moves and draws Moon relative to host Planet
  void update(){
    fill(150, 150, 210);
    
    pushMatrix();
    translate(s.x, s.y);
    rotate(abs(angle));
    translate(p.distance + s.radius/2, p.distance + s.radius/2);
    rotate(angle * speed);
    //if (clockwise){
    //  circle(distance + p.radius/2, distance + p.radius/2, radius);
    //} else {
    //  circle(-(distance + p.radius/2), -(distance + p.radius/2), radius);
    //}
    
    if (p.clockwise){
      circle(distance + p.radius/2, distance + p.radius/2, radius);
    } else {
      
    }
    popMatrix();
    
    updateAngle();
    
  }
  
}
