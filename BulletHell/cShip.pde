class Ship extends GameObject {
  Gun myGun;
  float hpx, hpy;
  boolean onekey, twokey; 
  Ship() {
    x=width/2;
    y=height-250;
    w=40;
    h=40;
    hp=1000;
    myGun=new DeathBlossom();
    hpy=25;
  }

  void show() {
    fill(50, 255, 50);
    rect(x, y, w, h);
    rectMode(CORNER);
    hpx=map(hp, 0, 1000, 0, 250);
    rect(200, 50, hpx, hpy);  
    rectMode(CENTER);
  }
  void act() {
    if (hp<=0) {
      hpx=0;
    }
    dx=dx*0.5;
    dy=dy*0.5;
    myGun.recharge();

    if (wkey)dy=-12;
    if (skey)dy=12;
    if (akey)dx=-12;
    if (dkey)dx=12;
    if (spacekey)myGun.shoot();
    if (onekey)myGun=new SprayGun();
    if (x<=w/2) x=w/2;
    if (x>=width-w/2) x=width-w/2;
    if (y<=h/2) y=h/2;
    if (y>=height-h/2) y=height-h/2;

    x+=dx;
    y+=dy;

    int n=0;
    while (n<engine.size()) {
      GameObject bullet=engine.get(n);
      if (bullet instanceof Bullet&&bullet.good==false) {
        if (rectRect(bullet.x, bullet.y, bullet.w, bullet.h, x, y, w, h)==true) {
          hp-=10;
          bullet.hp=0;
          for (int i = 0; i < 4; i++) 
            engine.add(new Piece(x, y));
        }
      }
      n++;
    }
    if(hp<=0){
      LOSE=true;
      mode=GAMEOVER;
    }
  }
  boolean isDead() {
    return false;
  }
}