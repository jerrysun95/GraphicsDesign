

//Mammals are on the highest end of the food chain, but constantly lose stamina to body heat.


class Mammal extends Animal{
  float bodyHeat; //if bodyHeat decreases to below 80, Mammal will die
  
  
  Mammal(float x, float y){
    super(x, y);
    bodyHeat = 90;
  }
  
  void update(){
    if (stamina < 0){
      bodyHeat -= 0.5;
    } else if (stamina > 0){
      bodyHeat += 0.5;
    }
    if (bodyHeat > 90){
      bodyHeat = 90;
    } else if (bodyHeat < 80){
      isAlive = false;
    }
  }
}



class Cat extends Mammal{
  
  Cat(float x, float y){
    super(x, y);
    type = "cat";
    speed = 4;
    size = 50;
    attackTypes = new String[] {"bluejay", "eagle", "dog"};
  }
  
  void display(){
    image(cat, x, y);
  }
  
  Animal mate(){
    return (new Cat(x, y));
  }
  
  void attack(Animal b){
    if (b.type == "bluejay"){
      //cat always wins
      kills(b);
    } else if (b.type == "eagle"){
      //cat wins 70% of the time
      killsChance(b, 0.70);
    } else if (b.type == "dog"){
      //cat wins 40% of the time
      killsChance(b, 0.40);
    }
  }
}



class Dog extends Mammal{
  
  Dog(float x, float y){
    super(x, y);
    type = "dog";
    speed = 3;
    size = 50;
    attackTypes = new String[] {"eagle", "cat"};
  }
  
  void display(){
    image(dog, x, y);
  }
  
  Animal mate(){
    return (new Dog(x, y));
  }
  
  void attack(Animal b){
    if (b.type == "eagle"){
      //dog wins 80% of the time
      killsChance(b, 0.80);
    } else if (b.type == "cat"){
      //cat wins 60% of the time
      killsChance(b, 0.60);
    }
  }
}
