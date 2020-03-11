


class Moon{
  float radius, distance, speed;
  float angle = 0;
  
  Moon(float radius, float distance, float speed){
    this.radius = radius; this.distance = distance; this.speed = speed;
  }
  
  void display(int x, int y, float pDistance, float pAngle, float pRadius){
    pushMatrix();
    translate(x, y);
    rotateZ(pAngle);
    translate(pDistance, pDistance, 0);
    rotateZ(-pAngle);
    rotateZ(angle);
    translate(distance + pRadius, distance + pRadius, 0);
    displayMe();
    popMatrix();
    
    updateAngle();
  }
  
  void displayMe(){
    fill(100, 100, 210);
    sphere(radius);
  }
  
  void updateAngle(){
    angle += 0.01 * speed;
  }
  
}



class Satellite extends Moon{
  
  Satellite(float radius, float distance, float speed){
    super(radius, distance, speed);
  }
  
  void displayMe(){
    pushMatrix();
    scale(radius);
    rotate(2.4);
    shape(satellite, 0, 0);
    popMatrix();
    
    
  }

}


class UFO extends Moon{
  
  UFO(float radius, float distance, float speed){
    super(radius, distance, speed);
  }
  
  void displayMe(){
    pushMatrix();
    scale(radius);
    rotate(2.4);
    shape(ufo, 0, 0);
    popMatrix();
  }
  
}
