class BossEnemy extends Enemy {

  BossEnemy(float _X, float _Y) {
    super(_X, _Y);
    x=random(200,1000);
    w=100;
    h=100;
    dy=3;
    hp=5000;
  }
  void show() {
    fill(250, 0, 0);
    rect(x, y, w, h);
  }
  void act() {
    if (y<=width/4) {
      y+=dy;
    }
    if (frameCount%18==0) {
      if (shotdx<12)shotdx=12;
      if (shotdy<12)shotdy=12;
      shotdx=myShip.x-x;
      shotdy=myShip.y-y;
      engine.add(new Bullet(x, y, shotdx/20, shotdy/20, false));
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