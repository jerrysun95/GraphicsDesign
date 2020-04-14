


class Environment{
  ArrayList<Animal> animals;
  ArrayList<Food> food;
  ArrayList<Shrubbery> shrubbery;
  
  Environment(){
    animals = new ArrayList();
    food = new ArrayList();
    shrubbery = new ArrayList();
  }
  
  Environment(int c, int d, int bj, int e, int a, int t){
    
  }
  
  void simulate(){
    for (Animal a : animals){
      //if center of second animal is within Animal a's hitbox, contact
      for (Animal b : animals){
        if (a.x < b.x+0.5*b.size && b.x+0.5*b.size < a.x+a.size && a.y < b.y+0.5*b.size && b.y+0.5*b.size < a.y+a.size){
          a.contact(b);
        }
      }
      
      for (Food f : food){
        if (a.x < f.x+5 && f.x+5< a.x + a.size && a.y < f.y+5 && f.y+5 < a.y + a.size){
          a.tryEat(f);
        } 
      }
      
    }
    
  }
  
  void update(){
    
  }
  
}
