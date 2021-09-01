class Canon extends Component {
  ArrayList<Ball> allBalls = new ArrayList<Ball>();
  
  Canon() {
    Ball newBall = new Ball();
    newBall.location.x = 200;
    newBall.location.y = 600;
    newBall.w = 20;
    newBall.h = 20;
    
    allBalls.add(newBall);
  }
  
  void display() {
    for (Ball b : allBalls) {
      b.display();
      b.update();
    }
  }
  
  void fire() {
    
  }
  
  void aim() {
    
  }
}
