abstract class Gun {
  float cd, threshold ;  
  Gun() {
  }
  void shoot() {
    if (cd<=threshold) {

      cd=0;
    }
  }
  void recharge() {
    if (cd<threshold) {
      cd++;
    }
  }
}