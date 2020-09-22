class Piece extends GameObject {

  Piece(float _x, float _y) {
    x=_x;
    y=_y;
    dx=random(-10, 10);
    dy=random(-10, 10);
    w=10;
    h=10;
    a=255;
  }

  void show() {
    fill(255, 0, 0, a);
    rect(x, y, w, h);
  }

  void act() {
    x+=dx;
    y+=dy;
    a-=15;
  }
  boolean isDead() {
    return a<0;
  }
}