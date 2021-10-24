class Fire extends GameObject {
  
  int t;
  PVector nudge;
  
  Fire() {
    lives = 1;
    size = 10;
    t = 255;
    loc = myShip.loc.copy();
    vel = myShip.direction.copy();
    vel.rotate(PI+random(-.25,.25));//180degrees
    vel.setMag(random(5,10));
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(20);
    loc.add(nudge);
  }
  
  void show() {
   noStroke();
   fill(15,100,100,t);
   //triangle(loc.x,loc.y,loc.x-5,loc.y-10,loc.x+5,loc.y-10);
   square(loc.x,loc.y,size);
  }
  
  void act() {
    super.act();
    t = t - 15;
    if (t <= 0) lives = 0;
  }
}
