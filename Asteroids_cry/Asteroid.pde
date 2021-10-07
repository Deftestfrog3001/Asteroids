class Asteroid extends GameObject {

  Asteroid() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
    lives = 50;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }

  void show() {
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    int i = 0;
    while (i < myObject.size()) {
      GameObject myOb = myObject.get(i);
      if (myOb instanceof Bullet) {
        if (dist(location.x, location.y, myOb.location.x, myOb.location.y) <= size/2) {
          myOb.lives = 0;
          lives--;
          if (lives == 0 && size >= 12.5) {
            myObject.add(new Asteroid(size/2, location.x, location.y));
            myObject.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }
      i++;
    }
  }
}
