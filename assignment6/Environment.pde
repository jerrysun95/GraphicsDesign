


class Environment{
  ArrayList<Animal> animals;
  ArrayList<Food> food;
  ArrayList<Shrubbery> shrubbery;

  //used only for testing
  Environment(){
    animals = new ArrayList();
    food = new ArrayList();
    shrubbery = new ArrayList();
  }
  
  //add specified amount of each Animal
  Environment(int c, int d, int bj, int e, int a, int t){
    animals = new ArrayList();
    food = new ArrayList();
    shrubbery = new ArrayList();
    
    for (int i = 0; i < c; i ++){
      animals.add(new Cat(random(0, width), random(0, height)));
    }
    for (int i = 0; i < d; i ++){
      animals.add(new Dog(random(0, width), random(0, height)));
    }
    for (int i = 0; i < bj; i ++){
      animals.add(new Bluejay(random(0, width), random(0, height)));
    }
    for (int i = 0; i < e; i ++){
      animals.add(new Eagle(random(0, width), random(0, height)));
    }
    for (int i = 0; i < a; i ++){
      animals.add(new Ant(random(0, width), random(0, height)));
    }
    for (int i = 0; i < t; i ++){
      animals.add(new Tarantula(random(0, width), random(0, height)));
    }
    
    addFood(animals.size());
  }
  
  void simulate(){
    ArrayList<Animal> newAnimals = new ArrayList();
    ArrayList<Animal> deadAnimals = new ArrayList();
    ArrayList<Food> eatenFood = new ArrayList();
    for (Food f : food){
      f.display();
    }
    for (Animal a : animals){
      a.move();
      a.display();
    }
    for (Animal a : animals){
      //skip all actions if Animal is not alive
      if (a.isAlive){
        //loop through every Animal and check if Animal b is within Animal a's hitbox, contact
        for (Animal b : animals){
          //if (a.x < b.x && b.x < a.x+a.size && a.y < b.y && b.y < a.y+a.size){
          if (a.x < b.x+0.5*b.size && b.x+0.5*b.size < a.x+a.size && a.y < b.y+0.5*b.size && b.y+0.5*b.size < a.y+a.size && a != b){
            //a.contact(b);
            if (a.type == b.type){
              boolean isMating = a.tryMate(b);
              if (isMating){
                newAnimals.add(a.mate());
              }
            } else {
              a.contact(b);
            }
          }
        }
        
        //loop through all food to see if Animal eats food
        for (Food f : food){
          if (f.uneaten) {
            if (a.x < f.x+5 && f.x+5 < a.x + a.size && a.y < f.y+5 && f.y+5 < a.y + a.size){
              boolean eaten = a.tryEat(f);
              if (eaten){
                eatenFood.add(f);
              }
            } 
          } else {
            eatenFood.add(f);
          }
        }
        
      } else { //if the Animal is dead, add it to deadAnimals
        deadAnimals.add(a);
      }
    }
    
    //remove dead animals
    for (Animal deadAnimal : deadAnimals){
      animals.remove(deadAnimal);
    }
    //remove eaten food
    for (Food f : eatenFood){
      food.remove(f);
    }
    
    animals.addAll(newAnimals);
    
    //add food
    int numFood = 0;
    for (int i = 0; i < animals.size()*2; i++){
      if (random(0, 1) < 0.001){
        numFood ++;
      }
    }
    addFood(numFood);    
  }
  
  //adds an Animal or Food if user types specific key
  void addNew(char type){
    if (type == 'c'){
      animals.add(new Cat(random(0, width), random(0, height)));
    } else if (type == 'd'){
      animals.add(new Dog(random(0, width), random(0, height)));
    } else if (type == 'b'){
      animals.add(new Bluejay(random(0, width), random(0, height)));
    } else if (type == 'e'){
      animals.add(new Eagle(random(0, width), random(0, height)));
    } else if (type == 'a'){
      animals.add(new Ant(random(0, width), random(0, height)));
    } else if (type == 't'){
      animals.add(new Tarantula(random(0, width), random(0, height)));
    } else if (type == 'f'){
      food.add(new Food(random(0, width), random(0, height)));
    }
  }
  
  //deletes all Animals and Foods at mouseX and mouseY if any exist 
  void tryDelete(){
    for (Animal a : animals){
      if (a.x < mouseX && mouseX < a.x+a.size && a.y < mouseY && mouseY < a.y+a.size){
        a.isAlive = false;
      }
    }
    for (Food f : food){
      if (f.x < mouseX && mouseX < f.x+20 && f.y < mouseY && mouseY < f.y+20){
        f.uneaten = false;
      }
    }
  }
  
  void addFood(int numFood){
    for (int i = 0; i < numFood; i++){
      food.add(new Food((int) random(10, width - 10), (int) random(10, height - 10)));
    }
  }
}
