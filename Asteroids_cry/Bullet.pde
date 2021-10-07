class Bullet extends GameObject {

  int timer;
  PVector nudge;

  Bullet() {
    timer = 120;
    lives = 1; 
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    velocity.add(myShip.velocity);
    size = 10;
    nudge = myShip.direction.copy();
    nudge.setMag(25);
    location.add(nudge);
  }

  void show () {
    pushMatrix();
    translate(location.x,location.y);
    rotate(velocity.heading());
    strokeWeight(1);
    stroke(115, 100, 65);
    fill(115, 100, 100);
    ellipse(0+random(-7.5, 7.5), 0+random(-7.5, 7.5), size+size/2, size-size/2);
    popMatrix();
  }

  void act () {
    super.act();

    timer--;
    if (timer <= 0) {
      lives = 0;
    }
  }
}
