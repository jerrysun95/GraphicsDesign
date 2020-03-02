


/*-----------------------------------------Robot-----------------------------------------*/



class Robot{
  float x, y, size, speed;
  RobotHead head;
  RobotBody body;
  RobotArm arm;
  RobotJetpack jpack;
  boolean randomized = false; //keeps track if default constructor was used
  
  //default constructor randomizes all values
  Robot(){
    randomized = true;
    this.y = random(100, height);
    randomize();
  }
  
  //overloaded constructor allows user to specify values
  Robot(float size, float speed, boolean headType, boolean armType, boolean position){
    this.size = size;
    this.speed = speed;
    this.y = random(100, height);
    randomize();
    this.head = new RobotHead(headType);
    this.body = new RobotBody();
    this.arm = new RobotArm(armType, position);
    this.jpack = new RobotJetpack(position);
  } 
  
  //if default constructor, randomizes size, speed, headType, armType, position, x
  //else, randomizes x
  void randomize(){
    if (this.randomized){ //if default constructor was called
      this.size = random(0.5, 1.1);
      this.speed = random(0.8, 2);
      boolean headType = true; 
      boolean armType = true;
      boolean position = true;
      if (random(0, 1) < 0.5){
        headType = false;
      }
      if (random(0, 1) < 0.5){
        armType = false;
      }
      if (random(0, 1) < 0.5){
        position = false;
      }
      
      this.head = new RobotHead(headType);
      this.body = new RobotBody();
      this.arm = new RobotArm(armType, position);
      this.jpack = new RobotJetpack(position);
    }
    this.x = random(10, width - 10);
  }
  
  //displays all parts
  void display(){
     this.head.display(this.x, this.y, this.size);
     this.body.display(this.x, this.y, this.size);
     this.jpack.display(this.x, this.y, this.size);
     this.arm.display(this.x, this.y, this.size, this.speed);
  }
   
  void update(){
     this.y -= 1 * speed;
     if (this.y < -50 * size - 25){
       this.y = height + 75 + (100 * size);
       randomize();
     }
  }
  
  
}



/*-----------------------------------------ZigZagRobot-----------------------------------------*/



class ZigZagRobot extends Robot{
  boolean goingRight = true;
  float motionCounter = 0;
  
  ZigZagRobot(){
    super();
  }
  
  ZigZagRobot(float size, float speed, boolean headType, boolean armType, boolean position){
    super(size, speed, headType, armType, position);
  }
  
  void update(){
    this.y -= 1 * speed;
    if (this.goingRight){
      this.x += 1 * speed;
    } else {
      this.x -= 1 * speed;
    }
    if (random(0, 1) < 0.01){
      goingRight = !goingRight;
    }
    if (this.y < -50 * size - 25){
       this.y = height + 75 + (100 * size);
       randomize();
       this.x = random(100, width - 100);
     }
  }
  
}
