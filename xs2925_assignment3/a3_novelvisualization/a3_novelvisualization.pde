
PFont courier; 
String[] lines;
String bigText;
ArrayList<String> randWords;

void setup() {
  size (700, 600);
  courier = createFont("Courier", 32);
  textFont(courier);
  noLoop();
  lines = loadStrings("../uniquewords.txt");
  background(#fafafa);

}

ArrayList<String> rand(){
  String output = new String();
  float upper = lines.length;
  ArrayList<String> newArr = new ArrayList<String>();
  for(int i = 0; i < 200; i++){
    newArr.add(lines[int(random(0, float(lines.length)))]);
    
  }
  for(int j =0; j < newArr.size(); j++){
    output = output + newArr.get(j) + " ";
    //output.concat(newArr.get(j));
  }
  return newArr;
}

void draw(){ 
  color c1 = #e88523;
  color c2 = #84cbd1;
  color c3 = #94bd8a;
  color[] colors = {c1, c2, c3};
  randWords = rand();
  textAlign(LEFT);
  textSize(20);
  float x =20;
  float y = 20;
  float num = randWords.get(1).length();
  int count =0;
  for (int i = 0 ; i < randWords.size(); i++) {
   if (count >= 3){
     count =0;
   }
   if(y >= height - 60 && x >= width-20){
     break;
   }
   if(x >= width-20 || textWidth(randWords.get(i)) + x >= width){
     y += 50;
     x = 20;
   }
   fill(colors[count]);    

   text(randWords.get(i), x, y, 600, 700);
   num = textWidth(randWords.get(i));
   x = x+ (num+20);
   println(num);
   count += 1;
   } 
}
