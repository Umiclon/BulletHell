class Launcher extends GameObject {
  Launcher() {
    x=0;
    w=50;
    h=50;
    y=-h;
    dx=6;
    dy=0;
    a=0;
  }
  void show() {
    fill(255);
    ellipse(x, y, w, h);
  }
  void act() {
    if (x>width-w/2||x<w/2) dx=-dx;
    if (timer>150&&timer<1250) {
      sineWave();
    } else if (timer>1400&&timer<2500) {
      bossWave1();
      randomWave1();
    } else if (timer>2750&&timer<3750) {
      randomWave2();
      sineWave();
    } else if (timer>4000&&timer<5000) {
      bossWave2();
      randomWave2();
    } else if (timer>5250&&timer<6250) {
      randomWave1();
      randomWave1();
      randomWave2();
    } else if (timer>6500&&timer<7500) {
      randomWave1();
      randomWave2();
      bossWave2();
    } else if (timer>7500&&timer<8500) {
      randomWave1();
    } else if (timer>9000) {
      WIN=true;
      mode=GAMEOVER;
    }
  }

  void sineWave() {
    x=sin(a)*width/2+width/2;
    a+=0.02;
    if (frameCount%10==0) {
      engine.add(new Enemy(x, y));
    }
  }
  void randomWave1() { 
    x=random(w, width-w);
    if (frameCount%20==0) {
      engine.add(new Enemy(x, y));
    }
  }
  void randomWave2() { 
    x=random(w, width-w);
    if (frameCount%20==0) {
      engine.add(new FastEnemy(x, y));
    }
  }
  void bossWave1() {
    x=width/2;
    if (frameCount%500==0) {
      engine.add(new BossEnemy(x, y));
    }
  }
  void bossWave2() {
    x=random(width);
    if (frameCount%250==0) {
      engine.add(new BossEnemy(x, y));
    }
  }
  boolean isDead() {
    return false;
  }
}