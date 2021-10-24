class UFOBullet extends GameObject {

  int timerUFOB;

  UFOBullet(float o, float p) {

    timerUFOB = 120;
    size = 10;
    lives = 1;
    loc = new PVector(o, p);
    vel = new PVector(myShip.loc.x - loc.x, myShip.loc.y - loc.y);
    vel.setMag(3);
  }

  void act() {

    super.act();

    timerUFOB --;
    if (timerUFOB == 0) {
      lives = 0;
    }


    //Ship Collisions
    int q = 0;
    while (q < myObject.size()) {
      GameObject myOb = myObject.get(q);
      if (myOb instanceof Ship) {
        if (dist(loc.x, loc.y, myOb.loc.x, myOb.loc.y) < size/2 + 13 && myShip.Itimer < 0) {
          lives = 0;
          myOb.lives --;
          myShip.Itimer = 180;
        }
      }
      q ++;
    }
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    strokeWeight(1);
    stroke(360, 100, 65);
    fill(360, 100, 100);
    ellipse(0+random(-7.5, 7.5), 0+random(-7.5, 7.5), size+size/2, size-size/2);
    popMatrix();
  }
}
