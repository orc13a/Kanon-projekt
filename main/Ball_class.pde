class Ball extends Component {
  color bColor = 0;
  
  Ball() {
    
  }
  
  void display() {
    fill(bColor);
    ellipse(location.x, location.y, w, h);
  }
  
  void update() {
    
  }
}
