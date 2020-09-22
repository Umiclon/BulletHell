class Star extends GameObject {

  Star() {
    x=random(width);
    y=0;
    dx=0;
    dy=random(3, 5);
  }
  void show() {
    fill(255);
    rect(x, y, dy, dy);
  }
  void act() {  
    x+=dx;
    y+=dy;
  }
  boolean isDead() {
    return y>height;
  }
}