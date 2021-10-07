class GameObject {
  int lives;
  PVector location;
  PVector velocity;
  int size; 

  GameObject() {
  }

  void show () {
  }

  void act () {
    location.add(velocity);

    if (location.y < -25) location.y = height + 25;
    if (location.y > height + 25) location.y = -25;
    if (location.x < -25) location.x = width + 25;
    if (location.x > width + 25) location.x = -25;
  }
}
