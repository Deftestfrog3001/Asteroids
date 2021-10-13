void intro() {
  background(0);
  textFont(Tron);
  image(introgif[f], width/2, height/2, width, height);
  f = f + 1;
  if (f == NOF) {
    f = 0;
  }

  fill(#40c27c);
  textSize(80);
  text("Byte Defender", width/2, height/2-10);

  textSize(35);
  text("Start", ABX, ABY-75);
  text("Quit", BBX, BBY-75);

  //buttons
  ABX = width/4;
  ABY = height-100;
  BBX = width/4+width/4+width/4;
  BBY = height-100;
  //button(ABX, ABY+random(-3,3), #40c27c, #172311, 1);
  button(ABX, ABY, #40c27c, #172311, 1);
  button(BBX, BBY, #40c27c, #172311, 1);
}

void IntroClicks() {
  if (dist(ABX, ABY, mouseX, mouseY)<50) {
    mode = GAME;
  }
}
