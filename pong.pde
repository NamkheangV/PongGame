Puck puck;
Paddle left;
Paddle right;

int leftScore = 0;
int rightScore = 0;


void setup() {
  size(600, 400);
  puck = new Puck();
  
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw() {
  background(0);
  
  puck.checkPaddleLeft(left);
  puck.checkPaddleRight(right);
  
  left.show();
  right.show();
  left.move();
  right.move();
  
  puck.ballMove();
  puck.edges();
  puck.show();
  puck.winner();
  
  fill(255);
  textSize(40);
  textAlign(CENTER,CENTER); 
  text(leftScore, 120, 45);
  text(rightScore, width-155, 45);
}

void keyPressed() {
  if(key == 'w') {
    left.paddMove(-10);
  }else if(key == 's') {
    left.paddMove(10);
  }
  
  if(keyCode == UP) {
    right.paddMove(-10);
  }else if(keyCode == DOWN) {
    right.paddMove(10);
  }
  
  if(key == 'r') {
    puck.resetScore();
    puck.reset();
  }
  
  if(key == 't') {
    puck.reset();
  }
}

void keyReleased() {
  left.paddMove(0);
  right.paddMove(0);
}
