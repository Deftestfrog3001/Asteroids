class Bullet extends GameObject {

  int timer;
  PVector nudge;

  Bullet() {
    timer = 120;
    lives = 1; 
    loc = new PVector(myShip.loc.x, myShip.loc.y);
    vel = new PVector(myShip.direction.x, myShip.direction.y);
    vel.setMag(10);
    vel.add(myShip.vel);
    size = 10;
    nudge = myShip.direction.copy();
    nudge.setMag(25);
    loc.add(nudge);
  }

  void show () {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(vel.heading());
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
