// En klasse til at holde på variabler som vi ellers ville komme til at skulle skrive flere gange.
// Efter at klasserne skal bruge mange af de samme variabler.
// Derfor at vi bare en klasse til at holde dem alle, som vi kommer til at skulle bruge meget hos hver klasse.

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
  PImage img;
  
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
