class Ship extends GameObject{

  //Instance variables
  PVector direction;

  //Constructors
  Ship () {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
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

    if (Wkey) velocity.add(direction);
    if (Skey) velocity.sub(direction);
    if (Akey) direction.rotate(-radians(5));
    if (Dkey) direction.rotate(radians(5));
    if (Spacekey) myBullet.add(new Bullet());
  }
}
