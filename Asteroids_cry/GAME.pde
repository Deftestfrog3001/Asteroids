void game() {
 background(0);
 text("lives :"+myShip.lives,100,50);

  
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
  
  /*GameObject myOb = myObject.get(i);
  if (myOb instanceof Asteroid) {
  }*/
}

void GameClicks() {
  
}
