class Canon extends Component {
  ArrayList<Ball> allBalls = new ArrayList<Ball>();
  float mouseDist = 0;
  Ball ballLoaded;
  float alphaV = 0;
  float hozLine = 0;
  float verLine = 0;
  
  Canon() {
    Ball newBall = new Ball();
    newBall.location.x = 200;
    newBall.location.y = 600;
    newBall.w = 20;
    newBall.h = 20;
    
    allBalls.add(newBall);
    
    ballLoaded = allBalls.get(0);
  }
  
  void display() {
    for (Ball b : allBalls) {
      b.display();
      b.update();
    }
    //line(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
    line(ballLoaded.location.x, ballLoaded.location.y, mouseX, ballLoaded.location.y);
    line(ballLoaded.location.x, ballLoaded.location.y, ballLoaded.location.x, mouseY);
  }
  
  void fire() {
    
  }
  
  void aim() {
    mouseDist = dist(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
    hozLine = dist(ballLoaded.location.x, ballLoaded.location.y, mouseX, ballLoaded.location.y);
    verLine = dist(ballLoaded.location.x, ballLoaded.location.y, ballLoaded.location.x, mouseY);
  }
}
