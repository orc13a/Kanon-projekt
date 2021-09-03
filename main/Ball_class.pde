class Ball extends Component {
  color bColor = 0;
  
  Ball() {
    mass = 20;
    img = loadImage("canonBall.png");
  }
  
  void display() {
    //fill(bColor);
    //ellipse(location.x, location.y, w, h);
    image(img, location.x, location.y, w, h);
  }
  
  void applyForce(PVector force) {
    force.div(mass);
    acceleration.add(force);
  }
  
  void applyGravity(PVector g) {
    PVector newGravity;
    newGravity = g.copy();
    newGravity.div(mass);
    acceleration.add(newGravity);
  }
  
  void getFriction() {
    friction = velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(mass);
  }
  
  void checkGround() {
    if (location.y >= height - (w / 2)) {
      velocity.y *= -1;
      velocity.div(2.2); // Til at få kuglen til at hoppe rigtigt på jorden
      location.y = height - (w / 2);
    }
  }
  
  void update() {
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
