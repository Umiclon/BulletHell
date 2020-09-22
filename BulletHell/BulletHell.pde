ArrayList<GameObject> engine;
boolean wkey, skey, akey, dkey, spacekey, WIN, LOSE;
Ship myShip;

final int INTRO=1;
final int PLAY=2;
final int GAMEOVER=3;
final int PAUSE=4;
int mode=INTRO, timer=0;
float x=600, y=625, w=230, h=75, font=75;

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  size(1200, 800, FX2D);

  engine=new ArrayList<GameObject>(10000);
  myShip=new Ship();
}

void draw() {
  if (mode==INTRO) {
    reset();
    runEngine();
    intro();
  } else if (mode==PLAY&mode!=PAUSE) {
    background(0);
    runEngine();
    timer+=1;
  } else if (mode==GAMEOVER) {
    gameOver();
  } else {
    println("error");
  }
  println(timer);

  engine.add(new Star());
}




void runEngine() {
  for (int i=engine.size()-1; i>=0; i--) {
    GameObject obj=engine.get(i);
    obj.show();
    obj.act();
    if (obj.isDead()) {
      engine.remove(i);
    }
  }
}


void reset() {
  timer=0; 
  WIN=false;
  LOSE=false;
}


void intro() {
  background(0);
  textAlign(CENTER);
  textSize(100);
  fill(255);
  text("BULLET HEAVEN", width/2, 200);
  textSize(50);
  text("KILL OR BE KILLED", width/2, 350);
  text("WASD TO MOVE YOUR SHIP", width/2, 400);
  text("PRESS P TO PAUSE", width/2, 450);
  text("CLICK TO UNPAUSE", width/2, 500);
  rect(x, y, w, h);
  if (mouseX>485&&mouseX<715&&mouseY>587.5&&mouseY<662.5) {
    w=287.5;
    h=93.75;
    font=86.75;
  } else {
    w=230;
    h=75;
    font=75;
  }
  textSize(font);
  fill(0);
  text("START", width/2, 650);
}




void gameOver() {
  if (WIN==true) {
    LOSE=false;
  }
  if (LOSE==true) {
    WIN=false;
  }
  background(0);
  fill(255);
  if (WIN==true&&LOSE==false) {
    text("VICTORY", width/2, height/2);
  } else if (LOSE==true&&WIN==false) {
    text("DEFEAT", width/2, height/2);
  }
}




void keyPressed() {
  if (key=='w'||key=='W')wkey=true;  
  if (key=='s'||key=='S')skey=true;
  if (key=='a'||key=='A')akey=true; 
  if (key=='d'||key=='D')dkey=true;
  if (key==' ')spacekey=true;
}




void keyReleased() {
  if (key=='w'||key=='W')wkey=false;  
  if (key=='s'||key=='S')skey=false;
  if (key=='a'||key=='A')akey=false; 
  if (key=='d'||key=='D')dkey=false;
  if (key==' ')spacekey=false;
  if (key=='p'||key=='P')mode=PAUSE;
}




void mouseReleased() {
  if (mode==INTRO) {
    mode=PLAY;
    engine.add(myShip);
    engine.add(new Launcher());
  } else if (mode==PAUSE) {
    mode=PLAY;
  } else if (mode==GAMEOVER) {
    mode=INTRO;
  }
}