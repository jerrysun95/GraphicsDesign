


PShape satellite;
PShape ufo;

Sun s;
Sun q;

Star[] st = new Star[100];


void setup(){
  //size(800, 600, P3D);
  fullScreen(P3D);
  noStroke();
  //camera(width/2, height/2 - 500, 0, width/2, height/2, 0, 0, 0, 1);

  satellite = loadShape("objects/satellite.obj");
  ufo = loadShape("objects/ufo.obj");
  
  
  s = new Sun(width/2, height/2, 60);
  s.p = new Planet[] {new Planet(10, 20, -2), new Planet(6, 50, 0.6), new Planet(20, 120, 1.3), new Planet(40, 210, 0.8)};
  s.p[0].m = new Moon[] {new Moon(5, 5, 1.6), new Satellite(2, 0, -0.7)};
  s.p[1].m = new Moon[] {new Moon(2, 2, -0.8)};
  s.p[2].m = new Moon[] {new Satellite(6, 9, 2.7), new UFO(5, 0, -1)};
  s.p[3].m = new Moon[] {new UFO(5, 0, -1), new UFO(5, 0, -1), new UFO(5, 0, -1), new UFO(5, 0, -1), new UFO(5, 0, -1)};
  for (int i = 0; i < s.p[3].m.length; i++){
    s.p[3].m[i].angle = (TWO_PI / s.p[3].m.length) * i;
  }
  s.p[3].addMoon(new Moon(5, 6, -0.7));
  s.p[3].addMoon(new Moon(3, 12, 1.4));
  
  for (int i = 0; i < st.length; i++){
    st[i] = new Star();
  }
  
  
  q = new Sun(100, 100, 40);
  
}



void draw(){
  background(25);
  lights();
  
  for (int i = 0; i < st.length; i++){
    st[i].display();
  }
  
  s.display();
  
}
