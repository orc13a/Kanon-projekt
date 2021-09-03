class Canon extends Component {
  ArrayList<Ball> allBalls = new ArrayList<Ball>();
  float mouseDist = 0;
  Ball ballLoaded;
  float alphaV = 0;
  float hozLine = 0;
  float verLine = 0;
  
  Canon() {
    newBall();
  }
  
  void display() {
    for (Ball b : allBalls) {
      b.display();
      b.update();
    }
    
    alphaV = degrees(asin(verLine / mouseDist)); // Udregning af vinkel a
    
    line(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
    //line(ballLoaded.location.x, ballLoaded.location.y, mouseX, ballLoaded.location.y);
    //line(ballLoaded.location.x, ballLoaded.location.y, ballLoaded.location.x, mouseY);
  }
  
  void fire() {
    ballLoaded.velocity.x = (hozLine / 10) * (mouseDist / 100);
    ballLoaded.velocity.y = (verLine / 10) * (-mouseDist / 100);
    
    newBall();
  }
  
  void aim() {
    mouseDist = dist(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
    hozLine = dist(ballLoaded.location.x, ballLoaded.location.y, mouseX, ballLoaded.location.y);
    verLine = dist(ballLoaded.location.x, ballLoaded.location.y, ballLoaded.location.x, mouseY);
  }
  
  void newBall() {
    Ball newBall = new Ball();
    newBall.location.x = 200;
    newBall.location.y = 600;
    newBall.w = 20;
    newBall.h = 20;
    
    allBalls.add(newBall);
    ballLoaded = allBalls.get(allBalls.size() - 1);
  }
}
