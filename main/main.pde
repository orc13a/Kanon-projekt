// ----------------------------------------
// Gustav og Oliver C | DDU 2 - HCØL
// ----------------------------------------

Canon canon;

void setup() {
  size(1200, 700);
  smooth(8);
  // pixelDensity(2);
  
  canon = new Canon();
}

void draw() {
  clear();
  background(255);
  
  canon.display();
}
