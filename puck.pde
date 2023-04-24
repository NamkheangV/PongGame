class Puck {
  //set middle of the window
  float x = width/2;
  float y = height/2;
  
  float xspeed;
  float yspeed;
  float r = 12;
  
  int winScore = 5;
  
  Puck() {
    reset();
  }
  
  //draw the ball
  void show() {
    fill(255);
    ellipse(x, y, r*2, r*2);
  }
  
  //Make the ball move
  void ballMove() {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void edges() {
    //make ball dont get off the screen
    if(y < 0 || y > height) {
      yspeed *= -1;
    }
    
    //reset ball when it get pass the screen
    if(x > width) {
      leftScore++;
      reset();
    }
    if(x < 0) {
      rightScore++;
      reset();
    }
  }
  
  //set ball back to center
  void reset() {
    x = width/2;
    y= height/2;
    float angle = random(TWO_PI);
    xspeed = 10 * cos(angle);
    yspeed = 10 * sin(angle);
  }
  
  //Check when ball touch the Paddle
  void checkPaddleLeft(Paddle p) {
    if(y < p.y + p.h/2 && y > p.y - p.h/2 && x - r < p.x + p.w/2) {
      xspeed *= -1;
    }
  }
  
  void checkPaddleRight(Paddle p) {
    if(y < p.y + p.h/2 && y > p.y - p.h/2 && x + r > p.x - p.w/2) {
      xspeed *= -1;
    }
  }
  
  void resetScore() {
    leftScore = 0;
    rightScore = 0;
  }
  
  void winner() {
    if (leftScore == winScore) {
      gameEndPage("Player 1 Wins!");
    }
    if(rightScore == winScore) {
      gameEndPage("Player 2 Wins!");
    }
  }
  
  void gameEndPage(String text) {  
    xspeed = 0;
    yspeed = 0;
    
    text(text, width/2, height/3);
    text("R to play Again", width/2, height/3 + 40);
  }
}
