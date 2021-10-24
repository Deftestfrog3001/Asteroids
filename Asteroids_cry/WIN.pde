void win() {
  background(0);
  image(introgif[f], width/2, height/2, width, height);
  f = f + 1;
  if (f == NOF) {
    f = 0;
  }
  fill(#40c27c);
  text("YOU'VE WON", width/2+random(-2, 2), height/3-10+random(-2, 2));

  WBX = width/2;
  WBY = height/2 + 50;

  //WIN RESTART
  fill(#40c27c);
  textSize(35);
  if (dist(WBX, WBY, mouseX, mouseY)<50) {
    text("Restart?", WBX+random(-2, 2), WBY-75+random(-2, 2));
    button(WBX+random(-2, 2), WBY+random(-2, 2), #40c27c, #172311, 1.2);
  } else {
    text("Restart?", WBX, WBY-75);
    button(WBX, WBY, #40c27c, #172311, 1);
  }
}

void WinClicks() {
  if (dist(WBX, WBY, mouseX, mouseY)<50) {
    mode = GAME;
  }
}
