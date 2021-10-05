boolean Wkey, Skey, Akey, Dkey, Spacekey;
Ship myShip;
ArrayList<Bullet> myBullet;

void setup () {
  size(800, 800, FX2D);
  imageMode(CENTER);
  myShip = new Ship();
  myBullet = new ArrayList<Bullet>();
  colorMode(HSB, 360, 100, 100);
}

void draw () {
  background(0);
  myShip.show();
  myShip.act();

  int i = 0;
  while (i < myBullet.size()) {
    Bullet b = myBullet.get(i);
    b.show();
    b.act();
    i++;
  }
}

void keyPressed() {
  if (key == 'W')    Wkey = true;
  if (key == 'S')  Skey = true;
  if (key == 'A')  Akey = true;
  if (key == 'D') Dkey = true;
  if (key == ' ')   Spacekey = true;
}

void keyReleased() {
  if (key == 'W')    Wkey = false;
  if (key == 'S')  Skey = false;
  if (key == 'A')  Akey = false;
  if (key == 'D') Dkey = false;
  if (key == ' ')   Spacekey = false;
}
