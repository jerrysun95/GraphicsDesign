


class Star{
  int x, size;
  float y, speed;
  
  Star(){
    //initializes stars at random x/y positions with random sizes
    this.y = (int) (Math.random() * (height));
    randomize();
    
  }
  
  void display(){
    ellipseMode(CENTER);
    fill(255);
    noStroke();
    circle(this.x, (int) this.y, this.size);
    stroke(1);
  }
  
  void update(){
    this.y += speed;
    if (this.y > height + 5){
      this.y = 0;
      randomize();
    }
  }
  
  //randomizes x/y positions and size
  private void randomize(){
    this.x = (int) (Math.random() * (width));
    this.size = (int) (Math.random() * (5-2) + 2);
    this.speed =  (float) (Math.random() * (3) + 1);
  }
  
}
