class Sun{
  int x, y, radius;
  Planet[] p = new Planet[0];
  
  Sun(int x, int y, int radius){
    this.x = x; this.y = y; this.radius = radius;
  }
  
  void display(){
    fill(210, 210, 100);
    pushMatrix();
    translate(x, y);
    sphere(radius); 
    popMatrix();
    
    if (p != null){
      for (int i = 0; i < p.length; i++){
        p[i].display(x, y, radius);
      }
    }
    
  }
  
}
