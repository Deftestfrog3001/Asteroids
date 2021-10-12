int ABX;
int ABY;
int BBX;
int BBY;

void button(int x, int y, int c, int C) {
  pushMatrix();
  translate(x, y);
  rectMode(CENTER);
  stroke(c);
  fill(C);
  strokeWeight(5);
  ellipse(0, 25, 125, 75);
  arc(0, 25, 100, 50, 0, PI, OPEN);
  ellipse(0, 0, 100, 50);
  line(50, 25, 50, 0);
  line(-50, 25, -50, 0);
  rectMode(CORNER);
  popMatrix();
}
