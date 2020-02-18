int[][] vals; //stores frequency in vals[][0] and number of words with given frequency in vals[][1]
PFont sansSerif; //stores font

void setup(){
  String[] lines = loadStrings("../wordfrequency.txt");
  vals = new int[lines.length][2];
  getVals(lines);
  background(150, 150, 150);
  fullScreen();  
  
  //imports and sets font
  sansSerif = createFont("../ABeeZee-Regular.otf", 25);
  textFont(sansSerif);
}

void draw(){
  drawGraph();
}

//fills int[][] vals with frequency and number of words with given frequency 
void getVals(String[] lines){
  for (int i = 0; i < lines.length; i++){
    String[] splitLine = lines[i].split(": ");
    vals[i][0] = int(splitLine[0]);
    vals[i][1] = int(splitLine[1]);
  }
}

//draws graph and labels
void drawGraph(){
  int boxHeight = (displayHeight - 50) / vals.length; //height of box scaled to fit any size screen
  int center = (displayWidth - 50) / 2; //center of screen for easier drawing 
  float scalar = 1.0 * (displayWidth - 50) / vals[0][1]; //scalar for finding box width, based on screen size
  //print (boxHeight + " " + scalar + "\n");
  int yPos = displayHeight - 50; //keeps track of drawing position for rectangles
  color[] colors = new color[]{color(180, 60, 60), color(60, 180, 60), color(60, 60, 180)};

  //draws white border for text labels
  noStroke();
  fill(210);
  rectMode(CORNER);
  rect(0, displayHeight - 50, displayWidth, 50);
  rect(displayWidth - 50, 0, 50, displayHeight);
  stroke(1);
  line(displayWidth - 50, 0, displayWidth - 50, displayHeight - 50);
    
  rectMode(CENTER); //makes rectangle drawing much easier
  
  //draws graph
  for (int i = 0; i < vals.length; i++){
    fill(colors[i%3]);
    rect(center, yPos - boxHeight / 2, vals[i][1] * scalar, boxHeight);
    yPos -= boxHeight;
  } 
  
  //draws labels
  fill(0);
  textAlign(CENTER, CENTER);
  text("Number of Words per Frequency", center, displayHeight - 25);
  translate(displayWidth - 25, (displayHeight - 50) / 2);
  rotate(HALF_PI);
  text("Frequency", 0, 0);
  
}
