class Bullet extends GameObject{

  
  Bullet() {
   lives = 1; 
   location = new PVector(myShip.location.x,myShip.location.y);
   velocity = new PVector(myShip.direction.x,myShip.direction.y);
   velocity.setMag(5);
  }
  
  void show () {
    stroke(115,100,65);
    fill(115,100,100);
    ellipse(location.x+random(-2,2),location.y,5,15);  
  }
  
  void act () {
    super.act();
  }
}
