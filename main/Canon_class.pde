class Canon extends Component {
  ArrayList<Ball> allBalls = new ArrayList<Ball>(); // All kugler
  float firePower = 0; // Afstenden mellem musen og kuglen (ønskede kraft)
  Ball ballLoaded; // Den kugle som er i kanonen
  float alphaV = 0; // Ønskede vinkel
  float hozLine = 0; // Den vandrette side i trekanten til at udregne vinkel
  float verLine = 0; // Den lodrette side i trekanten til at udregne vinkel
  
  Canon() {
    newBall();
  }
  
  void display() {
    // Tegn alle kugler
    for (Ball b : allBalls) { 
      b.update();
      b.display();
    }
    
    alphaV = degrees(asin(verLine / firePower)); // Udregning af vinkel a
    text(firePower, 100, 100);
    //line(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
    //line(ballLoaded.location.x, ballLoaded.location.y, mouseX, ballLoaded.location.y);
    //line(ballLoaded.location.x, ballLoaded.location.y, ballLoaded.location.x, mouseY);
  }
  
  void fire() {
    if (aimCheck() == true) {
      ballLoaded.velocity.x = (hozLine / 35) * firePower; // Giv kuglen den rigtige vinkel med kraf på x-aksen
      ballLoaded.velocity.y = (verLine / 35) * -firePower; // Giv kuglen den rigtige vinkel med kraf på y-aksen
      
      ballLoaded.fired = true;
      
      newBall();
    }
  }
  
  void aim() {
    if (aimCheck() == true) {
      // Udregn
      getFirePower();
      hozLine = dist(ballLoaded.location.x, ballLoaded.location.y, mouseX, ballLoaded.location.y);
      verLine = dist(ballLoaded.location.x, ballLoaded.location.y, ballLoaded.location.x, mouseY);
      
      line(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
    }
  }
  
  boolean aimCheck() {
    if (mouseX > ballLoaded.location.x && mouseY < ballLoaded.location.y) {
      return true;
    } else {
      return false;
    }
  }
  
  void getFirePower() {
    float mouseDist = dist(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
    
    if (mouseDist < 200) {
      firePower = 0.5;
    }
    
    if (mouseDist > 200 && mouseDist < 400) {
      firePower = 0.8;
    }
    
    if (mouseDist > 400 && mouseDist < 600) {
      firePower = 1;
    }
    
    if (mouseDist > 600 && mouseDist < 800) {
      firePower = 1.2;
    }
    
    if (mouseDist > 800 && mouseDist < 1000) {
      firePower = 1.5;
    }
  }
  
  // Til at lave en nu kugle som sidder i kanonen.
  void newBall() {
    Ball newBall = new Ball();
    newBall.location.x = 200;
    newBall.location.y = 600;
    newBall.w = 30;
    newBall.h = 30;
    
    allBalls.add(newBall);
    ballLoaded = allBalls.get(allBalls.size() - 1);
  }
}
