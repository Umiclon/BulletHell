class SprayGun extends Gun {
  SprayGun() {
    cd=0;
    threshold=16;
  }
  void shoot() {
    if (cd==threshold) {
      engine.add(new Bullet(myShip.x, myShip.y, -2, -16, true));
      engine.add(new Bullet(myShip.x, myShip.y, 2, -16, true));
      engine.add(new Bullet(myShip.x, myShip.y, -1, -16, true));
      engine.add(new Bullet(myShip.x, myShip.y, 1, -16, true));  
      engine.add(new Bullet(myShip.x, myShip.y, 0, -16, true));
      cd=0;
    }
  }
  void recharge() {
    if (cd<threshold) {
      cd++;
    }
  }
}