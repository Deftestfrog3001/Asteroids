void loss() {
  background(255);
  image(introgif[f], width/2, height/2, width, height);
  f = f + 1;
  if (f == NOF) {
    f = 0;
  }
  fill(#40c27c);
  text("YOU'VE BEEN DEFEATED", width/2+random(-2, 2), height/3-10+random(-2, 2));

  LBX = width/2;
  LBY = height/2 + 50;

  //LOSS RESTART
  fill(#40c27c);
  textSize(35);
  if (dist(LBX, LBY, mouseX, mouseY)<50) {
    text("Restart?", LBX+random(-2, 2), LBY-75+random(-2, 2));
    button(LBX+random(-2, 2), LBY+random(-2, 2), #40c27c, #172311, 1.2);
  } else {
    text("Restart?", LBX, LBY-75);
    button(LBX, LBY, #40c27c, #172311, 1);
  }
}

void LossClicks() {
    if (dist(LBX, LBY, mouseX, mouseY)<50) {
    mode = GAME;
  }
}
