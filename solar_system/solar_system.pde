Sun s = new Sun(300, 300, 50);
Planet p1 = new Planet(s, 20, 25);
Moon p1m1 = new Moon(p1, 5, 4);

Planet p2 = new Planet(s, 10, 55, 1.3);
Moon p2m1 = new Moon(p2, 3, 9);

Planet p3 = new Planet(s, 40, 110, 0.9);
Moon p3m1 = new Moon(p3, 8, 7);
Moon p3m2 = new Moon(p3, 13, 16, 0.5);


void setup() {
  fullScreen();
  background(25);
  ellipseMode(CENTER);
  
  p2.counterclockwise();
  //p2m1.counterclockwise();
  
  //p1m1.counterclockwise();
  p3m2.counterclockwise();
}


void draw() {
  background(25);
  s.display();
  p1.update();
  p1m1.update();
  
  p2.update();
  p2m1.update();
  
  p3.update();
  p3m1.update();
  p3m2.update();
}
