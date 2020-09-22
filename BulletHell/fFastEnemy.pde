class FastEnemy extends Enemy {

  FastEnemy(float _X, float _Y) {
    super(_X, _Y);
    dy=12;
    hp=250;
  }
  void show() {
    fill(250, 0, 0);
    rect(x, y, w, h);
  }
  void act() {
    y+=dy;
    int n=0;
    if (frameCount%60==0) {
      if (shotdx<12)shotdx=12;
      if (shotdy<12)shotdy=12;
      shotdx=myShip.x-x;
      shotdy=myShip.y-y;
      engine.add(new Bullet(x, y, shotdx/20, shotdy/20, false));
    }
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