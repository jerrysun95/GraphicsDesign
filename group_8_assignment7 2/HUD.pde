


class HUD{
  int score;
  
  HUD(){
    score = 0;
  }
  
  void display(){
    pushMatrix();
    fill(0);
    //textAlign(CENTER, CENTER);
    translate(50, 50);
    text("SCORE " + score, 0, displayHeight = 25);
    popMatrix();
  }
}
