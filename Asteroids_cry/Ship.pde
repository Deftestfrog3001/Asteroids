class Ship extends GameObject{

  //Instance variables
  PVector direction;
  int ROFTimer, threshold;

  //Constructors
  Ship () {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    ROFTimer = 0;
    threshold = 1;
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
    
    //speed limiter
    if (velocity.mag() > 35) {
     velocity.setMag(35);
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
  }
}
