abstract class GameObject {
  float x, y, w, h, dx, dy, n, hp, a;
  boolean good, bad;
  GameObject() {
  }
  void show() {
  }
  void act() {
  }
  boolean isDead() {
    return false;
  }
}