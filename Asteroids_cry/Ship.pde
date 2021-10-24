class Ship extends GameObject {

  //Instance variables
  int tTimer;
  boolean safe = true;
  int tpoint;
  int thopstop;
  PVector direction;
  int Itimer, V;
  int shotTimer, threshold;
  PVector randomloc;

  //Constructors
  Ship () {
    lives = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 1;
    Itimer = 0;
    V = 180;
    size = 100;
    tTimer = 0;
  }

  //Behaviour Funcs
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(direction.heading());
    noStroke();
    fill(#ffffff);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    println(vel);
    popMatrix();
  }

  void act() {
    super.act();

    shotTimer++;
    Itimer++;

    //speed limiter
    if (vel.mag() > 25) {
      vel.setMag(25);
    }

    //movement
    if (Wkey) {
      vel.add(direction);
      myObject.add(new Fire());
    }
    if (Skey) vel.sub(direction);
    if (Akey) direction.rotate(-radians(5));
    if (Dkey) direction.rotate(radians(5));
    if (Spacekey && shotTimer > threshold) {
      myObject.add(new Bullet());
      shotTimer = 0;
    }

    //ship collision
    int i = 0;
    println(Itimer, V);
    while (i < myObject.size()) {
      GameObject myOb = myObject.get(i); 
      if (myOb instanceof Asteroid) {
        if (dist(loc.x, loc.y, myOb.loc.x, myOb.loc.y) <= size/2+myOb.size/2) {
          if (Itimer > V) {
            myOb.lives--;
            lives--;
            Itimer=0;
          }
          if (myOb.lives == 0 && size >= 12.5) {
            myObject.add(new Asteroid(size/2, loc.x, loc.y));
            myObject.add(new Asteroid(size/2, loc.x, loc.y));
          }
        }
      }
      i++;
    }

    //TPcode
    tTimer ++;
    thopstop ++;
    if (Shiftkey && tTimer > 500) {
      thopstop = 0;
      Itimer = 0;
      tpoint = 0;
      boolean safe = false;
      while (safe == false && tpoint < 10000) {

        //Rando TP
        randomloc = new PVector(random(100, width-100), random(100, height-100));

        //Proximity
        int u = 0;
        safe = true;
        while (u < myObject.size()) {
          GameObject myOb = myObject.get(u);
          if (myOb instanceof Asteroid && dist(randomloc.x, randomloc.y, myOb.loc.x, myOb.loc.y) < 100 + myOb.size) {
            safe = false;
          } else if (myOb instanceof UFO && dist(randomloc.x, randomloc.y, myOb.loc.x, myOb.loc.y) < 100 + myOb.size) {
            safe = false;
          } else if (myOb instanceof UFOBullet && dist(randomloc.x, randomloc.y, myOb.loc.x, myOb.loc.y) < 100 + myOb.size) {
            safe = false;
          }
          u ++;
        }

        tpoint ++;
      }
      if (safe) {
        tpoint = 0;
        tTimer = 0;
        //successful teleport
        loc = new PVector(randomloc.x, randomloc.y);
      }
    }
  }
}
