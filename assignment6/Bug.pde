

//Bugs are on the lowest end of the foodchain but can hide in shrubbery.


class Bug extends Animal{
  
  Bug(float x, float y){
    super(x, y);
  }  
}



class Ant extends Bug{
  
  Ant(float x, float y){
    super(x, y);
    type = "ant";
    speed = 8;
    size = 20;
    attackTypes = new String[] {"tarantula"};
  }
  
  
  void display(){
    image(ant, x, y);
  }
  
  Animal mate(){
    return (new Ant(x, y));
  }
  
  void attack(Animal b){
    if (b.type == "tarantula"){
      //ant wins 25% of the time
      killsChance(b, 0.25);
    }
  }
}



class Tarantula extends Bug{
  
  Tarantula(float x, float y){
    super(x, y);
    type = "tarantula";
    speed = 5;
    size = 40;
    attackTypes = new String[] {"ant", "bluejay"};
  }
  
  
  void display(){
    image(tarantula, x, y);
  }
  
  Animal mate(){
    return (new Tarantula(x, y));
  }
  
  void attack(Animal b){
    if (b.type == "ant"){
      //tarantula  wins 75% of the time
      killsChance(b, 0.75);
    } else if (b.type == "bluejay"){
      //tarantula wins 30% of the time
      killsChance(b, 0.30);
    } 
  }
}
