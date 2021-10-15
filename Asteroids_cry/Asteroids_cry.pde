boolean Wkey, Skey, Akey, Dkey, Spacekey;
Ship myShip;
ArrayList<GameObject> myObject;

PFont Tron;
PImage[] introgif;
PImage SpaceShip;
PImage Enemy;
PImage Chrome;
int NOF;
int f;
int AN;

int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int WIN=3;
final int LOSS=4;

void setup () {
  frameRate(60);
  //fullScreen(FX2D);
  size(800, 800, FX2D);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  Tron = createFont("Tr2n.ttf", 1);
  NOF = 7;
  introgif = new PImage[NOF];
  int f = 0;
  while (f < NOF) {
    introgif[f] = loadImage("frame_"+f+"_delay-0.06s.png");
    f=f+1 ;
  }
  mode=INTRO;

  myObject = new ArrayList<GameObject>();
  myShip = new Ship();
  myObject.add(myShip);
  myObject.add(new Asteroid());
  myObject.add(new Asteroid());
  myObject.add(new Asteroid());
}

void draw () {

  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode==PAUSE) {
    pause();
  } else if (mode==WIN) {
    win();
  } else if (mode==LOSS) {
    loss();
  } else {
    println("Error: mode =" + mode);
  }
}
