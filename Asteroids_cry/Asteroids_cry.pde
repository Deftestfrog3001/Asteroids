boolean Wkey, Skey, Akey, Dkey, Spacekey;
Ship myShip;
ArrayList<GameObject> myObject;

void setup () {
  frameRate(60);
  size(800, 800, FX2D);
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  myObject = new ArrayList<GameObject>();
  myShip = new Ship();
  myObject.add(myShip);
  myObject.add(new Asteroid());
  myObject.add(new Asteroid());
  myObject.add(new Asteroid());
}

void draw () {
  background(0);  

  int i = 0;
  while (i < myObject.size()) {
    GameObject myOb = myObject.get(i);
    myOb.show();
    myOb.act();

    if (myOb.lives <= 0) {
      myObject.remove(i);
    } else {
      i++;
    }
  }
}

void keyPressed() {
  if (key == 'W')     Wkey = true;
  if (key == 'S')     Skey = true;
  if (key == 'A')     Akey = true;
  if (key == 'D')     Dkey = true;
  if (key == ' ') Spacekey = true;
}

void keyReleased() {
  if (key == 'W')     Wkey = false;
  if (key == 'S')     Skey = false;
  if (key == 'A')     Akey = false;
  if (key == 'D')     Dkey = false;
  if (key == ' ') Spacekey = false;
}
