class Bullet extends GameObject {

  Bullet() {
    x=myShip.x-w;
    y=myShip.y;
    w=5;
    h=10;
    dy=-16;
    hp=1;
    good=true;
  }
  Bullet(float _DX, float _DY) {
    x=myShip.x-w;
    y=myShip.y;
    dx=_DX;
    dy=_DY;
    w=5;
    h=10;
    hp=1;
    good=true;
  }
  Bullet(float _X, float _Y, float _DX, float _DY, boolean _GOOD) {
    x=_X;
    y=_Y;
    dx=_DX;
    dy=_DY;
    good=_GOOD;
    w=5;
    h=10;
    hp=1;
  }
  void show() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  void act() {
    x+=dx;
    y+=dy;
  }
  boolean isDead() {
    return y<0-w||hp<=0;
  }
}