void keyPressed() {
  if (key == 'W')           Wkey = true;
  if (key == 'S')           Skey = true;
  if (key == 'A')           Akey = true;
  if (key == 'D')           Dkey = true;
  if (key == ' ')       Spacekey = true;
  if (keyCode == SHIFT) Shiftkey = true;
  if (keyCode == 'P')       Pkey = true;
}

void keyReleased() {
  if (key == 'W')           Wkey = false;
  if (key == 'S')           Skey = false;
  if (key == 'A')           Akey = false;
  if (key == 'D')           Dkey = false;
  if (key == ' ')       Spacekey = false;
  if (keyCode == SHIFT) Shiftkey = false;
  if (keyCode == 'P')       Pkey = false;
}

void mouseReleased() {
  if (mode == INTRO) {
    IntroClicks ();
  } else if (mode == GAME) {
    GameClicks ();
  } else if (mode == PAUSE) {
    PauseClicks ();
  } else if (mode == WIN) {
    WinClicks ();
  } else if (mode == LOSS) {
    LossClicks ();
  }
}
