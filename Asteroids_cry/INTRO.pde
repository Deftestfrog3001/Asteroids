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
  text("Byte Defender", width/2+random(-2, 2), height/2-10+random(-2, 2));

  //buttons
  ABX = width/4;
  ABY = height-100;
  BBX = width/4+width/4+width/4;
  BBY = height-100;

  //Start Button
  fill(#40c27c);
  textSize(35);
  if (dist(ABX, ABY, mouseX, mouseY)<50) {
    text("Start", ABX+random(-2, 2), ABY-75+random(-2, 2));
    button(ABX+random(-2, 2), ABY+random(-2, 2), #40c27c, #172311, 1.2);
  } else {
    text("Start", ABX, ABY-75);
    button(ABX, ABY, #40c27c, #172311, 1);
  }

  //Quit Button
  fill(#40c27c);
  textSize(35);
  text("Quit", BBX+random(-2, 2), BBY-75+random(-2, 2));
  if (dist(BBX, BBY, mouseX, mouseY)<50) {
    button(BBX+random(-2, 2), ABY+random(-2, 2), #40c27c, #172311, 1.2);
  } else {
    button(BBX, ABY, #40c27c, #172311, 1);
  }
}

void IntroClicks() {
  if (dist(ABX, ABY, mouseX, mouseY)<50) {
    mode = GAME;
  }
}
