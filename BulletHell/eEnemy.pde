class Enemy extends GameObject {
  float shotdx, shotdy;
  Enemy(float _X, float _Y) {
    x=_X;
    y=_Y;
    w=50;
    h=50;
    dx=0;
    dy=6;
    hp=500;
  }
  void show() {
    fill(250, 0, 0);
    rect(x, y, w, h);
  }
  void act() {
    y+=dy;
    if (frameCount%60==0) {
      engine.add(new Bullet(x, y, 0, 24, false));
    }
    int n=0;
    while (n<engine.size()) {
      GameObject bullet=engine.get(n);
      if (bullet instanceof Bullet&&bullet.good==true) {
        if (rectRect(bullet.x, bullet.y, bullet.w, bullet.h, x, y, w, h)==true) {
          hp-=10;
          bullet.hp=0;
          for (int i = 0; i < 5; i++) 
            engine.add(new Piece(x, y));
        }
      }
      n++;
    }
  }
  boolean isDead() {
    return y>height+w||hp<=0;
  }
}