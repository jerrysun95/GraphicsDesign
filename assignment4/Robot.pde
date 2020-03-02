


class Robot{
  float x, y, size, speed;
  RobotHead head;
  RobotBody body;
  RobotArm arm;
  
  Robot(float size, float speed, boolean headType, boolean armType){
    this.size = size;
    this.speed = speed;
    randomize();
    this.head = new RobotHead(headType);
    this.body = new RobotBody();
    this.arm = new RobotArm(armType);
    
    
    
  }
  
  private void randomize(){
    this.x = random(10, width - 10);
    this.y = random(100, height);
  }
   
  void display(){
     this.head.display(this.x, this.y, this.size);
     this.body.display(this.x, this.y, this.size);
     this.arm.display(this.x, this.y, this.size, this.speed);
  }
   
  void update(){
     this.y -= 1 * speed;
  }
  
  
}
