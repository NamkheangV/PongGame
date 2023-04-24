class Paddle {
  float x; 
  float y = height/2;
  float w = 10; 
  float h = 100;
  
  float ychange = 0;
  
  void show() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w ,h);
  }
  
  //Create paddle that have left base
  Paddle(boolean left) {
    if(left) {
      x = w;
    }else {
      x = width - w;
    }  
  }
  
  void move() {
    y += ychange;
    y = constrain(y, h/2, height-h/2);
  }
  
  void paddMove(float steps) {
    ychange = steps;
  }
}
