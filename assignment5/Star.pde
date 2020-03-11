


class Star{
  float x, y, size;
  boolean shine = false;
  int shineDecay = 0;
  
  Star(){
    this.x = random(0, width);
    this.y = random(0, height);
    this.size = random(1, 3.9999);
    rollShine();
  }
  
  void display(){
    if (shine){
      shineDecay -= 1;
      if (shineDecay < 1){
        shine = false;
      }
    }
      rollShine();
    
    pushMatrix();
    translate(x, y);
    if (shine){
      fill(255);
      sphere(size + 1);
    } else {
      fill(220);
      sphere(size);
    }
    popMatrix();
  }
  
  void rollShine(){
    if (random(0, 1) < 0.1){
      shine = true;
      shineDecay += (int) random(4, 9.999);
    }
  }
  
}
