class Fire extends GameObject {
  
  int t;
  PVector nudge;
  
  Fire() {
    lives = 1;
    size = 10;
    t = 255;
    location = myShip.location.copy();
    velocity = myShip.direction.copy();
    velocity.rotate(PI+random(-.25,.25));//180degrees
    velocity.setMag(random(5,10));
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(20);
    location.add(nudge);
  }
  
  void show() {
   noStroke();
   fill(15,100,100,t);
   square(location.x,location.y,size);
  }
  
  void act() {
    super.act();
    t = t - 15;
    if (t <= 0) lives = 0;
  }
}
