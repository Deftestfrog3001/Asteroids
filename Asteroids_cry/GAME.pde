void game() {
  myObject = new ArrayList<GameObject>();
  myShip = new Ship();
  myObject.add(myShip);
  myObject.add(new Asteroid());
  myObject.add(new Asteroid());
  myObject.add(new Asteroid());
  
    int i = 0;
  while (i < myObject.size()) {
    GameObject myOb = myObject.get(i);
    myOb.show();
    myOb.act();

    if (myOb.lives <= 0) {
      myObject.remove(i);
    } else {
      i++;
    }
  }
}

void GameClicks() {
  
}
