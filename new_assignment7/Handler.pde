


class Handler{
  Player p;
  boolean paused, lost;
  Platform[] plats;
  HUD hud;
  ArrayList<Bullet> bullets, removeBullets;
  Flag f; Box b; int boxCounter, nextBox;
  ArrayList<Enemy> enemies, removeEnemies;
  float difficulty;
  int selection;
  String[] loseOptions = new String[]{"RESTART", "QUIT"};
  String[] pauseOptions = new String[]{"CONTINUE", "RESTART", "QUIT"};
  
  Handler(){
    p = new Player();
    makePlats();
    hud = new HUD();
    f = new Flag(width-20, height-20-flag.height);
    bullets = new ArrayList<Bullet>(); removeBullets = new ArrayList<Bullet>();
    enemies = new ArrayList<Enemy>(); removeEnemies = new ArrayList<Enemy>();
    difficulty = 1;
    nextBox = 60;
  }
  
  void update(){
    if (!paused){
      checkLost();
      
      p.update();
      
      tryAdd();
      
      if (b != null){b.update();}
      
      for (Enemy e : enemies){
        e.update();
        if (!(p.x > e.x+e.size || b.x+pWalk[0].width < e.x) && !(p.y > e.y+e.size || p.y+pWalk[0].height < e.y)){
          p.die();
        }
      }
      
      for (Bullet b : bullets){
        for (Enemy e : enemies){
          if (!(b.x-2 > e.x+e.size || b.x+5 < e.x) && !(b.y-2 > e.y+e.size || b.y+5 < e.y)){
            removeEnemies.add(e);
            b.y = -10;
            removeBullets.add(b);
          }
        }
        b.update(); 
      }
      
      //remove all decayed bullets
      for (Bullet rB : removeBullets){
        bullets.remove(rB);
      }
      removeBullets.clear();
      
      //remove all dead enemies
      for (Enemy rE : removeEnemies){
        enemies.remove(rE);
      }
      removeEnemies.clear();
      
      if (b == null){
        boxCounter++;
        if (boxCounter >= nextBox) {//new box every 5 seconds
          b = new Box();
          boxCounter = 0;
          nextBox = 60*(int) random(1, 10);
        }
      } else { //if box exists, check for intersection with player
        if (!(p.x-2 > b.x+b.size || p.x+5 < b.x) && !(p.y-2 > b.y+b.size || p.y+5 < b.y)){
            p.setWeapon(b.getWeapon());
            difficulty += 0.05;
          b = null;
        }
      }
    }
  }
  
  void display(){
    if (!paused){
      background(100, 200, 200);
      for (int i = 0; i < plats.length; i++){
        plats[i].display();
      }
      
      hud.display();
      
      f.display();
      
      if (b != null){b.display();}
      
      for (Enemy e : enemies){
        e.display();
      }
      
      p.display();
      
      for (Bullet b : bullets){
        b.display();
      }
      
      
    } else {
      if (lost){
        loseScreen();
      } else {
        pauseScreen();
      }
    }
  }
  
  void loseScreen(){
    if (selection < 0){
      selection = loseOptions.length - 1;
    } else if (selection > loseOptions.length - 1){
      selection = 0;
    }
    for (int i = 0; i < loseOptions.length; i++){
      if (selection == i){
        fill(220, 100, 100);
      } else {
        fill(50);
      }
      pushMatrix();
      translate(200, 100 + i*50);
      text(loseOptions[i], 0, displayHeight = 25);
      popMatrix();
    }
  }
  
  void pauseScreen(){
    if (selection < 0){
      selection = pauseOptions.length - 1;
    } else if (selection > pauseOptions.length - 1){
      selection = 0;
    }
    
    for (int i = 0; i < pauseOptions.length; i++){
      if (selection == i){
        fill(220, 100, 100);
      } else {
        fill(50);
      }
      pushMatrix();
      translate(50, 100 + i*50);
      text(pauseOptions[i], 0, displayHeight = 25);
      popMatrix();
    }
  }
  
  void makePlats(){
    plats = new Platform[1];
    plats[0] = new Platform(0, height - 20, width, height);
  }
  
  float clamp(float x, float min, float max){
    if (x < min){
      return min;
    } else if (x > max){
      return max;
    }
    return x;
  }
  
  void checkLost(){
    for (Enemy e : enemies){
      if (e.x > width-10){
        lost = true;
        paused = true;
      }
    }
    if (p.dead){
      lost = true;
      paused = true;
    }
  }
  
  void tryAdd(){
    if (random(0, 1) < 0.005*difficulty){
      addEnemy(new Flyer());
    }
  }
  
  void addBullet(Bullet b){
    bullets.add(b);
  }
  
  void removeBullet(Bullet b){
    removeBullets.add(b);
  }
  
  void addEnemy(Enemy e){
    enemies.add(e);
  }
  
  void removeEnemy(Enemy e){
    removeEnemies.add(e);
  }
  
  void select(){
    if (!paused){
      paused = true;
      selection = 0;
    } else {
      if (!lost){
        if (selection == 0){
          paused = false;
        } else if (selection == 1){
          newGame();
        } else {
          exit();
        }
      } else {
        if (selection == 0){
          newGame();
        } else if (selection == 1){
          exit();
        }
      }
    }
  }
}
