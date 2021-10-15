class Ship extends GameObject {

  //Instance variables
  PVector direction;
  int ROFTimer, threshold;
  int Itimer, V;

  //Constructors
  Ship () {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    ROFTimer = 0;
    threshold = 1;
    Itimer = 0;
    V = 180;
    size = 100;
  }

  //Behaviour Funcs
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noStroke();
    fill(#ffffff);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    println(velocity);
    popMatrix();
  }

  void act() {
    super.act();

    ROFTimer++;
    Itimer++;

    //speed limiter
    if (velocity.mag() > 25) {
      velocity.setMag(25);
    }

    //movement
    if (Wkey) {
      velocity.add(direction);
      myObject.add(new Fire());
    }
    if (Skey) velocity.sub(direction);
    if (Akey) direction.rotate(-radians(5));
    if (Dkey) direction.rotate(radians(5));
    if (Spacekey && ROFTimer > threshold) {
      myObject.add(new Bullet());
      ROFTimer = 0;
    }

    //ship collision
    int i = 0;
    println(Itimer, V);
    while (i < myObject.size()) {
      GameObject myOb = myObject.get(i); 
      if (myOb instanceof Asteroid) {
        if (dist(location.x, location.y, myOb.location.x, myOb.location.y) <= size/2+myOb.size/2) {
          if (Itimer > V) {
            myOb.lives--;
            lives--;
            Itimer=0;
          }
          if (myOb.lives == 0 && size >= 12.5) {
            myObject.add(new Asteroid(size/2, location.x, location.y));
            myObject.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }
      i++;
    }
  }
}
