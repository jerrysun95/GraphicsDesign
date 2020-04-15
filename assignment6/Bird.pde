

//Birds are not at the top of the foodchain, but they can see 360 degrees around themselves


class Bird extends Animal{
  
  Bird(float x, float y){
    super(x, y);
  }
  
}



class Bluejay extends Bird{
  
  Bluejay(float x, float y){
    super(x, y);
    type = "bluejay";
    speed = 6;
    attackTypes = new String[] {"ant", "tarantula"};
  }
  
  void display(){
    image(bluejay, x, y);
  }
  
  Animal mate(){
    return (new Bluejay(x, y));
  }
  
  void attack(Animal b){
    if (b.type == "ant"){
      //bluejay will always win
      kills(b);
    } else if (b.type == "tarantula"){
      //bluejay wins 70% of the time
      killsChance(b, 0.70);
    }
  }
  
}


class Eagle extends Bird{
  
  Eagle(float x, float y){
    super(x, y);
    speed = 5;
    type = "eagle";
    size = 40;
    attackTypes = new String[] {"bluejay", "cat", "tarantula"};
  }
  
  void display(){
    image(eagle, x, y);
  }
  
  Animal mate(){
    return (new Eagle(x, y));
  }
  
  void attack(Animal b){
    if (b.type == "bluejay"){
      //eagle will always win
      kills(b);
    } else if (b.type == "tarantula"){
      //eagle wins 80% of the time
      killsChance(b, 0.80);
    } else if (b.type == "cat"){
      //eagle wins 30% of the time
      killsChance(b, 0.30);
    }
  }
  
}
