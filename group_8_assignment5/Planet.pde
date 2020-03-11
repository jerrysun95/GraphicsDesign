





class Planet{
  float radius, distance, speed;
  float angle = 0;
  Moon[] m;
  
  
  Planet(float radius, float distance, float speed){
    this.radius = radius; this.distance = distance; this.speed = speed;
  }
  
  
  void display(int x, int y, int sRadius){
    fill(100, 210, 100);

    pushMatrix();
    translate(x, y);
    
    rotateZ(angle);
    translate(distance + sRadius, distance + sRadius, 0);
    
    //rotate(angle);
    sphere(radius);
    popMatrix();
    
    if (m != null){
      for (int i = 0; i < m.length; i++){
        m[i].display(x, y, distance + sRadius, angle, radius);
      }
    }
    
    
    updateAngle();
  }
  
  void updateAngle(){
    angle += 0.01 * speed;
  }
  
  void addMoon(Moon mn){
    if (m != null){
      Moon[] temp = new Moon[m.length + 1];
      for (int i = 0; i < m.length; i++){
        temp[i] = m[i];
      }
      temp[temp.length - 1] = mn;
      m = temp;
    } else {
      m = new Moon[] {mn};
    }
  }
  
}
