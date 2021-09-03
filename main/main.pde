// ----------------------------------------
// Gustav og Oliver C | DDU 2 - HCØL
// ----------------------------------------

PImage backgroundImg;
Canon canon;

void setup() {
  size(1200, 700);
  smooth(8);
  // pixelDensity(2);
  imageMode(CENTER);
  
  backgroundImg = loadImage("FantasyKanonbackground.jpg");
  
  canon = new Canon();
}

void draw() {
  clear();
  background(255);
  image(backgroundImg, (width / 2), (height / 2));
  
  canon.display();
  canon.aim();
}

void keyPressed() {
  if (key == ' ') {
    canon.fire();
  }
}
