class Canon extends Component {
  ArrayList<Ball> allBalls = new ArrayList<Ball>(); // All kugler
  float firePower = 0; // Udregnede kraft til kuglen
  float mouseDist = 0; // Afstenden mellem musen og kuglen (ønskede kraft)
  Ball ballLoaded; // Den kugle som er i kanonen
  float alphaV = 0; // Ønskede vinkel
  float hozLine = 0; // Den vandrette side i trekanten til at udregne vinkel
  float verLine = 0; // Den lodrette side i trekanten til at udregne vinkel
  Ball HiddenBall; // En usynlig bold til at udregne kuglernes flyve bane
  
  Canon() {
    newBall();
    
    x = 200;
    y = 600;
    
    img = loadImage("Shotgunpepe.PNG");
    img.resize(200, 100);
    
    HiddenBall = new Ball();
  }
  
  void display() {
    // Tegn alle kugler
    for (Ball b : allBalls) { 
      b.update();
      b.display();
    }
    
    // Placer kanon billede og få det til at dreje med musen
    pushMatrix();
    translate(x - 20, y - 30);
    rotate(-radians(alphaV));
    image(img, 0, 0);
    popMatrix();
  }
  
  void fire() {
    if (aimCheck() == true) {
      // Her der udregner vi vinklen og ganger med kraften kuglen vil blive skud afsted med
      ballLoaded.velocity.x = (hozLine / 35) * firePower; // Giv kuglen den rigtige vinkel med kraf på x-aksen
      ballLoaded.velocity.y = (verLine / 35) * -firePower; // Giv kuglen den rigtige vinkel med kraf på y-aksen
      
      ballLoaded.fired = true;
      
      newBall(); // Sæt ny kugle i kanonen
    }
  }
  
  // Metoden udregner vinklen og afstanden mellem musen
  void aim() {
    if (aimCheck() == true) {
      // Udregn
      mouseDist = dist(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
      hozLine = dist(ballLoaded.location.x, ballLoaded.location.y, mouseX, ballLoaded.location.y);
      verLine = dist(ballLoaded.location.x, ballLoaded.location.y, ballLoaded.location.x, mouseY);
      
      getFirePower();
      
      alphaV = degrees(asin(verLine / mouseDist)); // Udregning af vinkel a
      // line(ballLoaded.location.x, ballLoaded.location.y, mouseX, mouseY);
      aimLine();
    }
  }
  
  // Metode til at tegne de punkter som viser kuglens bane inden den bliver affyrret
  void aimLine() {
    // Sæt bolden i kanonen
    HiddenBall.location.x = 200;
    HiddenBall.location.y = 600;
    
    getFirePower(); // Find styken af skudet
    HiddenBall.velocity.x = (hozLine / 35) * firePower; // Giv kuglen den rigtige vinkel med kraf på x-aksen
    HiddenBall.velocity.y = (verLine / 35) * -firePower; // Giv kuglen den rigtige vinkel med kraf på y-aksen
      
    HiddenBall.fired = true;
    
    for (int i = 1; i < 50; i++) {
      HiddenBall.update();
      
      // Tegn punkterne
      if (i % 5 == 0) {
        noStroke();
        fill(255);
        ellipse(HiddenBall.location.x, HiddenBall.location.y, 12, 12);
      }
    }
  }
  
  // Metode til at tjekke om musen er inde for området man må sigte i
  boolean aimCheck() {
    if (mouseX > ballLoaded.location.x && mouseY < ballLoaded.location.y) {
      return true;
    } else {
      return false;
    }
  }
  
  // Sætter firePower til en værdi alt efter hvilken zone musen er i
  void getFirePower() {   
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
