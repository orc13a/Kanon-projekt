class Ball extends Component {
  color bColor = 0;
  
  Ball() {
    mass = 20;
    img = loadImage("canonBall.png");
  }
  
  void display() {
    image(img, location.x, location.y, w, h);
  }
  
  // Metode til at tilføje en ønsked kraft på kuglen
  void applyForce(PVector force) {
    force.div(mass);
    acceleration.add(force);
  }
  
  // Metode til at tilføje tyngdekraft på kuglen
  void applyGravity(PVector g) {
    PVector newGravity;
    newGravity = g.copy();
    newGravity.div(mass);
    acceleration.add(newGravity);
  }
  
  // Metode til at finde friktionen, altså hvordan kuglen skal reagere med jorden
  void getFriction() {
    friction = velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(mass);
  }
  
  // Metode til at se om kuglen rammer jorden
  void checkGround() {
    if (location.y >= height - (w / 2)) {
      velocity.y *= -1;
      velocity.div(2.2); // Til at få kuglen til at hoppe rigtigt på jorden
      location.y = height - (w / 2);
    }
  }
  
  // Metode der opdatere alle kuglens værdier
  void update() {
    // Kun tilføje disse kræfter når kuglen er blevet skudt afsted
    if (fired == true) {
      applyForce(friction);
      applyGravity(gravity);
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    checkGround();
  }
}
