class DeathBlossom extends Gun {
  float dx, dy, a;
  DeathBlossom() {
    cd=0;
    threshold=24;
  }

  void shoot() {
    if (cd >= threshold) {
      while (a<=2*PI) {
        dx=10*cos(a);
        dy=10*sin(a);
        a+=PI/90;
        engine.add(new Bullet(myShip.x, myShip.y, dx, dy, true));
        cd=0;
      }
      println("pew");
      a=0;
    }
  }

  void recharge() {
    if (cd < threshold) {
      cd++;
    }
  }
}