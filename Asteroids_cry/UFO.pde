class UFO extends GameObject {

  int randSideA;
  int randSideB;
  int UFOTimer;
  float size;

  UFO() {
    randSideA = int(random(1, 3));
    randSideB = int(random(1, 3));

    lives = 1;
    size = 50;
    UFOTimer = 0;


    if (randSideA == 1 && randSideB == 1) loc = new PVector(0 - random(30, 50), random(0, height));
    if (randSideA == 1 && randSideB == 2) loc = new PVector(width + random(30, 50), random(0, height));
    if (randSideA == 2 && randSideB == 1) loc = new PVector(random(0, width), 0 - random(30, 50));
    if (randSideA == 2 && randSideB == 2) loc = new PVector(random(0, width), height + random(30, 50));

    vel = new PVector(myShip.loc.x - loc.x, myShip.loc.y - loc.y);
    vel.setMag(1.25);
  }

  void act() {

    loc.add(vel);

    UFOTimer ++;
    if (UFOTimer >= 50) {
      myObject.add(new UFOBullet(loc.x, loc.y));
      UFOTimer = 0;
    }
    if (loc.x < -size) lives = 0;
    if (loc.x > width + size) lives = 0;
    if (loc.y < -size) loc.y = lives = 0;
    if (loc.y > height + size) lives = 0;

    int j = 0;
    while (j < myObject.size()) {
      GameObject myOb = myObject.get(j);
      if (myOb instanceof Bullet) {
        if (dist(loc.x, loc.y, myOb.loc.x, myOb.loc.y) <= size/2 + myOb.size/2) {
          myOb.lives = 0;
          lives = 0;
        }
      }
    }
    j ++;
  }

  void show() {
    fill(360, 100, 100);
    circle(loc.x, loc.y, size);
  }
}
