import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class solar_system extends PApplet {

Sun s = new Sun(300, 300, 50);
Planet p1 = new Planet(s, 20, 25);
Moon p1m1 = new Moon(p1, 5, 4);

Planet p2 = new Planet(s, 10, 55, 1.3f);
Moon p2m1 = new Moon(p2, 3, 9);

Planet p3 = new Planet(s, 40, 110, 0.9f);
Moon p3m1 = new Moon(p3, 8, 7);
Moon p3m2 = new Moon(p3, 13, 16, 0.5f);


public void setup() {
  background(25);
  
  ellipseMode(CENTER);
  
  p2.counterclockwise();
  //p2m1.counterclockwise();
  
  //p1m1.counterclockwise();
  p3m2.counterclockwise();
}


public void draw() {
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
class Moon extends Planet{
  Planet p;
  
  Moon(Planet p, int radius, float distance) {
    super(p.s, radius, distance);
    this.p = p;
  }
  
  Moon(Planet p, int radius, float distance, float speed) {
    super(p.s, radius, distance, speed);
    this.p = p;
  }
  
  //sets angle equal to host Planet's angle
  public void updateAngle(){
    //if (clockwise){
    //  angle = p.angle;
    //  if (angle > TWO_PI){
    //    angle = 0;
    //  }
    //} else {
    //  angle = -p.angle;
    //  //if (angle < 0) {
    //  //  angle = TWO_PI;
    //  //}
    //}
    
    angle = p.angle;
  }
  
  //moves and draws Moon relative to host Planet
  public void update(){
    fill(150, 150, 210);
    
    pushMatrix();
    translate(s.x, s.y);
    rotate(abs(angle));
    translate(p.distance + s.radius/2, p.distance + s.radius/2);
    rotate(angle * speed);
    //if (clockwise){
    //  circle(distance + p.radius/2, distance + p.radius/2, radius);
    //} else {
    //  circle(-(distance + p.radius/2), -(distance + p.radius/2), radius);
    //}
    
    if (p.clockwise){
      circle(distance + p.radius/2, distance + p.radius/2, radius);
    } else {
      
    }
    popMatrix();
    
    updateAngle();
    
  }
  
}
class Planet {
  Sun s; 
  int radius; 
  float speed; 
  float distance;
  float angle;
  boolean clockwise;

  //default constructor has speed = 1
  Planet(Sun s, int radius, float distance) {
    this.radius = radius;
    this.speed = 1;
    this.distance = distance;
    this.s = s;
    this.angle = 0;
    this.clockwise = true;
  }
  
  //overloaded constructor has modifiable speed
  Planet(Sun s, int radius, float distance,  float speed) {
    this.radius = radius;
    this.distance = distance;
    this.speed = speed;
    this.s = s;
    this.angle = 0;
    this.clockwise = true;
  }

  //sets direction to clockwise
  public void clockwise(){
    //speed = abs(speed);
    clockwise = true;
  }
  
  //sets direction to counterclockwise
  public void counterclockwise(){
    speed = -abs(speed);
    clockwise = false;
  }
  
  //adds or subtracts to angle, depending on boolean clockwise
  public void updateAngle(){
    
    angle += 0.01f * speed;
    
    //if (clockwise){
    //  angle += 0.01 * speed;
    //  //if (angle > TWO_PI){
    //  //  angle = 0;
    //  //}
    //} else {
    //  angle -= 0.01 * speed;
    //  //if (angle < 0){
    //  //  angle = TWO_PI;
    //  //}
    //}
  }

  //moves and draws Planet relative to host Sun
  public void update() {
    fill(150, 210, 150);
    pushMatrix();
    translate(s.x, s.y);
    rotate(angle);
    circle(distance + s.radius/2, distance + s.radius/2, radius);
    popMatrix();
    resetMatrix();
    
    updateAngle();
    
  }
}
class Sun {
  float x; 
  float y; 
  int radius;

  Sun(float x, float y, int radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  public void display() {
    fill(230, 230, 120);
    circle(x, y, radius);
  }
}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "solar_system" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
