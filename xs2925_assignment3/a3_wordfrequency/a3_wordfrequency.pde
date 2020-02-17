String[] lines;
color[] colors;

void setup(){
  size (600, 500);
  lines = loadStrings("../wordfrequency.txt");  
}


void draw(){
  printStrings();
}


void printStrings(){
  
  int totalSize = 0;
  
  for (int i = 0; i < lines.length; i++){
    drawCircle(lines[i]);
  }
}


void drawCircle(String line){
  String[] vals = line.split(": ");
  int freq = int(vals[0]); //frequency
  int size = int(vals[1]); //number of words with frequency count
  //print (freq + " " + size + "\n");
}
