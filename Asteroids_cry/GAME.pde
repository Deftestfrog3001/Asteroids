void game() {
  background(0);
  fill(#40c27c);
  text("lives :"+myShip.lives, 100, 50);

  if (Pkey) mode = PAUSE;

  timerUFO ++;
  if (timerUFO >= 1000) {
    myObject.add(new UFO());
    timerUFO = 0;
  }

  //Teleport Timer
  rectMode(CORNER);
  noStroke();

  //Timer not done
  if (myShip.tTimer <= 900) {
    rect(50, height - 100, myShip.tTimer/6, 50);
  }   

  //Timer done
  if (myShip.tTimer > 900) {
    rect(50, height - 100, 150, 50);

    textSize(18);
    fill(255);
    text("Press SHIFT to Teleport", 125, height - 110);
  }
  noFill();
  strokeWeight(4);
  stroke(255);
  rect(50, height - 100, 150, 50);
  strokeWeight(1);
  rectMode(CENTER);


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
  if (myShip.lives==0) {
    mode = LOSS;
  }

  if (AN == 45) {
    mode = WIN;
  }
  println(mode);
  println(AN);
}

void GameClicks() {
}
