class Component {
  float x;
  float y;
  float mass;
  float w;
  float h;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  PVector friction;
  boolean fired = false;
  
  Component() {
    location = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    gravity = new PVector(0, 9.82);
    friction = velocity.get();
  }
  
  void display() {
    
  }
}
