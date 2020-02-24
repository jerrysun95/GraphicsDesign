class Sun {
  float x; 
  float y; 
  int radius;

  Sun(float x, float y, int radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  void display() {
    fill(230, 230, 120);
    circle(x, y, radius);
  }
}
