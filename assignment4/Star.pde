//import java.lang.Math;
//import java.util.Random;

class Star{
  int x, y, size;
  
  Star(){
    //initializes stars at random x/y positions with random sizes
    this.y = (int) (Math.random() * (height));
    randomize();
    
  }
  
  void display(){
    ellipseMode(CENTER);
    fill(255);
    noStroke();
    circle(this.x, this.y, this.size);
    stroke(1);
  }
  
  void update(){
    this.y += 2;
    if (this.y > height + 5){
      this.y = 0;
      randomize();
    }
  }
  
  //randomizes x/y positions and size
  private void randomize(){
    this.x = (int) (Math.random() * (width));
    this.size = (int) (Math.random() * (5-2) * 2);
  }
  
}
