boolean Wkey, Skey, Akey, Dkey, Spacekey;
Ship myShip;
ArrayList<GameObject> myObject;

int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int WIN=3;
final int LOSS=4;

void setup () {
  frameRate(60);
  size(800, 800, FX2D);
  textAlign(CENTER,CENTER);
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  mode=INTRO;
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
