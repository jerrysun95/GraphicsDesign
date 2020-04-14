


class Food{
  float x, y;
  boolean uneaten;
  
  Food(float x, float y){
    this.x = x; this.y = y;
    uneaten = true;
  }
  
  void getEaten(){
    uneaten = false;
  }
  
  void display(){
    image(food, x, y);
  }
  
}
