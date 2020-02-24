class Robot {
  float x, y, radius, speed;
 
  // default constructor
  Robot() {
    x = 50;
    y = 50;
    radius = 10;
    speed = 5;
  }
 
  // custom constructor
  Robot(float x, float y, float radius, float speed) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speed = speed;
  };
 
  // display the spot
  void display() {
    fill(255);
    ellipse(x, y, radius, radius);
  }
 
  // move the spot
  void move() {
    // randomize direction
    int directionX = (int )(Math.random() * 2 + 1);
    int directionY = (int )(Math.random() * 2 + 1);
    
    // if spot at border ensure move in other direction
    if (x == width) {
      directionX = 2;
    }
    if (y == height) {
      directionY = 2;
    }
    if (x == 0) {
      directionX = 1;
    }
    if (y == 0) {
      directionY = 1;
    }
    
    // move spot in set directions with given speed
    if (directionX == 1) {
      x += speed;
    } else {
      x -= speed;
    }
    if (directionY == 1) {
      y += speed;
    } else {
      y -= speed;
    }
  }
}
