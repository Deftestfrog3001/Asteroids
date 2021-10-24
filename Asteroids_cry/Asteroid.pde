class Asteroid extends GameObject {

  //spawn asteroid
  Asteroid() {
    loc = new PVector(random(0, width), random(0, height));
    vel = new PVector(0, 1);
    vel.rotate(random(0, TWO_PI));
    size = 100;
    lives = 1;
  }

  //split asteroid
  Asteroid(int s, float x, float y) {
    lives = 5;
    loc = new PVector (x, y);
    vel = new PVector(0, 1);
    vel.rotate(random(0, TWO_PI));
    size = s;
  }

  void show() {
    fill(#40c27c);
    strokeWeight(1);
    stroke(255);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();

    //bullet collision
    int i = 0;
    while (i < myObject.size()) {
      GameObject myOb = myObject.get(i);
      if (myOb instanceof Bullet) {
        if (dist(loc.x, loc.y, myOb.loc.x, myOb.loc.y) <= size/2) {
          myOb.lives--;
          lives--;
          if (lives == 0) {
            AN++;
            if (size >= 12.5) {
              myObject.add(new Asteroid(size/2, loc.x, loc.y));
              myObject.add(new Asteroid(size/2, loc.x, loc.y));
            }
          }
        }
      }
      i++;
    }
  }
}
